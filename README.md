# SatNOGS GNU Radio Out-Of-Tree Module packager

gr-satnogs-package creates packages of gr-satnogs for various distributions

## Requirements

* Docker engine
* Docker Compose
* CMake
* GNU Make

## Usage

```shell
mkdir build     # Create a working directory for CMake
cd build        # Change to CMake working directory
cmake ..        # Generate GNU Makefiles
make            # Build packages inside Docker containers
```