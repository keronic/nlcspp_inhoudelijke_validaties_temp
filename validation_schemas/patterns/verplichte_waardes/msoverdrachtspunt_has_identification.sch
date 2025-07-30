<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-msoverdrachtspunt-has-identification">
    <rule context="//nlcs:MSoverdrachtspunt">
        <let name="handle"
            value="nlcs:Handle"/>
        
        <assert id="v11-msoverdrachtspunt-has-identification"
            test="keronic:element-exists-and-not-empty(nlcs:Identificatie)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Identificatie', $handle])"/>
        </assert>
    </rule>
</pattern>