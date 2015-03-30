#/bin/bash

#get the git repo
git clone https://github.com/corentin-R/QICT.git

cd QICT

#build
make build

cp qict ../

cd ..

rm -rf QICT
