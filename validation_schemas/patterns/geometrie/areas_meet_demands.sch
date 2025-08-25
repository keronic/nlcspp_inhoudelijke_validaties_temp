<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-areas-meet-demands">
     <rule context="//nlcs:ABeschermingvlak | //nlcs:MSstation | //nlcs:Akunstwerk">
          <let name="geometry"
               value="tokenize(normalize-space(nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>

          <let name="geometry_doubles"
               value="for $v in $geometry return xs:double($v)"/>

          <let name="coords_amount"
               value="count($geometry) idiv 3"/>

          <let name="coords"
               value="for $v in $geometry return xs:double($v)"/>

          <let name="distances"
               value="
                    for $i in 1 to $coords_amount - 1
                    return keronic:point-3d-to-point-3d-distance(
                              $coords[(3 * $i) - 2], $coords[(3 * $i) - 1], $coords[(3 * $i)],
                              $coords[(3 * ($i + 1)) - 2], $coords[(3 * ($i + 1)) - 1], $coords[(3 * ($i + 1))]
                         )
               "/>

          <let name="rule_number"
               value="4"/>
          <let name="object_type"
               value="name(.)"/>
          <let name="object_id"
               value="nlcs:Handle"/>

          <assert id="assert-area-meets-length-demand"
               test="not(some $d in $distances satisfies $d le 10 or $d ge 50)"
               properties="scope rule-number object-type object-id">
               <value-of select="keronic:get-translation('line-segment-measurement-incorrect')"/>
          </assert>
     </rule>
</pattern>
