#!/bin/bash

version="v11"

# Include includes
java -jar saxon-he.jar -xsl:transformations/includes.xsl -s:validation_schemas/base/$version.sch -o:validation_schemas/base_included/$version.sch

# Generate schemas
java -jar saxon-he.jar -xsl:transformations/schemas.xsl -s:validation_schemas/base_included/$version.sch

# Transpile (target directory must explicitly exist)
mkdir -p validation_schemas/scopes_transpiled
java -jar saxon-he.jar -xsl:wrappers/transpile_scope_wrapper.xsl -s:validation_schemas/scopes/ -o:validation_schemas/scopes_transpiled/
