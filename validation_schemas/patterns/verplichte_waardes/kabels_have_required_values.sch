<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-kabels-have-required-values">
    <rule context="//nlcs:LSkabel | //nlcs:MSkabel | //nlcs:HSkabel">
        <let name="handle"
            value="nlcs:Handle"/>

        <let name="uitvoering"
            value="nlcs:Uitvoering"/>

        <assert id="kabel-has-uitvoering"
            test="keronic:element-exists-and-not-empty($uitvoering)">
            UITVOERING
        </assert>

        <assert id="kabel-uitvoering-keuze-ontbreekt-uit-lijst-has-omschrijving-uitvoering"
            test="not($uitvoering = 'KEUZE ONTBREEKT IN LIJST') or keronic:element-exists-and-not-empty(nlcs:OmschrijvingUitvoering)">
            OMSCHRIJVING UITVOERING
        </assert>
        
        <assert id="kabel-has-kabelopbouw"
            test="keronic:element-exists-and-not-empty(nlcs:Kabelopbouw)">
            KABELOPBOUW
        </assert>
        
        <assert id="kabel-has-fabrikant"
            test="keronic:element-exists-and-not-empty(nlcs:Fabrikant)">
            FABRIKANT
        </assert>
        
        <assert id="kabel-has-verbindingsnummer"
            test="keronic:element-exists-and-not-empty(nlcs:Verbindingsnummer)">
            VERBINDINGSNUMMER
        </assert>
        
        <assert id="kabel-has-spanningsniveau"
            test="keronic:element-exists-and-not-empty(nlcs:Spanningsniveau)">
            SPANNINGSNIVEAU
        </assert>
        
        <assert id="kabel-has-aardingsysteem"
            test="keronic:element-exists-and-not-empty(nlcs:Aardingsysteem)">
            AARDINGSYSTEEM
        </assert>
        <assert id="kabel-has-fase-aanduiding"
            test="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)">
            FASE AANDUIDING
        </assert>
    </rule>
</pattern>