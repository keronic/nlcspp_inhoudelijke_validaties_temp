<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-areas-meet-demands">
     <rule context="//nlcs:ABeschermingvlak | //nlcs:MSstation">
          <let name="handle"
               value="nlcs:Handle"/>
          
          <let name="geometry"
               value="tokenize(normalize-space(nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
          
          <let name="geometry_doubles"
               value="for $v in $geometry return xs:double($v)"/>
          
          <let name="coords_amount"
               value="count($geometry) idiv 2"/>
          
          <let name="coords"
               value="for $v in $geometry return xs:double($v)"/>
          
          <let name="distances"
               value="
                    for $i in 1 to $coords_amount - 1
                    return keronic:point-2d-to-point-2d-distance(
                              $coords[(2 * $i) - 1], $coords[(2 * $i)],
                              $coords[(2 * ($i + 1)) - 1], $coords[(2 * ($i + 1))]
                         )
               "/>
          
          <assert id="assert-line-meets-length-demand"
               test="not(some $d in $distances satisfies $d le 10 or $d ge 50)">
               <value-of select="keronic:get-translation-and-replace-placeholders('line-segment-measurement-incorrect', [$handle])"/>
          </assert>
     </rule>
</pattern>