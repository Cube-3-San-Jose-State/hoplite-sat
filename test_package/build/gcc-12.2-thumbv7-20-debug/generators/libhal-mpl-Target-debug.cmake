# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(libhal-mpl_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(libhal-mpl_FRAMEWORKS_FOUND_DEBUG "${libhal-mpl_FRAMEWORKS_DEBUG}" "${libhal-mpl_FRAMEWORK_DIRS_DEBUG}")

set(libhal-mpl_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET libhal-mpl_DEPS_TARGET)
    add_library(libhal-mpl_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET libhal-mpl_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${libhal-mpl_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${libhal-mpl_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:libhal::util;libhal::libhal>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### libhal-mpl_DEPS_TARGET to all of them
conan_package_library_targets("${libhal-mpl_LIBS_DEBUG}"    # libraries
                              "${libhal-mpl_LIB_DIRS_DEBUG}" # package_libdir
                              "${libhal-mpl_BIN_DIRS_DEBUG}" # package_bindir
                              "${libhal-mpl_LIBRARY_TYPE_DEBUG}"
                              "${libhal-mpl_IS_HOST_WINDOWS_DEBUG}"
                              libhal-mpl_DEPS_TARGET
                              libhal-mpl_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "libhal-mpl"    # package_name
                              "${libhal-mpl_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libhal-mpl_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Debug ########################################
    set_property(TARGET libhal::mpl
                 PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Debug>:${libhal-mpl_OBJECTS_DEBUG}>
                 $<$<CONFIG:Debug>:${libhal-mpl_LIBRARIES_TARGETS}>
                 APPEND)

    if("${libhal-mpl_LIBS_DEBUG}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET libhal::mpl
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     libhal-mpl_DEPS_TARGET
                     APPEND)
    endif()

    set_property(TARGET libhal::mpl
                 PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-mpl_LINKER_FLAGS_DEBUG}> APPEND)
    set_property(TARGET libhal::mpl
                 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-mpl_INCLUDE_DIRS_DEBUG}> APPEND)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET libhal::mpl
                 PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Debug>:${libhal-mpl_LIB_DIRS_DEBUG}> APPEND)
    set_property(TARGET libhal::mpl
                 PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Debug>:${libhal-mpl_COMPILE_DEFINITIONS_DEBUG}> APPEND)
    set_property(TARGET libhal::mpl
                 PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Debug>:${libhal-mpl_COMPILE_OPTIONS_DEBUG}> APPEND)

########## For the modules (FindXXX)
set(libhal-mpl_LIBRARIES_DEBUG libhal::mpl)
