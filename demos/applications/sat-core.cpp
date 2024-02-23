// Copyright 2023 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <bitset>
#include <libhal-util/serial.hpp>
#include <libhal-util/steady_clock.hpp>
#include <string>

#include "../hardware_map.hpp"
#include <sat-core/sat-core.hpp>
#include <telemetry-recorder/telemetry-recorder.hpp>

/**
 * @brief Appends a checksum to a string
 * @param s The string to append the checksum to
 * @return The string with the checksum appended

*/
std::string appendCheckSum(std::string s)
{
  // find checksum
  int count_nums = 0;
  for (char c : s) {
    count_nums += static_cast<int>(c);
  }

  // append checksum to string s
  return s.substr(0, s.size() - 3) +
         ",\n  \"Checksum\": " + std::to_string(count_nums) +
         s.substr(s.size() - 3);
}

/**
 * @brief Verifies the checksum of a string
 * @param s The string to verify the checksum of
 * @return True if the checksum is correct, false otherwise
 */
bool verifyCheckSum(std::string s)
{
  // find predicted checksum
  int predicted_checksum =
    stoi(s.substr(s.find("Checksum") + 11, s.size() - 3));

  // find original json
  std::string original =
    s.substr(0, s.find("Checksum") - 5) + s.substr(s.size() - 3);

  // find checksum of original json
  int count_nums = 0;
  for (char c : original) {
    count_nums += static_cast<int>(c);
  }

  return count_nums == predicted_checksum;
}

hal::status application(hardware_map& p_map)
{
  using namespace std::chrono_literals;
  using namespace hal::literals;

  auto& clock = *p_map.clock;
  auto& console = *p_map.console;
  auto& rpi = *p_map.rpi;
  auto& gps = *p_map.gps;
  auto& i2c = *p_map.i2c;

  hal::print(console,
             "\n\nTelemetry Recorder Starting. May take a few seconds...\n\n");

  (void)hal::delay(clock, 100ms);
  auto neoGPS = HAL_CHECK(hal::neo::neo_m9n::create(gps));
  (void)hal::delay(clock, 100ms);
  auto mpl_device = HAL_CHECK(hal::mpl::mpl3115a2::create(
    i2c,
    hal::mpl::mpl3115a2::mpl_os_rate::os64));  // change barometer sampling rate
  (void)hal::delay(clock, 100ms);
  auto icm_device = HAL_CHECK(hal::icm::icm20948::create(i2c));
  (void)hal::delay(clock, 100ms);

  auto telemetry_recorder =
    HAL_CHECK(hal::telemetry_recorder::telemetry_recorder::create(
      icm_device, neoGPS, mpl_device));

  auto hoplite = HAL_CHECK(hal::sat_core::sat_core::create(rpi));

  icm_device.init_mag();
  (void)hal::delay(clock, 100ms);
  icm_device.auto_offsets();

  auto alt_offset = 80;
  mpl_device.set_altitude_offset(alt_offset);  // set initial altitude offset
  float slp = 101325;                          // Default is 101325 Pa
  mpl_device.set_sea_pressure(slp);

  while (true) {
    hal::print(console, "\n=================== Data ===================\n");
    auto telemetry_recorder_data = HAL_CHECK(telemetry_recorder.record());

    // ======= Uncomment this if you want to check for full GPS lock =======

    // if (telemetry_recorder_data.gps_locked == false) {
    //   hal::print(console, "!!!GPS not fully locked!!!\n");
    // } else {
    //   hal::print(console, "GPS locked\n");
    //   auto gps_offset =
    //     HAL_CHECK(telemetry_recorder.gps_baro_altitude_offset());
    //   mpl_device.set_altitude_offset(gps_offset);
    // }

    char telem_data[512];
    snprintf(telem_data,
             sizeof(telem_data),
             "{\n"
             "  \"G-Accel Values\": {\"x\": %fg, \"y\": %fg, \"z\": %fg},\n"
             "  \"Gyro Values\": {\"x\": %f, \"y\": %f, \"z\": %f},\n"
             "  \"Mag Values\": {\"x\": %f, \"y\": %f, \"z\": %f},\n"
             "  \"IMU Temperature\": %f,\n"
             "  \"Barometer Temperature\": %f,\n"
             "  \"Measured Pressure\": %f,\n"
             "  \"Barometer Measured Altitude\": %f,\n"
             "  \"GPS\": {\n"
             "    \"Latitude\": %f,\n"
             "    \"Longitude\": %f,\n"
             "    \"Number of satellites seen\": %d,\n"
             "    \"Altitude\": %f,\n"
             "    \"Time\": %f\n"
             "  }\n"
             "}\n",
             telemetry_recorder_data.accel_x,
             telemetry_recorder_data.accel_y,
             telemetry_recorder_data.accel_z,
             telemetry_recorder_data.gyro_x,
             telemetry_recorder_data.gyro_y,
             telemetry_recorder_data.gyro_z,
             telemetry_recorder_data.mag_x,
             telemetry_recorder_data.mag_y,
             telemetry_recorder_data.mag_z,
             telemetry_recorder_data.imu_temp,
             telemetry_recorder_data.baro_temp,
             telemetry_recorder_data.baro_pressure,
             telemetry_recorder_data.baro_altitude,
             telemetry_recorder_data.gps_lat,
             telemetry_recorder_data.gps_long,
             telemetry_recorder_data.gps_sats,
             telemetry_recorder_data.gps_alt,
             telemetry_recorder_data.gps_time);

    // add checksum
    telem_data = appendCheckSum(telem_data);

    hal::print<512>(console, telem_data);

    hoplite.transmit_rpi(telem_data);

    auto recieved_data = HAL_CHECK(hoplite.recieve_rpi());

    hal::print(console,
               "\n=================== RECIEVED PI DATA ===================\n");
    hal::print(console, recieved_data);
    hal::print(console, "\n\n============================================\n\n");

    hal::delay(clock, 500ms);
  }

  return hal::success();
}
