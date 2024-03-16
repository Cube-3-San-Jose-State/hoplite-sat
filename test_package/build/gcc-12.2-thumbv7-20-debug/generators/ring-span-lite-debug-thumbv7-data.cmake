########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND ring-span-lite_COMPONENT_NAMES nonstd::ring-span-lite)
list(REMOVE_DUPLICATES ring-span-lite_COMPONENT_NAMES)
set(ring-span-lite_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(ring-span-lite_PACKAGE_FOLDER_DEBUG "C:/Users/daphn/.conan2/p/ring-9f549177d28e3/p")
set(ring-span-lite_BUILD_MODULES_PATHS_DEBUG )


set(ring-span-lite_INCLUDE_DIRS_DEBUG "${ring-span-lite_PACKAGE_FOLDER_DEBUG}/include")
set(ring-span-lite_RES_DIRS_DEBUG )
set(ring-span-lite_DEFINITIONS_DEBUG )
set(ring-span-lite_SHARED_LINK_FLAGS_DEBUG )
set(ring-span-lite_EXE_LINK_FLAGS_DEBUG )
set(ring-span-lite_OBJECTS_DEBUG )
set(ring-span-lite_COMPILE_DEFINITIONS_DEBUG )
set(ring-span-lite_COMPILE_OPTIONS_C_DEBUG )
set(ring-span-lite_COMPILE_OPTIONS_CXX_DEBUG )
set(ring-span-lite_LIB_DIRS_DEBUG )
set(ring-span-lite_BIN_DIRS_DEBUG )
set(ring-span-lite_LIBRARY_TYPE_DEBUG UNKNOWN)
set(ring-span-lite_IS_HOST_WINDOWS_DEBUG 0)
set(ring-span-lite_LIBS_DEBUG )
set(ring-span-lite_SYSTEM_LIBS_DEBUG )
set(ring-span-lite_FRAMEWORK_DIRS_DEBUG )
set(ring-span-lite_FRAMEWORKS_DEBUG )
set(ring-span-lite_BUILD_DIRS_DEBUG )
set(ring-span-lite_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(ring-span-lite_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${ring-span-lite_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${ring-span-lite_COMPILE_OPTIONS_C_DEBUG}>")
set(ring-span-lite_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ring-span-lite_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ring-span-lite_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ring-span-lite_EXE_LINK_FLAGS_DEBUG}>")


set(ring-span-lite_COMPONENTS_DEBUG nonstd::ring-span-lite)
########### COMPONENT nonstd::ring-span-lite VARIABLES ############################################

set(ring-span-lite_nonstd_ring-span-lite_INCLUDE_DIRS_DEBUG "${ring-span-lite_PACKAGE_FOLDER_DEBUG}/include")
set(ring-span-lite_nonstd_ring-span-lite_LIB_DIRS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_BIN_DIRS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_LIBRARY_TYPE_DEBUG UNKNOWN)
set(ring-span-lite_nonstd_ring-span-lite_IS_HOST_WINDOWS_DEBUG 0)
set(ring-span-lite_nonstd_ring-span-lite_RES_DIRS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_DEFINITIONS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_OBJECTS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_COMPILE_DEFINITIONS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_COMPILE_OPTIONS_C_DEBUG "")
set(ring-span-lite_nonstd_ring-span-lite_COMPILE_OPTIONS_CXX_DEBUG "")
set(ring-span-lite_nonstd_ring-span-lite_LIBS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_SYSTEM_LIBS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_FRAMEWORK_DIRS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_FRAMEWORKS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_DEPENDENCIES_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_SHARED_LINK_FLAGS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_EXE_LINK_FLAGS_DEBUG )
set(ring-span-lite_nonstd_ring-span-lite_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(ring-span-lite_nonstd_ring-span-lite_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${ring-span-lite_nonstd_ring-span-lite_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${ring-span-lite_nonstd_ring-span-lite_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${ring-span-lite_nonstd_ring-span-lite_EXE_LINK_FLAGS_DEBUG}>
)
set(ring-span-lite_nonstd_ring-span-lite_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${ring-span-lite_nonstd_ring-span-lite_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${ring-span-lite_nonstd_ring-span-lite_COMPILE_OPTIONS_C_DEBUG}>")