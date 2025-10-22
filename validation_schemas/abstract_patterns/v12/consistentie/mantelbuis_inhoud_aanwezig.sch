<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="mantelbuis-inhoud-aanwezig" abstract="true">
    <rule context="//nlcs:Amantelbuis">
        <let name="bedrijfstoestand"
            value="nlcs:BedrijfsToestand"/>

        <let name="id"
            value="nlcs:ID"/>

        <let name="mantelbuisinhoud"
            value="//nlcs:AmantelbuisInhoud[nlcs:MantelbuisID = $id]"/>

        <let name="mantelbuisinhoud_id"
            value="$mantelbuisinhoud/nlcs:ID"/>

        <let name="inhoud_id"
            value="$mantelbuisinhoud/nlcs:InhoudID"/>

        <let name="inhoud"
            value="//nlcs:NLCSnetbeheer/*[nlcs:ID = $inhoud_id]"/>

        <assert id="inhoud_exists_when_in_bedrijf"
            test="if ($bedrijfstoestand = 'IN BEDRIJF') then $mantelbuisinhoud else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation('inhoud-not-found')"/>
        </assert>

        <assert id="inhoud_contains_object"
            test="if ($bedrijfstoestand = 'IN BEDRIJF' and $mantelbuisinhoud) then $inhoud else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('inhoud-object-not-found', [$mantelbuisinhoud_id, $inhoud_id])"/>
        </assert>

        <assert id="inhoud_does_not_exist_when_reserve"
            test="if ($bedrijfstoestand = 'RESERVE') then not($mantelbuisinhoud) else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('inhoud-found', [$mantelbuisinhoud_id])"/>
        </assert>
    </rule>
    <rule context="//nlcs:AmantelbuisInhoud">
        <let name="mantelbuis_id"
            value="nlcs:MantelbuisID"/>

        <let name="mantelbuis"
            value="//nlcs:Amantelbuis[nlcs:ID = $mantelbuis_id]"/>

        <assert id="mantelbuisinhoud_related_to_mantelbuis"
            test="$mantelbuis"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('inhoud-floating', [$mantelbuis_id])"/>
        </assert>
    </rule>
</pattern>
