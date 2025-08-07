#!/bin/bash

SAXON_HE_MAJOR=12
SAXON_HE_MINOR=8

curl -L -o SaxonHE${SAXON_HE_MAJOR}-${SAXON_HE_MINOR}J.zip https://github.com/Saxonica/Saxon-HE/releases/download/SaxonHE-${SAXON_HE_MAJOR}-${SAXON_HE_MINOR}/SaxonHE${SAXON_HE_MAJOR}-${SAXON_HE_MINOR}J.zip
unzip -q SaxonHE${SAXON_HE_MAJOR}-${SAXON_HE_MINOR}J.zip
mv saxon-he-${SAXON_HE_MAJOR}.${SAXON_HE_MINOR}.jar saxon-he.jar