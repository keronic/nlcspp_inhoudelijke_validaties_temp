<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-kabels-have-required-values">
    <rule context="//nlcs:LSkabel | //nlcs:MSkabel | //nlcs:HSkabel">
        <let name="uitvoering"
            value="nlcs:Uitvoering"/>

        <let name="rule_number" value="8"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>

        <assert id="kabel-has-uitvoering"
            test="keronic:element-exists-and-not-empty($uitvoering)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Uitvoering'])"/>
        </assert>

        <assert id="kabel-uitvoering-keuze-ontbreekt-uit-lijst-has-omschrijving-uitvoering"
            test="not($uitvoering = 'KEUZE ONTBREEKT IN LIJST') or keronic:element-exists-and-not-empty(nlcs:OmschrijvingUitvoering)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['OmschrijvingUitvoering'])"/>
        </assert>

        <assert id="kabel-has-kabelopbouw"
            test="keronic:element-exists-and-not-empty(nlcs:Kabelopbouw)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Kabelopbouw'])"/>
        </assert>

        <assert id="kabel-has-fabrikant"
            test="keronic:element-exists-and-not-empty(nlcs:Fabrikant)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Fabrikant'])"/>
        </assert>

        <assert id="kabel-has-verbindingnummer"
            test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingnummer'])"/>
        </assert>

        <assert id="kabel-has-spanningsniveau"
            test="keronic:element-exists-and-not-empty(nlcs:Spanningsniveau)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Spanningsniveau'])"/>
        </assert>

        <assert id="kabel-has-aardingsysteem"
            test="keronic:element-exists-and-not-empty(nlcs:Aardingsysteem)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aardingsysteem'])"/>
        </assert>
        <assert id="kabel-has-fase-aanduiding"
            test="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['FaseAanduiding'])"/>
        </assert>
    </rule>
</pattern>
