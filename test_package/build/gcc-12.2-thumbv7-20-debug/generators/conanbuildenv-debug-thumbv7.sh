script_folder="/Users/adrien/Repos/sat-core/test_package/build/gcc-12.2-thumbv7-20-debug/generators"
echo "echo Restoring environment" > "$script_folder/../../../build/gcc-12.2-thumbv7-20-debug/generators/deactivate_conanbuildenv-debug-thumbv7.sh"
for v in LIBHAL_PLATFORM_LIBRARY LIBHAL_PLATFORM PATH
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/../../../build/gcc-12.2-thumbv7-20-debug/generators/deactivate_conanbuildenv-debug-thumbv7.sh"
    else
        echo unset $v >> "$script_folder/../../../build/gcc-12.2-thumbv7-20-debug/generators/deactivate_conanbuildenv-debug-thumbv7.sh"
    fi
done


export LIBHAL_PLATFORM_LIBRARY="lpc40"
export LIBHAL_PLATFORM="lpc4078"
export PATH="/Users/adrien/.conan2/p/b/arm-ge47aa5425c57a/p/bin/bin:/Users/adrien/.conan2/p/cmake253f38c8fbec3/p/CMake.app/Contents/bin:$PATH:/Users/adrien/.conan2/p/b/arm-ge47aa5425c57a/p/bin/bin"