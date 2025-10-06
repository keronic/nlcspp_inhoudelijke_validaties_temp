<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="mantelbuis-inhoud-aanwezig" abstract="true">
    <rule context="//nlcs:Amantelbuis">
        <let name="bedrijfsToestand"
            value="nlcs:BedrijfsToestand"/>

        <let name="assetId"
            value="nlcs:AssetId"/>

        <let name="inhoud"
            value="//nlcs:AmantelbuisInhoud[nlcs:MantelbuisID = $assetId]"/>

        <let name="inhoudID"
            value="$inhoud/nlcs:InhoudID"/>

        <let name="inhoud_object"
            value="//nlcs:NLCSnetbeheer/*[nlcs:ID = $inhoudID]"/>

        <assert id="inhoud_exists_when_in_bedrijf"
            test="if ($bedrijfsToestand = 'IN BEDRIJF') then $inhoud else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation('inhoud-not-found')"/>
        </assert>

        <assert id="inhoud_contains_object"
            test="if ($bedrijfsToestand = 'IN BEDRIJF' and $inhoud) then $inhoud_object else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation('inhoud-object-not-found')"/>
        </assert>

        <assert id="inhoud_does_not_exist_when_reserve"
            test="if ($bedrijfsToestand = 'RESERVE') then not($inhoud) else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('inhoud-found', [$inhoud/nlcs:ID])"/>
        </assert>
    </rule>
</pattern>
