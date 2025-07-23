<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-points-connected-to-lines">
    <rule context="//nlcs:MSmof | //nlcs:MSoverdrachtspunt">
        <let name="mskabel_pos_lists"
            value="//nlcs:MSkabel/nlcs:Geometry/gml:LineString/gml:posList"/>

        <let name="point_connected"
            value="some $pos_list in $mskabel_pos_lists satisfies true()"/>

        <assert test="false()">

            Count:   <value-of select="count($mskabel_pos_lists)"/>
            Content: <value-of select="$mskabel_pos_lists[1]"/>
        </assert>
    </rule>
</pattern>