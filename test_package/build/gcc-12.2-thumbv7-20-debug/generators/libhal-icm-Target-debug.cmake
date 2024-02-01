# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libhal-icm_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(libhal-icm_FRAMEWORKS_FOUND_DEBUG "${libhal-icm_FRAMEWORKS_DEBUG}" "${libhal-icm_FRAMEWORK_DIRS_DEBUG}")

set(libhal-icm_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libhal-icm_DEPS_TARGET)
    add_library(libhal-icm_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libhal-icm_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${libhal-icm_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${libhal-icm_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:nonstd::ring-span-lite;libhal::util;libhal::libhal>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libhal-icm_DEPS_TARGET to all of them
conan_package_library_targets("${libhal-icm_LIBS_DEBUG}"    # libraries
                              "${libhal-icm_LIB_DIRS_DEBUG}" # package_libdir
                              "${libhal-icm_BIN_DIRS_DEBUG}" # package_bindir
                              "${libhal-icm_LIBRARY_TYPE_DEBUG}"
                              "${libhal-icm_IS_HOST_WINDOWS_DEBUG}"
                              libhal-icm_DEPS_TARGET
                              libhal-icm_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "libhal-icm"    # package_name
                              "${libhal-icm_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libhal-icm_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libhal::icm
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${libhal-icm_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${libhal-icm_LIBRARIES_TARGETS}>
                 APPEND)

    if("${libhal-icm_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libhal::icm
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     libhal-icm_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET libhal::icm
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-icm_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET libhal::icm
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-icm_INCLUDE_DIRS_DEBUG}> APPEND)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libhal::icm
                 PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-icm_LIB_DIRS_DEBUG}> APPEND)
    set_property(TARGET libhal::icm
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${libhal-icm_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET libhal::icm
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-icm_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(libhal-icm_LIBRARIES_DEBUG libhal::icm)
