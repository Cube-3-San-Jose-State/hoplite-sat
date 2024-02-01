########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND tl-function-ref_COMPONENT_NAMES tl::function-ref)
list(REMOVE_DUPLICATES tl-function-ref_COMPONENT_NAMES)
set(tl-function-ref_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(tl-function-ref_PACKAGE_FOLDER_DEBUG "/home/alazca/.conan2/p/tl-fu31454aa876889/p")
set(tl-function-ref_BUILD_MODULES_PATHS_DEBUG )


set(tl-function-ref_INCLUDE_DIRS_DEBUG "${tl-function-ref_PACKAGE_FOLDER_DEBUG}/include")
set(tl-function-ref_RES_DIRS_DEBUG )
set(tl-function-ref_DEFINITIONS_DEBUG )
set(tl-function-ref_SHARED_LINK_FLAGS_DEBUG )
set(tl-function-ref_EXE_LINK_FLAGS_DEBUG )
set(tl-function-ref_OBJECTS_DEBUG )
set(tl-function-ref_COMPILE_DEFINITIONS_DEBUG )
set(tl-function-ref_COMPILE_OPTIONS_C_DEBUG )
set(tl-function-ref_COMPILE_OPTIONS_CXX_DEBUG )
set(tl-function-ref_LIB_DIRS_DEBUG )
set(tl-function-ref_BIN_DIRS_DEBUG )
set(tl-function-ref_LIBRARY_TYPE_DEBUG UNKNOWN)
set(tl-function-ref_IS_HOST_WINDOWS_DEBUG 0)
set(tl-function-ref_LIBS_DEBUG )
set(tl-function-ref_SYSTEM_LIBS_DEBUG )
set(tl-function-ref_FRAMEWORK_DIRS_DEBUG )
set(tl-function-ref_FRAMEWORKS_DEBUG )
set(tl-function-ref_BUILD_DIRS_DEBUG )
set(tl-function-ref_NO_SONAME_MODE_DEBUG FALSE)


# COMPOUND VARIABLES
set(tl-function-ref_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${tl-function-ref_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${tl-function-ref_COMPILE_OPTIONS_C_DEBUG}>")
set(tl-function-ref_LINKER_FLAGS_DEBUG
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${tl-function-ref_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${tl-function-ref_SHARED_LINK_FLAGS_DEBUG}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${tl-function-ref_EXE_LINK_FLAGS_DEBUG}>")


set(tl-function-ref_COMPONENTS_DEBUG tl::function-ref)
########### COMPONENT tl::function-ref VARIABLES ############################################

set(tl-function-ref_tl_function-ref_INCLUDE_DIRS_DEBUG "${tl-function-ref_PACKAGE_FOLDER_DEBUG}/include")
set(tl-function-ref_tl_function-ref_LIB_DIRS_DEBUG )
set(tl-function-ref_tl_function-ref_BIN_DIRS_DEBUG )
set(tl-function-ref_tl_function-ref_LIBRARY_TYPE_DEBUG UNKNOWN)
set(tl-function-ref_tl_function-ref_IS_HOST_WINDOWS_DEBUG 0)
set(tl-function-ref_tl_function-ref_RES_DIRS_DEBUG )
set(tl-function-ref_tl_function-ref_DEFINITIONS_DEBUG )
set(tl-function-ref_tl_function-ref_OBJECTS_DEBUG )
set(tl-function-ref_tl_function-ref_COMPILE_DEFINITIONS_DEBUG )
set(tl-function-ref_tl_function-ref_COMPILE_OPTIONS_C_DEBUG "")
set(tl-function-ref_tl_function-ref_COMPILE_OPTIONS_CXX_DEBUG "")
set(tl-function-ref_tl_function-ref_LIBS_DEBUG )
set(tl-function-ref_tl_function-ref_SYSTEM_LIBS_DEBUG )
set(tl-function-ref_tl_function-ref_FRAMEWORK_DIRS_DEBUG )
set(tl-function-ref_tl_function-ref_FRAMEWORKS_DEBUG )
set(tl-function-ref_tl_function-ref_DEPENDENCIES_DEBUG )
set(tl-function-ref_tl_function-ref_SHARED_LINK_FLAGS_DEBUG )
set(tl-function-ref_tl_function-ref_EXE_LINK_FLAGS_DEBUG )
set(tl-function-ref_tl_function-ref_NO_SONAME_MODE_DEBUG FALSE)

# COMPOUND VARIABLES
set(tl-function-ref_tl_function-ref_LINKER_FLAGS_DEBUG
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${tl-function-ref_tl_function-ref_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${tl-function-ref_tl_function-ref_SHARED_LINK_FLAGS_DEBUG}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${tl-function-ref_tl_function-ref_EXE_LINK_FLAGS_DEBUG}>
)
set(tl-function-ref_tl_function-ref_COMPILE_OPTIONS_DEBUG
    "$<$<COMPILE_LANGUAGE:CXX>:${tl-function-ref_tl_function-ref_COMPILE_OPTIONS_CXX_DEBUG}>"
    "$<$<COMPILE_LANGUAGE:C>:${tl-function-ref_tl_function-ref_COMPILE_OPTIONS_C_DEBUG}>")