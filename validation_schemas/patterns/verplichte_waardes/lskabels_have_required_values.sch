<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-lskabels-have-required-values">
    <rule context="//nlcs:LSkabel">
        <assert id="lskabel-has-bovengronds"
            test="keronic:element-exists-and-not-empty(nlcs:Bovengronds)">
            BOVENGRONDS
        </assert>

        <assert id="lskabel-has-functie"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
            FUNCTIE
        </assert>
    </rule>
</pattern>