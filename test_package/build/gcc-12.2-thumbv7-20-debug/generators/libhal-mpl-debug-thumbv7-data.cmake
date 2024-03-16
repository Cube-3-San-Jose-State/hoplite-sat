########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libhal-mpl_COMPONENT_NAMES "")
list(APPEND libhal-mpl_FIND_DEPENDENCY_NAMES libhal-util libhal)
list(REMOVE_DUPLICATES libhal-mpl_FIND_DEPENDENCY_NAMES)
set(libhal-util_FIND_MODE "NO_MODULE")
set(libhal_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(libhal-mpl_PACKAGE_FOLDER_DEBUG "C:/Users/daphn/.conan2/p/libha5dcc9d985f3ba/p")
set(libhal-mpl_BUILD_MODULES_PATHS_DEBUG )


set(libhal-mpl_INCLUDE_DIRS_DEBUG "${libhal-mpl_PACKAGE_FOLDER_DEBUG}/include")
set(libhal-mpl_RES_DIRS_DEBUG )
set(libhal-mpl_DEFINITIONS_DEBUG )
set(libhal-mpl_SHARED_LINK_FLAGS_DEBUG )
set(libhal-mpl_EXE_LINK_FLAGS_DEBUG )
set(libhal-mpl_OBJECTS_DEBUG )
set(libhal-mpl_COMPILE_DEFINITIONS_DEBUG )
set(libhal-mpl_COMPILE_OPTIONS_C_DEBUG )
set(libhal-mpl_COMPILE_OPTIONS_CXX_DEBUG )
set(libhal-mpl_LIB_DIRS_DEBUG "${libhal-mpl_PACKAGE_FOLDER_DEBUG}/lib")
set(libhal-mpl_BIN_DIRS_DEBUG )
set(libhal-mpl_LIBRARY_TYPE_DEBUG UNKNOWN)
set(libhal-mpl_IS_HOST_WINDOWS_DEBUG 0)
set(libhal-mpl_LIBS_DEBUG libhal-mpl)
set(libhal-mpl_SYSTEM_LIBS_DEBUG )
set(libhal-mpl_FRAMEWORK_DIRS_DEBUG )
set(libhal-mpl_FRAMEWORKS_DEBUG )
set(libhal-mpl_BUILD_DIRS_DEBUG )
set(libhal-mpl_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libhal-mpl_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libhal-mpl_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libhal-mpl_COMPILE_OPTIONS_C_DEBUG}>")
set(libhal-mpl_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libhal-mpl_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libhal-mpl_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libhal-mpl_EXE_LINK_FLAGS_DEBUG}>")


set(libhal-mpl_COMPONENTS_DEBUG )