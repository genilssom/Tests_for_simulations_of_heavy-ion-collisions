#!/usr/bin/env bash


# download MUSIC
rm -rf music_code
git clone --depth=3 https://github.com/luizafperin/MUSIC -b main music_code
rm -rf music_code/.git

# download iSS (newRTA branch + OSCAR2013 patch)
rm -rf iss_code
git clone --depth=3 https://github.com/luizafperin/iSS -b XSCAPE iSS_code
(cd iSS_code; git checkout 81ed0b78bd6e0012c19cd13348f3d6aa02f4137e)

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

(cd music_code/EOS; bash download_EOS-gp.sh)
