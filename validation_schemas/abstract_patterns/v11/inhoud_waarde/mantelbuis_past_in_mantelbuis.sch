<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="mantelbuis-past-in-mantelbuis" abstract="true">
    <rule context="//nlcs:Amantelbuis">
        <let name="assetId"
             value="nlcs:AssetId"/>

        <let name="inhoud"
            value="//nlcs:AmantelbuisInhoud[nlcs:MantelbuisAssetId = $assetId]"/>

        <let name="inhoud_diameter"
             value="$inhoud/nlcs:Diameter"/>

        <assert id="mantelbuis_inhoud_fits_in_mantelbuis"
            test="nlcs:Diameter > $inhoud_diameter"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders(
                'mantelbuis-inhoud-diameter-larger-than-own',
                [nlcs:Diameter, $inhoud_diameter])"/>
        </assert>
    </rule>
</pattern>
