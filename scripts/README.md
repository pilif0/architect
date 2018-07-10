# Architect - scripts
This directory contains scripts useful in everyday use of the system.

## dGPU scripts
There are currently two scripts related to the dGPU, `start_dgpu.sh` and `stop_dgpu.sh`.
These scripts mainly tell bbswitch when to turn the card on and off, while also making sure the `nvidia` module is not loaded when trying to disable the dGPU.
Their use can usually be avoided by using the Bumblebee command `optirun`.