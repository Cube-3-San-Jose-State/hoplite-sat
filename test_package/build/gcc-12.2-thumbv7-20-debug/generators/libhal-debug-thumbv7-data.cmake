########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(libhal_COMPONENT_NAMES "")
list(APPEND libhal_FIND_DEPENDENCY_NAMES tl-function-ref boost-leaf)
list(REMOVE_DUPLICATES libhal_FIND_DEPENDENCY_NAMES)
set(tl-function-ref_FIND_MODE "NO_MODULE")
set(boost-leaf_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(libhal_PACKAGE_FOLDER_DEBUG "/home/alazca/.conan2/p/libhaebe27e4f0d66f/p")
set(libhal_BUILD_MODULES_PATHS_DEBUG )


set(libhal_INCLUDE_DIRS_DEBUG "${libhal_PACKAGE_FOLDER_DEBUG}/include")
set(libhal_RES_DIRS_DEBUG )
set(libhal_DEFINITIONS_DEBUG "-DBOOST_LEAF_EMBEDDED"
			"-DBOOST_LEAF_NO_THREADS")
set(libhal_SHARED_LINK_FLAGS_DEBUG )
set(libhal_EXE_LINK_FLAGS_DEBUG )
set(libhal_OBJECTS_DEBUG )
set(libhal_COMPILE_DEFINITIONS_DEBUG "BOOST_LEAF_EMBEDDED"
			"BOOST_LEAF_NO_THREADS")
set(libhal_COMPILE_OPTIONS_C_DEBUG )
set(libhal_COMPILE_OPTIONS_CXX_DEBUG )
set(libhal_LIB_DIRS_DEBUG )
set(libhal_BIN_DIRS_DEBUG )
set(libhal_LIBRARY_TYPE_DEBUG UNKNOWN)
set(libhal_IS_HOST_WINDOWS_DEBUG 0)
set(libhal_LIBS_DEBUG )
set(libhal_SYSTEM_LIBS_DEBUG )
set(libhal_FRAMEWORK_DIRS_DEBUG )
set(libhal_FRAMEWORKS_DEBUG )
set(libhal_BUILD_DIRS_DEBUG )
set(libhal_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(libhal_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${libhal_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${libhal_COMPILE_OPTIONS_C_DEBUG}>")
set(libhal_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libhal_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libhal_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libhal_EXE_LINK_FLAGS_DEBUG}>")


set(libhal_COMPONENTS_DEBUG )