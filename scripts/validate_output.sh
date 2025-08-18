#!/bin/bash

version="v11"

for phase_dir in validation_output/$version/*; do
    phase=$(basename "$phase_dir")
    for test_dir in $phase_dir/*; do
        test_type=$(basename "$test_dir")
        echo "Validating $test_type output for phase $phase"
        mkdir -p validation_test_results/$version/$phase/$test_type
        java -jar saxon-he.jar -xsl:transformations/validation_output.xsl -s:validation_output/$version/$phase/$test_type/ -o:validation_test_results/$version/$phase/$test_type/
    done
done

SUMMARY_FILE="$GITHUB_STEP_SUMMARY"

{
  echo "## Validation Failures"
  echo ""
  echo "| Message | File | Link |"
  echo "|---------|------|------|"
} >> "$SUMMARY_FILE"

has_failures=false

# Loop over all files and check contents
while IFS= read -r -d '' file; do
    if [[ "$(cat "$file")" != "PASS" ]]; then
        has_failures=true

        template_path="${file/validation_test_results\//templates/}"
        template_path="${template_path/%.txt/.xml}"

        test_type=$(echo "$file" | cut -d'/' -f4)
        if [[ "$test_type" == "passing" ]]; then
            message="Failed asserts found, expected none"
        else
            message="Expected failed asserts, found none"
        fi

        echo "| $message | $template_path |[View file](https://github.com/${GITHUB_REPOSITORY}/blob/${GITHUB_REF_NAME}/$template_path) |" >> $SUMMARY_FILE
    fi
done < <(find validation_test_results/"$version" -type f -print0)

if [[ "$has_failures" == true ]]; then
    exit 1
fi
