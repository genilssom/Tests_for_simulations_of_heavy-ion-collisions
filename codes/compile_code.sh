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

