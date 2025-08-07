#!/bin/bash

SCHXSLT2_VERSION=1.4.4

curl -L -o schxslt2-${SCHXSLT2_VERSION}.zip https://codeberg.org/SchXslt/schxslt2/releases/download/v${SCHXSLT2_VERSION}/schxslt2-${SCHXSLT2_VERSION}.zip
unzip -q schxslt2-${SCHXSLT2_VERSION}.zip
mv schxslt2-${SCHXSLT2_VERSION}/transpile.xsl .