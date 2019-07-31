#!bin/bash

mkdir dist/lib

cp -r src/PolyGlot.ExternalCode/ dist/lib
cp -r poi-3.10-FINAL/ dist/lib
rm dist/lib/LICENSE
rm dist/lib/NOTICE