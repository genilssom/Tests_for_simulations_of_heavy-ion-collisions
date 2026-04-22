#!/usr/bin/env bash


# download MUSIC
rm -rf music_code
git clone https://github.com/MUSIC-fluid/MUSIC.git -b XSCAPE music_code
(cd music_code; git checkout cfcc26455450588961e81139045dc0eef387437c)
rm -rf music_code/.git

# download iSS (newRTA branch + OSCAR2013 patch)
rm -rf iss_code
git clone https://github.com/genilssom/iSS.git -b newRTA iss_code
rm -rf iss_code/.git

#download SMASH

rm -rf smash_code
git clone https://github.com/smash-transport/smash.git -b SMASH-3.2.2 smash_code
rm -rf smash_code/.git


PYTHIA_VERSION="pythia8315"
PYTHIA_INSTALL_DIR="${HOME}/${PYTHIA_VERSION}"
if [ ! -f "${PYTHIA_INSTALL_DIR}/bin/pythia8-config" ]; then
    echo "Building Pythia8 in ${PYTHIA_INSTALL_DIR} ..."
    (
        cd /tmp
        wget --no-check-certificate \
            https://pythia.org/download/pythia83/${PYTHIA_VERSION}.tgz
        tar xzf ${PYTHIA_VERSION}.tgz
        cd ${PYTHIA_VERSION}
        ./configure --prefix=${PYTHIA_INSTALL_DIR}
        make -j2
        make install
        cd /tmp
        rm -rf ${PYTHIA_VERSION} ${PYTHIA_VERSION}.tgz
    )
else
    echo "Pythia8 already installed at ${PYTHIA_INSTALL_DIR}, skipping."
fi

(cd music_code/EOS; bash download_hotQCD.sh SMASH_binary)


