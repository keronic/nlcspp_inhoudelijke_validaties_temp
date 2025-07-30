<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-points-connected-to-lines">
    <rule context="//nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        <let name="mskabel_pos_lists"
            value="//nlcs:MSkabel/nlcs:Geometry/gml:LineString/gml:posList"/>

        <let name="geometry"
            value="tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos))"/>

        <let name="point_connected"
            value="some $pos_list in $mskabel_pos_lists satisfies keronic:point-3d-connected-to-line-3d($geometry, tokenize(normalize-space($pos_list)), 0)"/>

        <assert test="$point_connected">
            <value-of select="keronic:get-translation-and-replace-placeholders('point-not-connected-to-any-line', [nlcs:Handle])"/>
        </assert>
    </rule>
</pattern>