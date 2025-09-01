<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="mantelbuis-inhoud-aanwezig" abstract="true">
    <rule context="//nlcs:Amantelbuis">
        <let name="bedrijfsToestand"
            value="nlcs:BedrijfsToestand"/>

        <let name="assetId"
            value="nlcs:AssetId"/>

        <let name="inhoud"
            value="//nlcs:AmantelbuisInhoud[nlcs:MantelbuisAssetId = $assetId]"/>

        <assert id="inhoud_exists_when_in_bedrijf"
            test="if ($bedrijfsToestand = 'IN BEDRIJF') then $inhoud else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation('inhoud-not-found')"/>
        </assert>

        <assert id="inhoud_does_not_exist_when_reserve"
            test="if ($bedrijfsToestand = 'RESERVE') then not($inhoud) else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation('inhoud-found')"/>
        </assert>
    </rule>
</pattern>
