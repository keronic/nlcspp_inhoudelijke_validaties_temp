<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-fase-and-uitvoering-same">
    <rule context="//nlcs:MSkabel">
        
        <let name="rule_number" value="21"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <let name="fase"
            value="nlcs:FaseAanduiding"/>
        
        <let name="uitvoering"
            value="nlcs:Uitvoering"/>
        
        <let name="fase-first-char"
            value="substring($fase, 1, 1)"/>
        
        <let name="uitvoering-first-char"
            value="substring($uitvoering, 1, 1)"/>
        
        <let name="expected-first-char"
            value="if ($fase-first-char = '3') then '3' else '1'"/>

        <assert id="fase-and-uitvoering-same"
                properties="scope rule-number object-type object-id"
                test="$fase-first-char = 'N' or $uitvoering-first-char = $expected-first-char">
                <value-of select="keronic:get-translation('fase-not-the-same-as-uitvoering')"/>
        </assert>
    </rule>
</pattern>