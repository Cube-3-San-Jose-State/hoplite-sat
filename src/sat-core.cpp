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

#include "sat-core/sat-core.hpp"

namespace hal::sat_core {

result<sat_core> sat_core::create(hal::serial& pi_serial)
{
  sat_core new_sat_core(pi_serial);
  return new_sat_core;
}

hal::result<std::span<hal::byte>> sat_core::recieve_rpi()
{
  auto data_recieved = HAL_CHECK(m_rpi_serial->read(m_rpi_buffer)).data;
  return data_recieved;
}

hal::status sat_core::transmit_rpi(std::string_view message)
{
  hal::write(*m_rpi_serial, message);
  return hal::success();
}

}  // namespace hal::sat_core
