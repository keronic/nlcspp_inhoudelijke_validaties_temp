#!/bin/bash

version="v11"

echo "Validating output..."

for phase_dir in validation_output/$version/*; do
    phase=$(basename "$phase_dir")
    for test_dir in $phase_dir/*; do
        test=$(basename "$test_dir")
        mkdir -p validation_test_results/$version/$phase/$test
        java -jar saxon-he.jar -xsl:transformations/validation_output.xsl -s:validation_output/$version/$phase/$test/ -o:validation_test_results/$version/$phase/$test/
    done
done

failed_tests=()

# Loop over all files and check contents
while IFS= read -r -d '' file; do
    if [[ "$(cat "$file")" != "PASS" ]]; then
        failed_tests+=("$file")
    fi
done < <(find validation_test_results/"$version" -type f -print0)

# Report failures if any
if [[ ${#failed_tests[@]} -gt 0 ]]; then
    echo "Some validation tests failed:"
    for f in "${failed_tests[@]}"; do
        # Format output text
        cleaned_path="${f#validation_test_results/}"
        cleaned_path="${cleaned_path%.txt}"                         
        cleaned_path="${cleaned_path//\//\t}"
        echo -e "$cleaned_path"
    done
    exit 1
else
    echo "All validation tests passed!"
fi