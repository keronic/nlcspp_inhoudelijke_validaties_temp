#!/bin/bash

version="v11"

echo "Validating templates..."

for phase_dir in templates/$version/*; do
    phase=$(basename "$phase_dir")
    for test_dir in $phase_dir/*; do
        test=$(basename "$test_dir")
        mkdir -p validation_output/$version/$phase/$test
        java -jar saxon-he.jar -xsl:validation_schemas/phases_transpiled/$phase.xsl -s:templates/$version/$phase/$test/ -o:validation_output/$version/$phase/$test/
    done
done