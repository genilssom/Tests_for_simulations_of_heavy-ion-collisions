#!/usr/bin/env bash


# download MUSIC
rm -rf music_code
git clone https://github.com/MUSIC-fluid/MUSIC.git -b XSCAPE music_code
(cd music_code; git checkout cfcc26455450588961e81139045dc0eef387437c)
rm -rf music_code/.git

# download iSS
rm -rf iss_code
git clone https://github.com/chunshen1987/iSS.git -b XSCAPE iss_code
(cd iss_code; git checkout d242555306930f813881caca500f0e6f82036b2e)
rm -rf  iss_code/.git

#download SMASH

rm -rf smash_code
git clone https://github.com/smash-transport/smash.git -b SMASH-3.2.2 smash_code
rm -rf smash_code/.git


