########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND boost-leaf_COMPONENT_NAMES boost-leaf::leaf)
list(REMOVE_DUPLICATES boost-leaf_COMPONENT_NAMES)
set(boost-leaf_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(boost-leaf_PACKAGE_FOLDER_DEBUG "/home/alazca/.conan2/p/boost0919ce5474dfb/p")
set(boost-leaf_BUILD_MODULES_PATHS_DEBUG )


set(boost-leaf_INCLUDE_DIRS_DEBUG "${boost-leaf_PACKAGE_FOLDER_DEBUG}/include")
set(boost-leaf_RES_DIRS_DEBUG )
set(boost-leaf_DEFINITIONS_DEBUG )
set(boost-leaf_SHARED_LINK_FLAGS_DEBUG )
set(boost-leaf_EXE_LINK_FLAGS_DEBUG )
set(boost-leaf_OBJECTS_DEBUG )
set(boost-leaf_COMPILE_DEFINITIONS_DEBUG )
set(boost-leaf_COMPILE_OPTIONS_C_DEBUG )
set(boost-leaf_COMPILE_OPTIONS_CXX_DEBUG )
set(boost-leaf_LIB_DIRS_DEBUG "${boost-leaf_PACKAGE_FOLDER_DEBUG}/lib")
set(boost-leaf_BIN_DIRS_DEBUG )
set(boost-leaf_LIBRARY_TYPE_DEBUG UNKNOWN)
set(boost-leaf_IS_HOST_WINDOWS_DEBUG 0)
set(boost-leaf_LIBS_DEBUG )
set(boost-leaf_SYSTEM_LIBS_DEBUG )
set(boost-leaf_FRAMEWORK_DIRS_DEBUG )
set(boost-leaf_FRAMEWORKS_DEBUG )
set(boost-leaf_BUILD_DIRS_DEBUG )
set(boost-leaf_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(boost-leaf_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${boost-leaf_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${boost-leaf_COMPILE_OPTIONS_C_DEBUG}>")
set(boost-leaf_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${boost-leaf_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${boost-leaf_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${boost-leaf_EXE_LINK_FLAGS_DEBUG}>")


set(boost-leaf_COMPONENTS_DEBUG boost-leaf::leaf)
########### COMPONENT boost-leaf::leaf VARIABLES ############################################

set(boost-leaf_boost-leaf_leaf_INCLUDE_DIRS_DEBUG "${boost-leaf_PACKAGE_FOLDER_DEBUG}/include")
set(boost-leaf_boost-leaf_leaf_LIB_DIRS_DEBUG "${boost-leaf_PACKAGE_FOLDER_DEBUG}/lib")
set(boost-leaf_boost-leaf_leaf_BIN_DIRS_DEBUG )
set(boost-leaf_boost-leaf_leaf_LIBRARY_TYPE_DEBUG UNKNOWN)
set(boost-leaf_boost-leaf_leaf_IS_HOST_WINDOWS_DEBUG 0)
set(boost-leaf_boost-leaf_leaf_RES_DIRS_DEBUG )
set(boost-leaf_boost-leaf_leaf_DEFINITIONS_DEBUG )
set(boost-leaf_boost-leaf_leaf_OBJECTS_DEBUG )
set(boost-leaf_boost-leaf_leaf_COMPILE_DEFINITIONS_DEBUG )
set(boost-leaf_boost-leaf_leaf_COMPILE_OPTIONS_C_DEBUG "")
set(boost-leaf_boost-leaf_leaf_COMPILE_OPTIONS_CXX_DEBUG "")
set(boost-leaf_boost-leaf_leaf_LIBS_DEBUG )
set(boost-leaf_boost-leaf_leaf_SYSTEM_LIBS_DEBUG )
set(boost-leaf_boost-leaf_leaf_FRAMEWORK_DIRS_DEBUG )
set(boost-leaf_boost-leaf_leaf_FRAMEWORKS_DEBUG )
set(boost-leaf_boost-leaf_leaf_DEPENDENCIES_DEBUG )
set(boost-leaf_boost-leaf_leaf_SHARED_LINK_FLAGS_DEBUG )
set(boost-leaf_boost-leaf_leaf_EXE_LINK_FLAGS_DEBUG )
set(boost-leaf_boost-leaf_leaf_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(boost-leaf_boost-leaf_leaf_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${boost-leaf_boost-leaf_leaf_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${boost-leaf_boost-leaf_leaf_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${boost-leaf_boost-leaf_leaf_EXE_LINK_FLAGS_DEBUG}>
)
set(boost-leaf_boost-leaf_leaf_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${boost-leaf_boost-leaf_leaf_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${boost-leaf_boost-leaf_leaf_COMPILE_OPTIONS_C_DEBUG}>")