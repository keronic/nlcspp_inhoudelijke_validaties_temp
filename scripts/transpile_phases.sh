#!/bin/bash

version="v11"

for dir in test/rule_validation_data/$version/*; do
    phase=$(basename "$dir")
    echo "Transpiling schema for phase $phase"
    java -jar saxon-he.jar -xsl:wrappers/transpile_phase_wrapper.xsl -s:validation_schemas/base/v11.sch -o:validation_schemas/phases_transpiled/$phase.xsl phase=$phase
done
