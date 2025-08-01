<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-lskabels-have-required-values">
    <rule context="//nlcs:LSkabel">
        <let name="handle"
            value="nlcs:Handle"/>

        <assert id="lskabel-has-bovengronds"
            test="keronic:element-exists-and-not-empty(nlcs:Bovengronds)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Bovengronds', $handle])"/>
        </assert>

        <assert id="lskabel-has-functie"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie', $handle])"/>
        </assert>
    </rule>
</pattern>