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
rm -fr build
mkdir -p build && cd build
CC=${CCFlag} CXX=${CXXFlag} cmake \
        -DPythia_CONFIG_EXECUTABLE="${HOME}/pythia8315/bin/pythia8-config" \
        -DTRY_USE_HEPMC=OFF \
        -DCMAKE_CXX_FLAGS="-fno-tree-vrp" \
        ..
    make -j${number_of_cores_to_compile} smash
)


