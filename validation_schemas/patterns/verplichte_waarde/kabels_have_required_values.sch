<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-kabels-have-required-values">
    <rule context="//nlcs:LSkabel | //nlcs:MSkabel | //nlcs:HSkabel">
        <let name="handle"
            value="nlcs:Handle"/>

        <let name="uitvoering"
            value="nlcs:Uitvoering"/>

        <let name="rule_number" value="8"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="$handle"/>

        <assert id="kabel-has-uitvoering"
            test="keronic:element-exists-and-not-empty($uitvoering)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Uitvoering', $handle])"/>
        </assert>

        <assert id="kabel-uitvoering-keuze-ontbreekt-uit-lijst-has-omschrijving-uitvoering"
            test="not($uitvoering = 'KEUZE ONTBREEKT IN LIJST') or keronic:element-exists-and-not-empty(nlcs:OmschrijvingUitvoering)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['OmschrijvingUitvoering', $handle])"/>
        </assert>
        
        <assert id="kabel-has-kabelopbouw"
            test="keronic:element-exists-and-not-empty(nlcs:Kabelopbouw)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Kabelopbouw', $handle])"/>
        </assert>
        
        <assert id="kabel-has-fabrikant"
            test="keronic:element-exists-and-not-empty(nlcs:Fabrikant)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Fabrikant', $handle])"/>
        </assert>
        
        <assert id="kabel-has-verbindingsnummer"
            test="keronic:element-exists-and-not-empty(nlcs:Verbindingsnummer)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingsnummer', $handle])"/>
        </assert>
        
        <assert id="kabel-has-spanningsniveau"
            test="keronic:element-exists-and-not-empty(nlcs:Spanningsniveau)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Spanningsniveau', $handle])"/>
        </assert>
        
        <assert id="kabel-has-aardingsysteem"
            test="keronic:element-exists-and-not-empty(nlcs:Aardingsysteem)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aardingsysteem', $handle])"/>
        </assert>
        <assert id="kabel-has-fase-aanduiding"
            test="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)"
            properties="rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['FaseAanduiding', $handle])"/>
        </assert>
    </rule>
</pattern>