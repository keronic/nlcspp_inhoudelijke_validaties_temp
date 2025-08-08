#!/bin/bash

version="v11"

# for phase_dir in validation_output/$version/*; do
#     phase=$(basename "$phase_dir")
#     for test_dir in $phase_dir/*; do
#         test=$(basename "$test_dir")
#         mkdir -p validation_test_results/$version/$phase/$test
#         java -jar saxon-he.jar -xsl:transformations/validation_output.xsl -s:validation_output/$version/$phase/$test/ -o:validation_test_results/$version/$phase/$test/
#     done
# done

has_failures=false

# Loop over all files and check contents
while IFS= read -r -d '' file; do
    if [[ "$(cat "$file")" != "PASS" ]]; then
        template_path="${file/validation_test_results\//templates/}"
        template_path="${template_path/%.txt/.xml}"

        test=$(echo "$file" | cut -d'/' -f4)
        if [[ "$test" == "passing" ]]; then
            message="Report contains failed asserts, expected none"
        else
            message="Report contains no failed asserts, expected at least one"
        fi
        
        echo "::error file=$template_path,title=Validation Failed::$message"
        has_failures=true
    fi
done < <(find validation_test_results/"$version" -type f -print0)

if [[ "$has_failures" == true ]]; then
    echo "::notice title=Validation Reports in Artifacts::Check the job artifacts for the reports of every validation."
    exit 1
fi
