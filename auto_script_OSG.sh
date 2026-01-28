#!/usr/bin/env bash

# This script automates the submission of jobs to an OSG (Open Science Grid) environment.

export DATA=/ospool/ap40/data/genilson.cardosodasilva

source venv/bin/activate

(
    cd $DATA
    rm singularity_repos/iebe-music_TRENTO.sif
    cd singularity_repos
    apptainer pull iebe-music_TRENTO.sif docker://genilsoon/test5:v5
)

(
    cd iebe-free-trento
    rm -rf log
    rm run_singularity.sh
    rm singularity.submit
    python3 ../iEBE-MUSIC/Cluster_supports/OSG/generate_submission_script.py 10 1 1 $DATA/singularity_repos/iebe-music_TRENTO.sif para>
    condor_submit singularity.submit
)
