<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-cables-meet-demands">
    <rule context="//nlcs:LSkabel | //nlcs:MSkabel | //nlcs:HSkabel">
        <let name="handle"
            value="nlcs:Handle"/>

        <let name="uitvoering"
            value="nlcs:Uitvoering"/>
        <let name="omschrijvingUitvoering"
            value="nlcs:OmschrijvingUitvoering"/>
        
        <let name="uitvoeringIsValid"
            value="
                if($uitvoering = 'KEUZE ONTBREEKT IN LIJST') then
                    keronic:element-exists-and-not-empty($omschrijvingUitvoering)
                else
                    keronic:element-exists-and-not-empty($uitvoering)
            "/>
        
        <assert id="kabels-have-proper-uitvoering"
            test="$uitvoeringIsValid">
            Object <value-of select="$handle"/> moet een uitvoering bevatten (en een omschrijving uitvoering indien de uitvoering 'KEUZE ONTBREEKT IN LIJST' is).
        </assert>

        <let name="bovengrondsIsValid"
            value="name(.) != 'LSkabel' or keronic:element-exists-and-not-empty(nlcs:Bovengronds)"/>
        <let name="functieIsValid"
            value="name(.) != 'LSkabel' or keronic:element-exists-and-not-empty(nlcs:Functie)"/>
        
        <assert id="lskabel-bovengronds-and-functie" 
            test="$bovengrondsIsValid and $functieIsValid">
            Object <value-of select="$handle"/> moet een eigenschap bovengronds en functie bevatten.
        </assert>
    </rule>
</pattern>