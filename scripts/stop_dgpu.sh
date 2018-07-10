# Remove nvidia module and tell bbswitch to disable dGPU
modprobe -r nvidia
tee /proc/acpi/bbswitch <<< OFF
