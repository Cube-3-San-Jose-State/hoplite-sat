########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libhal-icm_COMPONENT_NAMES "")
list(APPEND libhal-icm_FIND_DEPENDENCY_NAMES ring-span-lite libhal-util libhal)
list(REMOVE_DUPLICATES libhal-icm_FIND_DEPENDENCY_NAMES)
set(ring-span-lite_FIND_MODE "NO_MODULE")
set(libhal-util_FIND_MODE "NO_MODULE")
set(libhal_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(libhal-icm_PACKAGE_FOLDER_DEBUG "C:/Users/daphn/.conan2/p/libhad21ac9408c04f/p")
set(libhal-icm_BUILD_MODULES_PATHS_DEBUG )


set(libhal-icm_INCLUDE_DIRS_DEBUG "${libhal-icm_PACKAGE_FOLDER_DEBUG}/include")
set(libhal-icm_RES_DIRS_DEBUG )
set(libhal-icm_DEFINITIONS_DEBUG )
set(libhal-icm_SHARED_LINK_FLAGS_DEBUG )
set(libhal-icm_EXE_LINK_FLAGS_DEBUG )
set(libhal-icm_OBJECTS_DEBUG )
set(libhal-icm_COMPILE_DEFINITIONS_DEBUG )
set(libhal-icm_COMPILE_OPTIONS_C_DEBUG )
set(libhal-icm_COMPILE_OPTIONS_CXX_DEBUG )
set(libhal-icm_LIB_DIRS_DEBUG "${libhal-icm_PACKAGE_FOLDER_DEBUG}/lib")
set(libhal-icm_BIN_DIRS_DEBUG )
set(libhal-icm_LIBRARY_TYPE_DEBUG UNKNOWN)
set(libhal-icm_IS_HOST_WINDOWS_DEBUG 0)
set(libhal-icm_LIBS_DEBUG libhal-icm)
set(libhal-icm_SYSTEM_LIBS_DEBUG )
set(libhal-icm_FRAMEWORK_DIRS_DEBUG )
set(libhal-icm_FRAMEWORKS_DEBUG )
set(libhal-icm_BUILD_DIRS_DEBUG )
set(libhal-icm_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libhal-icm_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libhal-icm_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libhal-icm_COMPILE_OPTIONS_C_DEBUG}>")
set(libhal-icm_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libhal-icm_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libhal-icm_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libhal-icm_EXE_LINK_FLAGS_DEBUG}>")


set(libhal-icm_COMPONENTS_DEBUG )