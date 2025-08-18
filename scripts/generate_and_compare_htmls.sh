#!/bin/bash

java -jar saxon-he.jar -xsl:doc/NLCSValidatieRegels.xsl -s:doc/NLCSValidatieRegels.xml -o:doc/NLCSValidatieRegels.html
    
if ! git diff --quiet doc/NLCSValidatieRegels.html; then
    echo "::error file=doc/NLCSValidatieRegels.html,title=Changes detected in NLCSValidatieRegels.html::Please run java -jar saxon-he.jar -xsl:doc/NLCSValidatieRegels.xsl -s:doc/NLCSValidatieRegels.xml -o:doc/NLCSValidatieRegels.html locally and commit the changed HTML."
    exit 1
fi