script_folder="/Users/adrien/Repos/sat-core/test_package/build/gcc-12.2-thumbv7-20-debug/generators"
echo "echo Restoring environment" > "$script_folder/../../../build/gcc-12.2-thumbv7-20-debug/generators/deactivate_conanrunenv-debug-thumbv7.sh"
for v in 
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/../../../build/gcc-12.2-thumbv7-20-debug/generators/deactivate_conanrunenv-debug-thumbv7.sh"
    else
        echo unset $v >> "$script_folder/../../../build/gcc-12.2-thumbv7-20-debug/generators/deactivate_conanrunenv-debug-thumbv7.sh"
    fi
done

