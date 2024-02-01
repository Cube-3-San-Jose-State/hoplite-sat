script_folder="/home/alazca/Documents/Development/cube3/telemetry-recorder/test_package/build/gcc-12.2-thumbv7-20-debug/generators"
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
export PATH="/home/alazca/.conan2/p/b/arm-g9adff9287b85b/p/bin/bin:/home/alazca/.conan2/p/cmake8e5340c297c76/p/bin:$PATH:/home/alazca/.conan2/p/b/arm-g9adff9287b85b/p/bin/bin"