<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-all-geometries-in-project-area">
    <!-- Point geometries -->
    <rule context="//nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        <let name="handle"
            value="nlcs:Handle"/>
        
        <let name="placeholders"
            value="[$handle]"/>
        
        <let name="project_area_pos_list"
            value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
        
        <let name="point_pos"
            value="tokenize(normalize-space((nlcs:Geometry/gml:Point/gml:pos)))"/>
        
        <assert id="assert-point-inside-project-area" test="keronic:point-3d-interacts-with-area-2d($point_pos, $project_area_pos_list)">
           <value-of select="keronic:get-translation-and-replace-placeholders('point-outside-of-project-area', [$handle])"/>
        </assert>
    </rule>
    
    <!-- Line geometries -->
    <rule context="//nlcs:MSkabel | //nlcs:Amantelbuis | //nlcs:Akunstwerk | //nlcs:EAarddraad | //nlcs:Aaanlegtechniek">
        <let name="handle"
            value="nlcs:Handle"/>
        
        <let name="line-message"
            value="keronic:get-translation('line-outside-of-project-area')"/>
        
        <let name="project_area_pos_list"
            value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
        
        <let name="line_pos_list"
            value="tokenize(normalize-space((nlcs:Geometry/gml:LineString/gml:posList)))"/>
        
        <assert id="assert-line-inside-project-area" test="keronic:line-3d-interacts-with-area-2d($line_pos_list, $project_area_pos_list)">
            <value-of select="keronic:get-translation-and-replace-placeholders('line-outside-of-project-area', [$handle])"/>
        </assert>
    </rule>
    
    <!-- Area geometries -->
    <rule context="//nlcs:MSstation | //nlcs:ABeschermingsvlak">
        <let name="project_area_pos_list"
            value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
        
        <let name="handle"
            value="nlcs:Handle"/>
        
        <let name="area_pos_list"
            value="tokenize(normalize-space((nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList)))"/>
        
        <let name="placeholders"
            value="[$handle]"/>
        
        <assert id="assert-area-interacts-with-project-area" test="keronic:area-2d-interacts-with-area-2d($area_pos_list, $project_area_pos_list)">
            <value-of select="keronic:get-translation-and-replace-placeholders('area-outside-of-project-area', [$handle])"/>
        </assert>
    </rule>
</pattern>