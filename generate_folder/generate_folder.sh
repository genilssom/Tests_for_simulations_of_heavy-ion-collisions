#!/usr/bin/env bash

#Clean environment to be run

#MUSIC
mkdir -p ../music_run
ln -s ../codes/music_code/EOS  ../music_run/EOS
ln -s ../codes/music_code/tables  ../music_run/tables

#iSS
mkdir -p ../iss_run/results
ln -s ../codes/iss_code/iSS_tables  ../iss_run/iSS_tables
