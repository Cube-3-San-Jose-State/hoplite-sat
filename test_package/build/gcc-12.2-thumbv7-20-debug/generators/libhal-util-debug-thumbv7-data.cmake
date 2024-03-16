########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libhal-util_COMPONENT_NAMES "")
list(APPEND libhal-util_FIND_DEPENDENCY_NAMES libhal)
list(REMOVE_DUPLICATES libhal-util_FIND_DEPENDENCY_NAMES)
set(libhal_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(libhal-util_PACKAGE_FOLDER_DEBUG "C:/Users/daphn/.conan2/p/libhac9a6203da3932/p")
set(libhal-util_BUILD_MODULES_PATHS_DEBUG )


set(libhal-util_INCLUDE_DIRS_DEBUG "${libhal-util_PACKAGE_FOLDER_DEBUG}/include")
set(libhal-util_RES_DIRS_DEBUG )
set(libhal-util_DEFINITIONS_DEBUG )
set(libhal-util_SHARED_LINK_FLAGS_DEBUG )
set(libhal-util_EXE_LINK_FLAGS_DEBUG )
set(libhal-util_OBJECTS_DEBUG )
set(libhal-util_COMPILE_DEFINITIONS_DEBUG )
set(libhal-util_COMPILE_OPTIONS_C_DEBUG )
set(libhal-util_COMPILE_OPTIONS_CXX_DEBUG )
set(libhal-util_LIB_DIRS_DEBUG "${libhal-util_PACKAGE_FOLDER_DEBUG}/lib")
set(libhal-util_BIN_DIRS_DEBUG )
set(libhal-util_LIBRARY_TYPE_DEBUG UNKNOWN)
set(libhal-util_IS_HOST_WINDOWS_DEBUG 0)
set(libhal-util_LIBS_DEBUG libhal-util)
set(libhal-util_SYSTEM_LIBS_DEBUG )
set(libhal-util_FRAMEWORK_DIRS_DEBUG )
set(libhal-util_FRAMEWORKS_DEBUG )
set(libhal-util_BUILD_DIRS_DEBUG )
set(libhal-util_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libhal-util_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libhal-util_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libhal-util_COMPILE_OPTIONS_C_DEBUG}>")
set(libhal-util_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libhal-util_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libhal-util_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libhal-util_EXE_LINK_FLAGS_DEBUG}>")


set(libhal-util_COMPONENTS_DEBUG )