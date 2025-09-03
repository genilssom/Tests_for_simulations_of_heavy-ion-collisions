#!/usr/bin/env bash

#compile the codes

#compile MUSIC

(
  cd music_code
  rm -rf build
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
)

#compile iSS

(
  cd iss_code
  rm -rf build
  mkdir build && cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
)

#compile SMASH

(
cd smash_code
mkdir build && cd build
cmake -DPythia_CONFIG_EXECUTABLE="$HOME/pythia8315/bin/pythia8-config" ..
make -j"$(nproc)" smash
)

