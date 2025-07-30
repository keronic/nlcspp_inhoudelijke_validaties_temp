<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-stations-kasten-have-required-values">
    <rule context="//nlcs:LSkast | //nlcs:MSstation | //HSstation">
        <let name="handle"
            value="nlcs:Handle"/>

        <assert id="object-has-functie"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie', $handle])"/>
        </assert>
        
        <assert id="object-has-number"
            test="keronic:element-exists-and-not-empty(nlcs:Nummer)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Nummer', $handle])"/>
        </assert>
    </rule>
</pattern>