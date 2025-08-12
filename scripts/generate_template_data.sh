#!/bin/bash

XSL_FILE="transformations/templates.xsl"

find templates/ -type f -name "*.xml" | while read -r file; do
    echo "Generating validation XML files for $file"
    java -jar saxon-he.jar -s:"$file" -xsl:"$XSL_FILE"
done