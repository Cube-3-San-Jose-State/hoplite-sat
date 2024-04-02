

# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()

message(STATUS "Using Conan toolchain: ${CMAKE_CURRENT_LIST_FILE}")

if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeToolchain' generator only works with CMake >= 3.15")
endif()


include("C:/Users/daphn/.conan2/p/b/arm-ga1169d8b67717/p/res/toolchain.cmake")


########## generic_system block #############
# Definition of system, platform and toolset
#############################################

# Cross building
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)




set(CMAKE_C_COMPILER "arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++")
set(CMAKE_ASM_COMPILER "arm-none-eabi-as")


add_compile_definitions(_GLIBCXX_USE_CXX11_ABI=0)


message(STATUS "Conan toolchain: C++ Standard 20 with extensions OFF")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Extra c, cxx, linkflags and defines
string(APPEND CONAN_CXX_FLAGS " -mfloat-abi=hard -mcpu=cortex-m4 -mfpu=auto -fno-exceptions -fno-rtti -mthumb -ffunction-sections -fdata-sections")
string(APPEND CONAN_C_FLAGS " -mfloat-abi=hard -mcpu=cortex-m4 -mfpu=auto -mthumb -ffunction-sections -fdata-sections")
string(APPEND CONAN_EXE_LINKER_FLAGS " --specs=nano.specs --specs=nosys.specs --specs=picolibc.specs -mfloat-abi=hard -mcpu=cortex-m4 -mfpu=auto -fno-exceptions -fno-rtti -mthumb -ffunction-sections -fdata-sections")


if(DEFINED CONAN_CXX_FLAGS)
  string(APPEND CMAKE_CXX_FLAGS_INIT " ${CONAN_CXX_FLAGS}")
endif()
if(DEFINED CONAN_C_FLAGS)
  string(APPEND CMAKE_C_FLAGS_INIT " ${CONAN_C_FLAGS}")
endif()
if(DEFINED CONAN_SHARED_LINKER_FLAGS)
  string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${CONAN_SHARED_LINKER_FLAGS}")
endif()
if(DEFINED CONAN_EXE_LINKER_FLAGS)
  string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${CONAN_EXE_LINKER_FLAGS}")
endif()

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(_CMAKE_IN_TRY_COMPILE)
    message(STATUS "Running toolchain IN_TRY_COMPILE")
    return()
endif()

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)

# Definition of CMAKE_MODULE_PATH
# the generators folder (where conan generates files, like this toolchain)
list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Definition of CMAKE_PREFIX_PATH, CMAKE_XXXXX_PATH
# The Conan local "generators" folder, where this toolchain is saved.
list(PREPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} )
list(PREPEND CMAKE_PROGRAM_PATH "C:/Users/daphn/.conan2/p/cmakefbe68aefa534a/p/bin" "C:/Users/daphn/.conan2/p/b/arm-ga1169d8b67717/p/bin/bin")
list(PREPEND CMAKE_LIBRARY_PATH "C:/Users/daphn/.conan2/p/b/sat-cc271c1df99040/p/lib" "C:/Users/daphn/.conan2/p/telem3ad2a98db9b0f/p/lib" "C:/Users/daphn/.conan2/p/libhad21ac9408c04f/p/lib" "C:/Users/daphn/.conan2/p/libhadc34950f59ccb/p/lib" "C:/Users/daphn/.conan2/p/libha5dcc9d985f3ba/p/lib" "C:/Users/daphn/.conan2/p/libhac9a6203da3932/p/lib" "C:/Users/daphn/.conan2/p/boost0919ce5474dfb/p/lib")
list(PREPEND CMAKE_INCLUDE_PATH "C:/Users/daphn/.conan2/p/b/sat-cc271c1df99040/p/include" "C:/Users/daphn/.conan2/p/telem3ad2a98db9b0f/p/include" "C:/Users/daphn/.conan2/p/libhad21ac9408c04f/p/include" "C:/Users/daphn/.conan2/p/ring-9f549177d28e3/p/include" "C:/Users/daphn/.conan2/p/libhadc34950f59ccb/p/include" "C:/Users/daphn/.conan2/p/libha5dcc9d985f3ba/p/include" "C:/Users/daphn/.conan2/p/libhac9a6203da3932/p/include" "C:/Users/daphn/.conan2/p/libhaebe27e4f0d66f/p/include" "C:/Users/daphn/.conan2/p/tl-fu31454aa876889/p/include" "C:/Users/daphn/.conan2/p/boost0919ce5474dfb/p/include")

if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_PACKAGE OR CMAKE_FIND_ROOT_PATH_MODE_PACKAGE STREQUAL "ONLY")
    set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE "BOTH")
endif()
if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_PROGRAM OR CMAKE_FIND_ROOT_PATH_MODE_PROGRAM STREQUAL "ONLY")
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM "BOTH")
endif()
if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_LIBRARY OR CMAKE_FIND_ROOT_PATH_MODE_LIBRARY STREQUAL "ONLY")
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY "BOTH")
endif()
if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_INCLUDE OR CMAKE_FIND_ROOT_PATH_MODE_INCLUDE STREQUAL "ONLY")
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE "BOTH")
endif()


if (DEFINED ENV{PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR};$ENV{PKG_CONFIG_PATH}")
else()
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR};")
endif()




# Variables
# Variables  per configuration


# Preprocessor definitions
# Preprocessor definitions per configuration


if(CMAKE_POLICY_DEFAULT_CMP0091)  # Avoid unused and not-initialized warnings
endif()