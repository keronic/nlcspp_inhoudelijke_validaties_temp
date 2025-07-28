<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-moffen-have-required-values">
    <rule context="//nlcs:MSmof | //nlcs:HSmof | //nlcs:LSmof">    
        <assert id="functie_present"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
            De functie op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
        
        <assert id="verbindingnummer_present"
            test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)">
            Het Verbindingnummer op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
    </rule>
    <rule context="//nlcs:MSmof | //nlcs:HSmof">
        <assert id="naam_monteur_present"
            test="keronic:element-exists-and-not-empty(nlcs:NaamMonteur)">
            Het attribuut NaamMonteur op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
        
        <assert id="cross_bonding_present"
            test="keronic:element-exists-and-not-empty(nlcs:CrossBoundingAanwezig)">
            Het attribuut CrossBondingAanwezig op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
    </rule>
</pattern>