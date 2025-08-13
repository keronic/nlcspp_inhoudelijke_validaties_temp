<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-mantelbuis-inhoud-correct">
    <rule context="//nlcs:Amantelbuis">
        <let name="rule_number" value="28"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <let name="bedrijfsToestand"
            value="nlcs:BedrijfsToestand"/>

        <let name="assetId"
            value="nlcs:AssetId"/>

        <let name="inhoud"
            value="//nlcs:AmantelbuisInhoud[nlcs:MantelbuisAssetId = $assetId]"/>

        <assert id="inhoud_exists" 
            test="if ($bedrijfsToestand = 'RESERVE') then not($inhoud) else $inhoud"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation('inhoud-not-correct-for-bedrijfstoestand')"/>
        </assert>
    </rule>
</pattern>