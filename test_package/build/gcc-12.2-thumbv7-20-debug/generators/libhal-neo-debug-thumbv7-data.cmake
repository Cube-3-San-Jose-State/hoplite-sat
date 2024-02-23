########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libhal-neo_COMPONENT_NAMES "")
list(APPEND libhal-neo_FIND_DEPENDENCY_NAMES libhal-util libhal)
list(REMOVE_DUPLICATES libhal-neo_FIND_DEPENDENCY_NAMES)
set(libhal-util_FIND_MODE "NO_MODULE")
set(libhal_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(libhal-neo_PACKAGE_FOLDER_DEBUG "C:/Users/daphn/.conan2/p/libhadc34950f59ccb/p")
set(libhal-neo_BUILD_MODULES_PATHS_DEBUG )


set(libhal-neo_INCLUDE_DIRS_DEBUG "${libhal-neo_PACKAGE_FOLDER_DEBUG}/include")
set(libhal-neo_RES_DIRS_DEBUG )
set(libhal-neo_DEFINITIONS_DEBUG )
set(libhal-neo_SHARED_LINK_FLAGS_DEBUG )
set(libhal-neo_EXE_LINK_FLAGS_DEBUG )
set(libhal-neo_OBJECTS_DEBUG )
set(libhal-neo_COMPILE_DEFINITIONS_DEBUG )
set(libhal-neo_COMPILE_OPTIONS_C_DEBUG )
set(libhal-neo_COMPILE_OPTIONS_CXX_DEBUG )
set(libhal-neo_LIB_DIRS_DEBUG "${libhal-neo_PACKAGE_FOLDER_DEBUG}/lib")
set(libhal-neo_BIN_DIRS_DEBUG )
set(libhal-neo_LIBRARY_TYPE_DEBUG UNKNOWN)
set(libhal-neo_IS_HOST_WINDOWS_DEBUG 0)
set(libhal-neo_LIBS_DEBUG libhal-neo)
set(libhal-neo_SYSTEM_LIBS_DEBUG )
set(libhal-neo_FRAMEWORK_DIRS_DEBUG )
set(libhal-neo_FRAMEWORKS_DEBUG )
set(libhal-neo_BUILD_DIRS_DEBUG )
set(libhal-neo_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libhal-neo_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libhal-neo_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libhal-neo_COMPILE_OPTIONS_C_DEBUG}>")
set(libhal-neo_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libhal-neo_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libhal-neo_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libhal-neo_EXE_LINK_FLAGS_DEBUG}>")


set(libhal-neo_COMPONENTS_DEBUG )