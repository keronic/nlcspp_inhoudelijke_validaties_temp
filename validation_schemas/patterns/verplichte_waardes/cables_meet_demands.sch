<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-cables-meet-demands">
    <rule context="//nlcs:LSkabel | //nlcs:MSkabel | //nlcs:HSkabel">
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
        
        <let name="kabelopbouwIsValid"
            value="keronic:element-exists-and-not-empty(nlcs:Kabelopbouw)"/>
        <let name="fabrikantIsValid"
            value="keronic:element-exists-and-not-empty(nlcs:Fabrikant)"/>
        <let name="verbindingsnummerIsValid"
            value="keronic:element-exists-and-not-empty(nlcs:Verbindingsnummer)"/>
        <let name="spanningsniveauIsValid"
            value="keronic:element-exists-and-not-empty(nlcs:Spanningsniveau)"/>
        <let name="aardingssysteemIsValid"
            value="keronic:element-exists-and-not-empty(nlcs:Aardingssysteem)"/>
        <let name="faseAanduidingIsValid"
            value="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)"/>
        
        <let name="bovengrondsIsValid"
            value="name(.) != 'LSkabel' or keronic:element-exists-and-not-empty(nlcs:Bovengronds)"/>
        <let name="functieIsValid"
            value="name(.) != 'LSkabel' or keronic:element-exists-and-not-empty(nlcs:Functie)"/>
        
        <let name="validationChecks"
            value="($uitvoeringIsValid, $kabelopbouwIsValid, $fabrikantIsValid, $verbindingsnummerIsValid, $spanningsniveauIsValid, $aardingssysteemIsValid, $faseAanduidingIsValid, $bovengrondsIsValid, $functieIsValid)"/>
        
        <assert id="kabels-meet-demands" 
            test="every $check in $validationChecks satisfies $check = true()">
            Object <value-of select="nlcs:Handle"/> moet de volgende kenmerken bevatten:
            - Uitvoering
            - Omschrijving uitvoering (indien uitvoering 'KEUZE ONTBREEKT IN LIJST' is)
            - Kabelopbouw
            - Fabrikant
            - Verbindingsnummer
            - Spanningsniveau
            - Aardingssysteem
            - Fase aanduiding
            - Bovengronds (enkel voor LS kabel)
            - Functie (enkel voor LS kabel)
        </assert>
    </rule>
</pattern>