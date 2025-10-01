#!/usr/bin/env bash

rm ~/hadronic_afterburner_toolkit/*.oscar
rm ~/hadronic_afterburner_toolkit/*.bin
rm ~/hadronic_afterburner_toolkit/particle_lists
rm ~/hadronic_afterburner_toolkit/results/*

( 
    cd smash_run/data/0
    mv particle_lists.oscar ~/hadronic_afterburner_toolkit/
)

#(
#    cd smash_run/data/0
#    mv particles_oscar2013_extended.bin  ~/hadronic_afterburner_toolkit/results/particles_binary.bin
#)

( 
    cd ~/hadronic_afterburner_toolkit
    ./convert_to_binary_SMASH.e particle_lists.oscar
    gunzip particle_lists.gz
    mv particle_lists results/particle_list.dat
    ./hadronic_afterburner_tools.e
)

#(
#    cd ~/hadronic_afterburner_toolkit
#    ./hadronic_afterburner_tools.e
#
#)