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
        
        <let name="expected_uitvoering_prefix"
            value="if ($fase = '3 Fasen') then '3x'
                else if ($fase = 'L1' or $fase = 'L2' or $fase = 'L3') then '1x'
                else ''"/>
        
        <assert id="fase-and-uitvoering-same"
                properties="scope rule-number object-type object-id"
            test="starts-with($uitvoering, $expected_uitvoering_prefix)">
            <value-of select="keronic:get-translation('fase-not-the-same-as-uitvoering')"/>
        </assert>
    </rule>
</pattern>