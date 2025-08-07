#!/bin/bash

version="v11"

for dir in templates/$version/*; do
    phase=$(basename "$dir")
    java -jar saxon-he.jar -xsl:transpile_phase_wrapper.xsl -s:validation_schemas/base/v11.sch -o:validation_schemas/phases_transpiled/$phase.xsl phase=$phase
done