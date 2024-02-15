########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libhal-xbee_COMPONENT_NAMES "")
list(APPEND libhal-xbee_FIND_DEPENDENCY_NAMES ring-span-lite libhal-util libhal)
list(REMOVE_DUPLICATES libhal-xbee_FIND_DEPENDENCY_NAMES)
set(ring-span-lite_FIND_MODE "NO_MODULE")
set(libhal-util_FIND_MODE "NO_MODULE")
set(libhal_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(libhal-xbee_PACKAGE_FOLDER_DEBUG "/Users/adrien/.conan2/p/b/libha6b62fedd043e1/p")
set(libhal-xbee_BUILD_MODULES_PATHS_DEBUG )


set(libhal-xbee_INCLUDE_DIRS_DEBUG "${libhal-xbee_PACKAGE_FOLDER_DEBUG}/include")
set(libhal-xbee_RES_DIRS_DEBUG )
set(libhal-xbee_DEFINITIONS_DEBUG )
set(libhal-xbee_SHARED_LINK_FLAGS_DEBUG )
set(libhal-xbee_EXE_LINK_FLAGS_DEBUG )
set(libhal-xbee_OBJECTS_DEBUG )
set(libhal-xbee_COMPILE_DEFINITIONS_DEBUG )
set(libhal-xbee_COMPILE_OPTIONS_C_DEBUG )
set(libhal-xbee_COMPILE_OPTIONS_CXX_DEBUG )
set(libhal-xbee_LIB_DIRS_DEBUG "${libhal-xbee_PACKAGE_FOLDER_DEBUG}/lib")
set(libhal-xbee_BIN_DIRS_DEBUG )
set(libhal-xbee_LIBRARY_TYPE_DEBUG UNKNOWN)
set(libhal-xbee_IS_HOST_WINDOWS_DEBUG 0)
set(libhal-xbee_LIBS_DEBUG libhal-xbee)
set(libhal-xbee_SYSTEM_LIBS_DEBUG )
set(libhal-xbee_FRAMEWORK_DIRS_DEBUG )
set(libhal-xbee_FRAMEWORKS_DEBUG )
set(libhal-xbee_BUILD_DIRS_DEBUG )
set(libhal-xbee_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libhal-xbee_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libhal-xbee_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libhal-xbee_COMPILE_OPTIONS_C_DEBUG}>")
set(libhal-xbee_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libhal-xbee_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libhal-xbee_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libhal-xbee_EXE_LINK_FLAGS_DEBUG}>")


set(libhal-xbee_COMPONENTS_DEBUG )