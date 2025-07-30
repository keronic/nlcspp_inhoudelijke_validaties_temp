<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron"
         id="v11-moffen-have-required-values">
    <rule context="//nlcs:MSmof | //nlcs:HSmof | //nlcs:LSmof">  
        <let name="handle"
            value="nlcs:Handle"/>
        
        <assert id="functie_present"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie', $handle])"/>
        </assert>
        
        <assert id="verbindingnummer_present"
            test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingnummer', $handle])"/>
        </assert>
    </rule>
</pattern>
