<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-scope-validity">
    <rule context="//nlcs:NLCSnetbeheerType/*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]">

        <let name="tekening_type"
            value="//nlcs:NLCSnetbeheerType/nlcs:AprojectReferentie/nlcs:TekeningType"/>

        <assert id="scope-valid" test="not(empty(keronic:matching-scope(.)))">
            Unable to determine scope for object.
            TekeningType:       <value-of select="$tekening_type"/>
            Status:             <value-of select="nlcs:Status"/>
            Bedrijfstoestand:   <value-of select="nlcs:Bedrijfstoestand"/>
        </assert>
    </rule>
</pattern>
