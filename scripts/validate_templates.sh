#!/bin/bash

version="v11"

for phase_dir in templates/$version/*; do
    phase=$(basename "$phase_dir")
    for test_dir in $phase_dir/*; do
        test_type=$(basename "$test_dir")
        echo "Validating $test_type templates for phase $phase"
        mkdir -p validation_output/$version/$phase/$test_type
        java -jar saxon-he.jar -xsl:validation_schemas/phases_transpiled/$phase.xsl -s:templates/$version/$phase/$test_type/ -o:validation_output/$version/$phase/$test_type/
    done
done
