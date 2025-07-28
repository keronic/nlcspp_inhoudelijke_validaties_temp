<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-stations-kasten-have-required-values">
    <rule context="//nlcs:LSkast | //nlcs:MSstation | //HSstation">
        
        <assert id="object-has-functie"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
            Object <value-of select="nlcs:Handle"/> moet een waarde voor attribuut Functie hebben.
        </assert>
        
        <assert id="object-has-number"
            test="keronic:element-exists-and-not-empty(nlcs:Nummer)">
            Object <value-of select="nlcs:Handle"/> moet een waarde voor attribuut Nummer hebben.
        </assert>
    </rule>
</pattern>