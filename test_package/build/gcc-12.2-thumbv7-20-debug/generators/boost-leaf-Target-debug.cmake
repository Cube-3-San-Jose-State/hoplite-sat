# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(boost-leaf_FRAMEWORKS_FOUND_DEBUG "") # Will be filled later
conan_find_apple_frameworks(boost-leaf_FRAMEWORKS_FOUND_DEBUG "${boost-leaf_FRAMEWORKS_DEBUG}" "${boost-leaf_FRAMEWORK_DIRS_DEBUG}")

set(boost-leaf_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET boost-leaf_DEPS_TARGET)
    add_library(boost-leaf_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET boost-leaf_DEPS_TARGET
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Debug>:${boost-leaf_FRAMEWORKS_FOUND_DEBUG}>
             $<$<CONFIG:Debug>:${boost-leaf_SYSTEM_LIBS_DEBUG}>
             $<$<CONFIG:Debug>:>
             APPEND)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### boost-leaf_DEPS_TARGET to all of them
conan_package_library_targets("${boost-leaf_LIBS_DEBUG}"    # libraries
                              "${boost-leaf_LIB_DIRS_DEBUG}" # package_libdir
                              "${boost-leaf_BIN_DIRS_DEBUG}" # package_bindir
                              "${boost-leaf_LIBRARY_TYPE_DEBUG}"
                              "${boost-leaf_IS_HOST_WINDOWS_DEBUG}"
                              boost-leaf_DEPS_TARGET
                              boost-leaf_LIBRARIES_TARGETS  # out_libraries_targets
                              "_DEBUG"
                              "boost-leaf"    # package_name
                              "${boost-leaf_NO_SONAME_MODE_DEBUG}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${boost-leaf_BUILD_DIRS_DEBUG} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Debug ########################################

    ########## COMPONENT boost-leaf::leaf #############

        set(boost-leaf_boost-leaf_leaf_FRAMEWORKS_FOUND_DEBUG "")
        conan_find_apple_frameworks(boost-leaf_boost-leaf_leaf_FRAMEWORKS_FOUND_DEBUG "${boost-leaf_boost-leaf_leaf_FRAMEWORKS_DEBUG}" "${boost-leaf_boost-leaf_leaf_FRAMEWORK_DIRS_DEBUG}")

        set(boost-leaf_boost-leaf_leaf_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET boost-leaf_boost-leaf_leaf_DEPS_TARGET)
            add_library(boost-leaf_boost-leaf_leaf_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET boost-leaf_boost-leaf_leaf_DEPS_TARGET
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_FRAMEWORKS_FOUND_DEBUG}>
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_SYSTEM_LIBS_DEBUG}>
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_DEPENDENCIES_DEBUG}>
                     APPEND)

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'boost-leaf_boost-leaf_leaf_DEPS_TARGET' to all of them
        conan_package_library_targets("${boost-leaf_boost-leaf_leaf_LIBS_DEBUG}"
                              "${boost-leaf_boost-leaf_leaf_LIB_DIRS_DEBUG}"
                              "${boost-leaf_boost-leaf_leaf_BIN_DIRS_DEBUG}" # package_bindir
                              "${boost-leaf_boost-leaf_leaf_LIBRARY_TYPE_DEBUG}"
                              "${boost-leaf_boost-leaf_leaf_IS_HOST_WINDOWS_DEBUG}"
                              boost-leaf_boost-leaf_leaf_DEPS_TARGET
                              boost-leaf_boost-leaf_leaf_LIBRARIES_TARGETS
                              "_DEBUG"
                              "boost-leaf_boost-leaf_leaf"
                              "${boost-leaf_boost-leaf_leaf_NO_SONAME_MODE_DEBUG}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET boost-leaf::leaf
                     PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_OBJECTS_DEBUG}>
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_LIBRARIES_TARGETS}>
                     APPEND)

        if("${boost-leaf_boost-leaf_leaf_LIBS_DEBUG}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET boost-leaf::leaf
                         PROPERTY INTERFACE_LINK_LIBRARIES
                         boost-leaf_boost-leaf_leaf_DEPS_TARGET
                         APPEND)
        endif()

        set_property(TARGET boost-leaf::leaf PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_LINKER_FLAGS_DEBUG}> APPEND)
        set_property(TARGET boost-leaf::leaf PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_INCLUDE_DIRS_DEBUG}> APPEND)
        set_property(TARGET boost-leaf::leaf PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_LIB_DIRS_DEBUG}> APPEND)
        set_property(TARGET boost-leaf::leaf PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_COMPILE_DEFINITIONS_DEBUG}> APPEND)
        set_property(TARGET boost-leaf::leaf PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Debug>:${boost-leaf_boost-leaf_leaf_COMPILE_OPTIONS_DEBUG}> APPEND)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET boost::leaf PROPERTY INTERFACE_LINK_LIBRARIES boost-leaf::leaf APPEND)

########## For the modules (FindXXX)
set(boost-leaf_LIBRARIES_DEBUG boost::leaf)
