#!/bin/bash

xml=$1
if [ -z "$xml" ]; then
    echo "Error: No XML provided."
    exit 1
fi

matching_scopes=$(java -jar saxon-he.jar -xsl:transformations/find_matching_scopes.xsl -s:$xml)
IFS=$'\n' read -rd '' -a matching_scopes_arr <<<"$matching_scopes"
matching_scopes_count=${#matching_scopes_arr[@]}

if [ "$matching_scopes_count" -eq 0 ]; then
    echo "No matching scope found"
    exit 1
fi

for scope in "${matching_scopes_arr[@]}"; do
    java -jar saxon-he.jar -xsl:validation_schemas/scopes_transpiled/$scope.xsl -s:$xml -o:$scope.svrl.xml
    echo "Validated $scope"
done
