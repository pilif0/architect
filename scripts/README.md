# Architect - scripts
This directory contains scripts useful in everyday use of the system.

## dGPU scripts
There are currently two scripts related to the dGPU, `start_dgpu.sh` and `stop_dgpu.sh`.
These scripts mainly tell bbswitch when to turn the card on and off, while also making sure the `nvidia` module is not loaded when trying to disable the dGPU.
Their use can usually be avoided by using the Bumblebee command `optirun`.

## WiFi scripts
There are currently two scripts related to WiFi, `start_wifi.sh` and `stop_wifi.sh`.
These scripts use the `ip link` interface to turn the WiFi transmitter on and off respectively.

## Asciidoctor scripts
The script `asciidoctor_watch.sh` watches for writes (tested with vim) to current directory and its subdirectories.
On file write, it regenerates the written file's html output into the `build` directory (preserving directory structure).
