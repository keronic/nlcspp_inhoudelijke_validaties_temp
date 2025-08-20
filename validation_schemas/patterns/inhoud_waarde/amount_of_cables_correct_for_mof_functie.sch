<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-amount-of-cables-correct-for-mof-functie">
    <rule context="//nlcs:MSmof[nlcs:Functie = ('EINDMOF', 'EINDDOP', 'LOODKOP', 'EIND GEAARD')]">
        <let name="rule_number" value="26"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <let name="msmof"
            value="."/>
        
        <let name="connected_mskabels"
            value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(
                        tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),
                        tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),
                        0)]"/>
        <let name="required_amount"
            value="1"/>
        
        <assert id="mof_connected_to_right_amount_of_cables"
                properties="scope rule-number object-type object-id"
            test="count($connected_mskabels) = $required_amount">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string($required_amount), string(count($connected_mskabels))])"/>
        </assert>
    </rule>
    
    <rule context="//nlcs:MSmof[nlcs:Functie = ('VERBINDNG', 'ZEGELWIJZIGING', 'MANTELREPARATIE')]">
        <let name="rule_number" value="26"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <let name="msmof"
            value="."/>
        
        <let name="connected_mskabels"
            value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(
                        tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),
                        tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),
                        0)]"/>
        
        <let name="unique_connected_phases"
            value="distinct-values($connected_mskabels/nlcs:FaseAanduiding)"/>
        
        <let name="required_amount"
            value="if (count($unique_connected_phases) = 1) then 2 else 4"/>
        
        <assert id="mof_connected_to_right_amount_of_cables"
                properties="scope rule-number object-type object-id"
            test="count($connected_mskabels) = $required_amount">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string($required_amount), string(count($connected_mskabels))])"/>
        </assert>
    </rule>
    <rule context="//nlcs:MSmof[nlcs:Functie = ('AFTAK')]">
        <let name="rule_number" value="26"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>
        
        <let name="msmof"
            value="."/>
        
        <let name="connected_mskabels"
            value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(
                        tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),
                        tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),
                        0)]"/>
        <let name="cable_statuses"
            value="$connected_mskabels/nlcs:Status"/>
        
        <let name="required_amount"
            value="if (count($cable_statuses[. = 'BESTAAND']) = 0) then 3 else 2"/>
        
        <assert id="mof_connected_to_right_amount_of_cables"
                properties="scope rule-number object-type object-id"
            test="count($connected_mskabels) = $required_amount">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string($required_amount), string(count($connected_mskabels))])"/>
        </assert>
        
        <assert id="bestaande_cable_also_connected_to_one_new_cable"
                properties="scope rule-number object-type object-id"
            test="not($required_amount = 2) or count($cable_statuses[. = 'NIEUW'] != 0)">
            <value-of select="keronic:get-translation('bestaande-cable-not-connected-to-new-cable')"/>
        </assert>
    </rule>
</pattern>
