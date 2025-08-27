#!/usr/bin/env bash

#compile the codes

#compile MUSIC

cd music_code
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)

#compile iSS

cd iss_code
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)

