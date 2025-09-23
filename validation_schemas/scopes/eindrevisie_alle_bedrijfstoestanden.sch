<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:gml="http://www.opengis.net/gml/3.2"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        queryBinding="xslt3"><!-- schematron namespace declarations -->
   <ns prefix="keronic" uri="http://example.com/my-functions"/>
   <ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
   <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
   <ns prefix="nlcs" uri="NLCSnetbeheer"/>
   <!-- properties for more detailed assert reports -->
   <properties>
      <property id="scope">Eindrevisie alle bedrijfstoestanden</property>
      <property id="rule-number">
         <value-of select="$rule_number"/>
      </property>
      <property id="object-type">
         <value-of select="$object_type"/>
      </property>
      <property id="object-id">
         <value-of select="$object_id"/>
      </property>
      <property id="geometry-2d">
         <value-of select="$geometry_2d"/>
      </property>
      <property id="geometry-3d">
         <value-of select="$geometry_3d"/>
      </property>
   </properties>
   <!-- declaring the rules -->
   <phase id="R.1">
      <active pattern="v11-aprojectreferentie-has-other-objects"/>
   </phase>
   <phase id="R.2">
      <active pattern="v11-statuses-allowed-for-tekening-type"/>
   </phase>
   <phase id="R.3">
      <active pattern="v11-all-geometries-in-project-area"/>
   </phase>
   <phase id="R.4">
      <active pattern="v11-lines-meet-demands"/>
      <active pattern="v11-areas-meet-demands"/>
   </phase>
   <phase id="R.5">
      <active pattern="v11-gisid-assetid-check"/>
   </phase>
   <phase id="R.6">
      <active pattern="v11-elec-assets-have-measurement-details"/>
   </phase>
   <phase id="R.7">
      <active pattern="v11-cables-have-subnettype"/>
   </phase>
   <!-- function delcarations -->
   <xsl:include href="../xsl_functions/global_functions/config_functions.xsl"/>
   <xsl:include href="../xsl_functions/helper_functions/helper_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/2d_geometry_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/3d_geometry_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/2d_geometry_interface_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/3d_geometry_interface_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/3d_2d_geometry_interface_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/geometry_interface_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/line_interface_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/line_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/depth_functions.xsl"/>
   <xsl:include href="../xsl_functions/geometry_functions/depth_interface_functions.xsl"/>
   <pattern id="v11-aprojectreferentie-has-other-objects">
      <rule context="//nlcs:NLCSnetbeheerType">
         <let name="rule_number" value="1"/>
         <let name="nlcs_objects"
              value="*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]"/>
         <assert id="file-has-aprojectreferentie"
                 test="count($aprojectreferenties) = 1"
                 properties="rule-number"
                 severity="Fout">
            <value-of select="keronic:get-translation('aprojectreferentie-not-present')"/>
         </assert>
         <let name="aprojectreferenties" value="nlcs:AprojectReferentie"/>
         <assert id="file-has-nlcs-objects"
                 test="count($nlcs_objects) &gt; 0"
                 properties="scope rule-number"
                 severity="Fout">
            <value-of select="keronic:get-translation('no-nlcs-objects-present')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-statuses-allowed-for-tekening-type">
      <rule context="//nlcs:NLCSnetbeheerType/*">
         <let name="rule_number" value="2"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="is_nlcs_object"
              value="$object_type ne 'AprojectReferentie' and $object_type ne 'VersieNummer'"/>
         <let name="tekening_type"
              value="string(//nlcs:AprojectReferentie/nlcs:TekeningType)"/>
         <let name="status" value="nlcs:Status"/>
         <let name="allowed_statuses"
              value="                 if ($tekening_type = 'BESTAANDE SITUATIE') then                     ['BESTAAND']                 else if ($tekening_type = 'DEELREVISIE') then                     ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD', 'TIJDELIJK']                 else if ($tekening_type = 'DEFINITIEF ONTWERP') then                     ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD', 'TIJDELIJK']                 else if ($tekening_type = 'EINDREVISIE') then                     ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD']                 else if ($tekening_type = 'VOORONTWERP') then                     []                 else                     []             "/>
         <let name="status_is_allowed"
              value="some $allowed_status in $allowed_statuses satisfies $allowed_status = $status"/>
         <assert id="nlcs-object-has-allowed-status"
                 test="not($is_nlcs_object) or $status_is_allowed"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('invalid-status-for-tekening-type', [$status, $tekening_type, string-join($allowed_statuses, ', ')])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-all-geometries-in-project-area"><!-- Point geometries -->
      <rule context="//nlcs:MSmof | //nlcs:MSoverdrachtspunt">
         <let name="project_area_pos_list"
              value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
         <let name="point_pos"
              value="tokenize(normalize-space((nlcs:Geometry/gml:Point/gml:pos)))"/>
         <let name="rule_number" value="3"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="geometry_3d" value="$point_pos"/>
         <assert id="assert-point-inside-project-area"
                 test="keronic:point-3d-interacts-with-area-2d($point_pos, $project_area_pos_list)"
                 properties="scope rule-number object-type object-id geometry-3d"
                 severity="Fout">
            <value-of select="keronic:get-translation('object-outside-project-area')"/>
         </assert>
      </rule>
      <!-- Line geometries -->
      <rule context="//nlcs:MSkabel | //nlcs:Amantelbuis | //nlcs:Akunstwerk | //nlcs:EAarddraad | //nlcs:Aaanlegtechniek">
         <let name="project_area_pos_list"
              value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
         <let name="line_pos_list"
              value="tokenize(normalize-space((nlcs:Geometry/gml:LineString/gml:posList)))"/>
         <let name="rule_number" value="3"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="geometry_3d" value="$line_pos_list"/>
         <assert id="assert-line-inside-project-area"
                 test="keronic:line-3d-interacts-with-area-2d($line_pos_list, $project_area_pos_list)"
                 properties="scope rule-number object-type object-id geometry-3d"
                 severity="Fout">
            <value-of select="keronic:get-translation('object-outside-project-area')"/>
         </assert>
      </rule>
      <!-- Area geometries -->
      <rule context="//nlcs:MSstation | //nlcs:ABeschermingsvlak">
         <let name="project_area_pos_list"
              value="tokenize(normalize-space(//nlcs:AprojectReferentie/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
         <let name="area_pos_list"
              value="tokenize(normalize-space((nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList)))"/>
         <let name="rule_number" value="3"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="geometry_2d" value="$area_pos_list"/>
         <assert id="assert-area-interacts-with-project-area"
                 test="keronic:area-2d-interacts-with-area-2d($area_pos_list, $project_area_pos_list)"
                 properties="scope rule-number object-type object-id geometry-2d"
                 severity="Fout">
            <value-of select="keronic:get-translation('object-outside-project-area')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-areas-meet-demands">
      <rule context="//nlcs:ABeschermingvlak | //nlcs:MSstation | //nlcs:Akunstwerk">
         <let name="geometry"
              value="tokenize(normalize-space(nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList))"/>
         <let name="geometry_doubles"
              value="for $v in $geometry return xs:double($v)"/>
         <let name="coords_amount" value="count($geometry) idiv 3"/>
         <let name="coords" value="for $v in $geometry return xs:double($v)"/>
         <let name="distances"
              value="                     for $i in 1 to $coords_amount - 1                     return keronic:point-3d-to-point-3d-distance(                               $coords[(3 * $i) - 2], $coords[(3 * $i) - 1], $coords[(3 * $i)],                               $coords[(3 * ($i + 1)) - 2], $coords[(3 * ($i + 1)) - 1], $coords[(3 * ($i + 1))]                          )                "/>
         <let name="rule_number" value="4"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="assert-area-meets-length-demand"
                 test="not(some $d in $distances satisfies $d le 10 or $d ge 50)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation('line-segment-measurement-incorrect')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-lines-meet-demands">
      <rule context="//nlcs:MSkabel | //nlcs:EAarddraad | //nlcs:AaanlegTechniek">
         <let name="geometry"
              value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList))"/>
         <let name="geometry_doubles"
              value="for $v in $geometry return xs:double($v)"/>
         <let name="coords_amount" value="count($geometry) idiv 3"/>
         <let name="coords" value="for $v in $geometry return xs:double($v)"/>
         <let name="distances"
              value="                     for $i in 1 to $coords_amount - 1                     return keronic:point-3d-to-point-3d-distance(                               $coords[(3 * $i) - 2], $coords[(3 * $i) - 1], $coords[(3 * $i)],                               $coords[(3 * ($i + 1)) - 2], $coords[(3 * ($i + 1)) - 1], $coords[(3 * ($i + 1))]                          )                "/>
         <let name="rule_number" value="4"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="assert-line-meets-length-demand"
                 test="not(some $d in $distances satisfies $d le 100 or $d ge 500)"
                 properties="rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation('line-segment-measurement-incorrect')"/>
         </assert>
         <assert id="assert-line-meets-angle-demand"
                 test="not(keronic:line-3d-contains-larger-angle-than($geometry, '45'))"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation('line-angle-larger-than-45')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-gisid-assetid-check">
      <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:Amantelbuis">
         <let name="statuses-requiring-ids"
              value="keronic:get-statuses-where-gisid-required()"/>
         <let name="status-requires-ids"
              value="some $status in ($statuses-requiring-ids) satisfies($status = nlcs:Status)"/>
         <let name="object-has-gis-id"
              value="keronic:element-exists-and-not-empty(nlcs:GisId)"/>
         <let name="object-has-asset-id"
              value="keronic:element-exists-and-not-empty(nlcs:AssetId)"/>
         <let name="rule_number" value="5"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="gisid-assetid-not-unset-if-revision-existing"
                 test="not($status-requires-ids) or ($object-has-gis-id and $object-has-asset-id)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisid-assetid-not-unset-if-new-revision-existing', [string-join($statuses-requiring-ids, ', ')])"/>
         </assert>
         <assert id="gisid-assetid-are-unset-if-new"
                 test="$status-requires-ids or not($object-has-gis-id or $object-has-asset-id)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('gisid-assetid-are-unset-if-new', [string-join($statuses-requiring-ids, ', ')])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-elec-assets-have-measurement-details">
      <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt | //nlcs:Amantelbuis">
         <let name="rule_number" value="6"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="elec-object-has-inmeetwijze"
                 test="keronic:element-exists-and-not-empty(nlcs:Inmeetwijze)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Inmeetwijze'])"/>
         </assert>
         <assert id="elec-object-has-nauwkeurigheid"
                 test="keronic:element-exists-and-not-empty(nlcs:Nauwkeurigheid)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Nauwkeurigheid'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-cables-have-subnettype">
      <rule context="//nlcs:MSkabel | //nlcs:LSkabel | nlcs:LSmof">
         <let name="rule_number" value="7"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="subnettype-present"
                 test="keronic:element-exists-and-not-empty(nlcs:Subnettype)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Subnettype'])"/>
         </assert>
      </rule>
   </pattern>
</schema>
