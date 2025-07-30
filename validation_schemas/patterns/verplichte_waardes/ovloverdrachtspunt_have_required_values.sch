<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-ovloverdrachtspunt-have-required-values">
    <rule context="//nlcs:OVLoverdrachtspunt">
        <let name="handle"
            value="nlcs:Handle"/>
        
        
        <assert test="keronic:element-exists-and-not-empty(nlcs:Aansluitset)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aansluitset', $handle])"/>
        </assert>
        
        <assert test="keronic:element-exists-and-not-empty(nlcs:Mastnummer)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Mastnummer', $handle])"/>
        </assert>
    </rule>
</pattern>
