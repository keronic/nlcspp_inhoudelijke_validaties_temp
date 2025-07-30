<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-cables-have-subnettype">
    <rule context="//nlcs:MSkabel">
        <let name="handle"
            value="nlcs:Handle"/>

        <let name="subnettype"
            value="nlcs:Subnettype"/>
        
        <assert test="keronic:element-exists-and-not-empty($subnettype)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Subnettype', $handle])"/>
        </assert>
    </rule>
</pattern>
