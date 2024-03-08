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

#pragma once

#include <libhal/functional.hpp>
#include <libhal/serial.hpp>
#include <span>

#include <libhal-util/serial.hpp>
#include <libhal/timeout.hpp>
#include <libhal/units.hpp>

#include <telemetry-recorder/telemetry-recorder.hpp>

namespace hal::sat_core {
class sat_core
{

public:
  [[nodiscard]] static result<sat_core> create(hal::serial& p_serial);

  hal::result<std::span<hal::byte>> recieve_rpi();

  hal::status transmit_rpi(std::string_view message);

private:
  explicit sat_core(hal::serial& p_serial)
    : m_rpi_serial(&p_serial)
  {
  }

  hal::serial* m_rpi_serial;
  std::array<hal::byte, 512> m_rpi_buffer;
};
}  // namespace hal::sat_core
