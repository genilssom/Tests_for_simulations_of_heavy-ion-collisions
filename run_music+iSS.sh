#!/usr/bin/env bash

#Clean up all files (if any)

rm music_run/*.dat
rm iss_run/results/*.dat
rm iss_run/*.dat

#run MUSIC

cp codes/music_code/build/src/MUSIChydro music_run/


(
  cd music_run
  ./MUSIChydro ../input/music_input
  cp surface_eps_0.18.dat ../iss_run/results/surface.dat
)

cp input/music_input iss_run/results/

#Run iSS

cp codes/iss_code/build/src/iSS.e iss_run/
cp input/iSS_parameters.dat iss_run/


(
  cd codes/iss_code/iSS_tables/deltaf_tables
  bash download_newRTA.sh
)

(
  cd iss_run
  ./iSS.e
)




