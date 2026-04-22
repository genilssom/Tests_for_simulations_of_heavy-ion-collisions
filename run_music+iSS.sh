#!/usr/bin/env bash

#Clean up all files (if any)

rm -rf music_run
rm -rf iss_run
rm -rf smash_run

#run generate folder

(
cd generate_folder
bash generate_folder.sh
)


#run MUSIC

cp codes/music_code/build/src/MUSIChydro music_run/

(cd codes/music_code/EOS; bash download_hotQCD.sh SMASH_binary)

(
  cd music_run
  ./MUSIChydro ../input/music_input
  cp surface_eps_0.18.dat ../iss_run/results/surface.dat
)

cp input/music_input iss_run/results/

#Run iSS

cp codes/iss_code/build/src/iSS.e iss_run/
#cp input/iSS_parameters.dat iss_run/

(
  cd codes/iss_code/iSS_tables/deltaf_tables/urqmd
  bash download_NEoS4D_deltafCoeffs.sh
)


# Uncomment if you use iSS newRTA branch

#(
#  cd codes/iss_code/iSS_tables/deltaf_tables
#  bash download_newRTA.sh
#)

(
  cd iss_run
  ./iSS.e ../input/iSS_parameters_SMASH.dat
  cp OSCAR.DAT ../smash_run/list/OSCAR.DAT0
)

#Run SMASH

cp input/config.yaml smash_run/list/
cp codes/smash_code/build/smash smash_run/

(
  cd smash_run
  ./smash -i list/config.yaml
)
