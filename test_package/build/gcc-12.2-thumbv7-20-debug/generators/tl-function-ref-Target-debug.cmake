# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(tl-function-ref_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(tl-function-ref_FRAMEWORKS_FOUND_DEBUG "${tl-function-ref_FRAMEWORKS_DEBUG}" "${tl-function-ref_FRAMEWORK_DIRS_DEBUG}")

set(tl-function-ref_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET tl-function-ref_DEPS_TARGET)
    add_library(tl-function-ref_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET tl-function-ref_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${tl-function-ref_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${tl-function-ref_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### tl-function-ref_DEPS_TARGET to all of them
conan_package_library_targets("${tl-function-ref_LIBS_DEBUG}"    # libraries
                              "${tl-function-ref_LIB_DIRS_DEBUG}" # package_libdir
                              "${tl-function-ref_BIN_DIRS_DEBUG}" # package_bindir
                              "${tl-function-ref_LIBRARY_TYPE_DEBUG}"
                              "${tl-function-ref_IS_HOST_WINDOWS_DEBUG}"
                              tl-function-ref_DEPS_TARGET
                              tl-function-ref_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "tl-function-ref"    # package_name
                              "${tl-function-ref_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${tl-function-ref_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT tl::function-ref #############

        set(tl-function-ref_tl_function-ref_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(tl-function-ref_tl_function-ref_FRAMEWORKS_FOUND_DEBUG "${tl-function-ref_tl_function-ref_FRAMEWORKS_DEBUG}" "${tl-function-ref_tl_function-ref_FRAMEWORK_DIRS_DEBUG}")

        set(tl-function-ref_tl_function-ref_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET tl-function-ref_tl_function-ref_DEPS_TARGET)
            add_library(tl-function-ref_tl_function-ref_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET tl-function-ref_tl_function-ref_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'tl-function-ref_tl_function-ref_DEPS_TARGET' to all of them
        conan_package_library_targets("${tl-function-ref_tl_function-ref_LIBS_DEBUG}"
                              "${tl-function-ref_tl_function-ref_LIB_DIRS_DEBUG}"
                              "${tl-function-ref_tl_function-ref_BIN_DIRS_DEBUG}" # package_bindir
                              "${tl-function-ref_tl_function-ref_LIBRARY_TYPE_DEBUG}"
                              "${tl-function-ref_tl_function-ref_IS_HOST_WINDOWS_DEBUG}"
                              tl-function-ref_tl_function-ref_DEPS_TARGET
                              tl-function-ref_tl_function-ref_LIBRARIES_TARGETS
                              "_DEBUG"
                              "tl-function-ref_tl_function-ref"
                              "${tl-function-ref_tl_function-ref_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET tl::function-ref
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_LIBRARIES_TARGETS}>
                     APPEND)

        if("${tl-function-ref_tl_function-ref_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET tl::function-ref
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         tl-function-ref_tl_function-ref_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET tl::function-ref PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET tl::function-ref PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET tl::function-ref PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_LIB_DIRS_DEBUG}> APPEND)
        set_property(TARGET tl::function-ref PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET tl::function-ref PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${tl-function-ref_tl_function-ref_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET tl::function-ref PROPERTY INTERFACE_LINK_LIBRARIES tl::function-ref APPEND)

########## For the modules (FindXXX)
set(tl-function-ref_LIBRARIES_DEBUG tl::function-ref)
