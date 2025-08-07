#!/bin/bash

version="v11"

for phase_dir in validation_output/$version/*; do
    phase=$(basename "$phase_dir")
    for test_dir in $phase_dir/*; do
        test=$(basename "$test_dir")
        mkdir -p validation_test_results/$version/$phase/$test
        java -jar saxon-he.jar -xsl:transformations/validation_output.xsl -s:validation_output/$version/$phase/$test/ -o:validation_test_results/$version/$phase/$test/
    done
done

has_failures=false

# Loop over all files and check contents
while IFS= read -r -d '' file; do
    if [[ "$(cat "$file")" != "PASS" ]]; then
        # Format output text
        cleaned_path="${file#validation_test_results/}"
        cleaned_path="${cleaned_path%.txt}"                         
        cleaned_path="${cleaned_path//\// | }"
        
        echo "::error title=Validation Failed::$cleaned_path"
        has_failures=true
    fi
done < <(find validation_test_results/"$version" -type f -print0)

if [[ "$has_failures" == true ]]; then
    exit 1
fi
