#!/usr/bin/env bash


# download MUSIC
rm -rf music_code
git clone https://github.com/MUSIC-fluid/MUSIC.git -b resummedTransportCoeff music_code
rm -rf music_code/.git

# download iSS
rm -rf iss_code
git clone https://github.com/chunshen1987/iSS.git -b newRTA iss_code
rm -rf  iss_code/.git


