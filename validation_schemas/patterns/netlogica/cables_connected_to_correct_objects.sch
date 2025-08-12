<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-mskabel-connected-to-correct-object">
    <rule context="//nlcs:MSkabel">
        <let name="geometry"
            value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList))"/>
        
        <let name="moffen-geometries"
            value="//nlcs:MSmof/nlcs:Geometry/gml:Point/gml:pos"/>
        
        <let name="overdrachtspunt-geometries"
            value="//nlcs:MSoverdrachtspunt/nlcs:Geometry/gml:Point/gml:pos"/>
        
        <let name="station-geometries"
            value="//nlcs:MSstation/nlcs:Geometry/gml:polygon/gml:exterior/gml:LinearRing/gml:posList"/>

        <let name="first-point"
            value="$geometry[1], $geometry[2], $geometry[3]"
            as="xs:string*"/>
        
        <let name="last-point"
            value="$geometry[count($geometry) - 2], $geometry[count($geometry) - 1], $geometry[count($geometry)]"
            as="xs:string*"/>
        
        <let name="kabel-is-verlaten"
            value="//nlcs:Bedrijfstoestand = 'VERLATEN'"/>
        
        <let name="connected-to-moffen"
            value="some $mof-geometry in $moffen-geometries satisfies keronic:point-3d-connected-to-point-3d($first-point, tokenize(normalize-space($mof-geometry)), 0) or keronic:point-3d-connected-to-point-3d($last-point, tokenize(normalize-space($mof-geometry)), 0)"/>
        
        <let name="connected-to-overdrachtspunt"
            value="some $overdrachtspunt-geometry in $overdrachtspunt-geometries satisfies keronic:point-3d-connected-to-point-3d($first-point, tokenize(normalize-space($overdrachtspunt-geometry)), 0) or keronic:point-3d-connected-to-point-3d($last-point, tokenize(normalize-space($overdrachtspunt-geometry)), 0)"/>
        
        <let name="connected-to-station"
            value="some $station-geometry in $station-geometries satisfies keronic:point-3d-connected-to-area-3d($first-point, tokenize(normalize-space($station-geometry)), 0) or keronic:point-3d-connected-to-area-3d($first-point, tokenize(normalize-space($station-geometry)), 0)"/>
        
        <assert test="$kabel-is-verlaten or ($connected-to-moffen or $connected-to-overdrachtspunt or $connected-to-station)">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-not-connected-to-valid-object', [nlcs:Handle])"/>
        </assert>
    </rule>
</pattern>
