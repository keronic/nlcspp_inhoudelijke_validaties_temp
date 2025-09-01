<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="verplaatsing-goed-vastgelegd" abstract="true">
    <rule context="//nlcs:MSkabel | //nlcs:LSkabel">
        <let name="isVerplaatsing"
            value="nlcs:Status = 'REVISIE' and nlcs:Bewerking = 'VERPLAATSEN'"/>

        <let name="hasSomeOriginal"
            value="some $kabel in //nlcs:MSkabel satisfies $kabel ne . and $kabel/nlcs:Status = 'BESTAAND' and $kabel/nlcs:GisId = nlcs:GisId"/>

        <assert id="verplaatsen_correctly_applied"
            test="if ($isVerplaatsing) then $hasSomeOriginal else true()"
            properties="scope rule-number severity object-type object-id">
            <value-of select="keronic:get-translation('verplaatsen-incorrectly-applied')"/>
        </assert>
    </rule>
</pattern>
