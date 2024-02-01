# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(ring-span-lite_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(ring-span-lite_FRAMEWORKS_FOUND_DEBUG "${ring-span-lite_FRAMEWORKS_DEBUG}" "${ring-span-lite_FRAMEWORK_DIRS_DEBUG}")

set(ring-span-lite_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET ring-span-lite_DEPS_TARGET)
    add_library(ring-span-lite_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET ring-span-lite_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${ring-span-lite_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${ring-span-lite_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### ring-span-lite_DEPS_TARGET to all of them
conan_package_library_targets("${ring-span-lite_LIBS_DEBUG}"    # libraries
                              "${ring-span-lite_LIB_DIRS_DEBUG}" # package_libdir
                              "${ring-span-lite_BIN_DIRS_DEBUG}" # package_bindir
                              "${ring-span-lite_LIBRARY_TYPE_DEBUG}"
                              "${ring-span-lite_IS_HOST_WINDOWS_DEBUG}"
                              ring-span-lite_DEPS_TARGET
                              ring-span-lite_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "ring-span-lite"    # package_name
                              "${ring-span-lite_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${ring-span-lite_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT nonstd::ring-span-lite #############

        set(ring-span-lite_nonstd_ring-span-lite_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(ring-span-lite_nonstd_ring-span-lite_FRAMEWORKS_FOUND_DEBUG "${ring-span-lite_nonstd_ring-span-lite_FRAMEWORKS_DEBUG}" "${ring-span-lite_nonstd_ring-span-lite_FRAMEWORK_DIRS_DEBUG}")

        set(ring-span-lite_nonstd_ring-span-lite_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET ring-span-lite_nonstd_ring-span-lite_DEPS_TARGET)
            add_library(ring-span-lite_nonstd_ring-span-lite_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET ring-span-lite_nonstd_ring-span-lite_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'ring-span-lite_nonstd_ring-span-lite_DEPS_TARGET' to all of them
        conan_package_library_targets("${ring-span-lite_nonstd_ring-span-lite_LIBS_DEBUG}"
                              "${ring-span-lite_nonstd_ring-span-lite_LIB_DIRS_DEBUG}"
                              "${ring-span-lite_nonstd_ring-span-lite_BIN_DIRS_DEBUG}" # package_bindir
                              "${ring-span-lite_nonstd_ring-span-lite_LIBRARY_TYPE_DEBUG}"
                              "${ring-span-lite_nonstd_ring-span-lite_IS_HOST_WINDOWS_DEBUG}"
                              ring-span-lite_nonstd_ring-span-lite_DEPS_TARGET
                              ring-span-lite_nonstd_ring-span-lite_LIBRARIES_TARGETS
                              "_DEBUG"
                              "ring-span-lite_nonstd_ring-span-lite"
                              "${ring-span-lite_nonstd_ring-span-lite_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET nonstd::ring-span-lite
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_LIBRARIES_TARGETS}>
                     APPEND)

        if("${ring-span-lite_nonstd_ring-span-lite_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET nonstd::ring-span-lite
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         ring-span-lite_nonstd_ring-span-lite_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET nonstd::ring-span-lite PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET nonstd::ring-span-lite PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET nonstd::ring-span-lite PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_LIB_DIRS_DEBUG}> APPEND)
        set_property(TARGET nonstd::ring-span-lite PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET nonstd::ring-span-lite PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${ring-span-lite_nonstd_ring-span-lite_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET nonstd::ring-span-lite PROPERTY INTERFACE_LINK_LIBRARIES nonstd::ring-span-lite APPEND)

########## For the modules (FindXXX)
set(ring-span-lite_LIBRARIES_DEBUG nonstd::ring-span-lite)
