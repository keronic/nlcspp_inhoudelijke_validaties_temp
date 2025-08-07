#!/bin/bash

if [ -z "$1" ]; then
    echo Must provide a rule \(e.g. R.1\)
    exit 1
fi

if [ -z "$2" ]; then
    echo Must provide either passing or failing
    exit 1
fi

if [ -z "$3" ]; then
    echo Must provide the corresponding validation file name
    exit 1
fi

version="v11"

# Include includes
java -jar saxon-he.jar -xsl:transformations/includes.xsl -s:validation_schemas/base/$version.sch -o:validation_schemas/base_included/$version.sch

# Generate schemas
java -jar saxon-he.jar -xsl:transformations/schemas.xsl -s:validation_schemas/base_included/$version.sch

# Transpile (target directory must explicitly exist)
mkdir -p validation_schemas/scopes_transpiled
java -jar saxon-he.jar -xsl:transpile_wrapper.xsl -s:validation_schemas/scopes/ -o:validation_schemas/scopes_transpiled/ #phase=$1