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
      <property id="scope">Nieuwe en aangepaste objecten Deelrevisie</property>
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
   <phase id="R.8">
      <active pattern="v11-kabels-have-required-values"/>
      <active pattern="v11-lskabels-have-required-values"/>
   </phase>
   <phase id="R.9">
      <active pattern="v11-objects-have-valid-date"/>
   </phase>
   <phase id="R.10">
      <active pattern="v11-moffen-have-required-values"/>
      <active pattern="v11-hs-msmoffen-have-required-values"/>
   </phase>
   <phase id="R.11">
      <active pattern="v11-lsoverdrachtspunt-has-required-values"/>
   </phase>
   <phase id="R.12">
      <active pattern="v11-ovloverdrachtspunt-has-required-values"/>
   </phase>
   <phase id="R.13">
      <active pattern="v11-msoverdrachtspunt-has-identification"/>
   </phase>
   <phase id="R.14">
      <active pattern="v11-stations-kasten-have-required-values"/>
   </phase>
   <phase id="R.15">
      <active pattern="v11-mantelbuis-has-required-values"/>
   </phase>
   <phase id="R.20">
      <active pattern="v11-points-connected-to-lines"/>
   </phase>
   <phase id="R.21">
      <active pattern="v11-mskabel-connected-to-correct-object"/>
   </phase>
   <phase id="R.22">
      <active pattern="v11-connected-kabels-share-netvlak"/>
   </phase>
   <phase id="R.23">
      <active pattern="v11-connected-kabels-share-properties"/>
   </phase>
   <phase id="R.24">
      <active pattern="v11-fase-and-uitvoering-same"/>
   </phase>
   <phase id="R.25">
      <active pattern="v11-connected-kabels-have-correct-phase"/>
   </phase>
   <phase id="R.26">
      <active pattern="v11-amount-of-cables-correct-for-mof-functie"/>
   </phase>
   <phase id="R.27">
      <active pattern="v11-mantelbuis-inhoud-fits-in-mantelbuis"/>
   </phase>
   <phase id="R.28">
      <active pattern="v11-mantelbuis-inhoud-correct"/>
   </phase>
   <phase id="R.29">
      <active pattern="v11-verplaatsen-correctly-applied"/>
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
   <pattern id="v11-objects-have-valid-date">
      <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt">
         <let name="rule_number" value="9"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="datum-aanleg-present"
              value="keronic:element-exists-and-not-empty(nlcs:DatumAanleg)"/>
         <assert id="date-exists"
                 properties="scope rule-number object-type object-id"
                 test="$datum-aanleg-present"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['DatumAanleg'])"/>
         </assert>
         <assert id="date-not-in-future"
                 properties="scope rule-number object-type object-id"
                 test="not($datum-aanleg-present) or (xs:date(nlcs:DatumAanleg) le current-date())"
                 severity="Fout">
            <value-of select="keronic:get-translation('date-in-the-future')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-kabels-have-required-values">
      <rule context="//nlcs:LSkabel | //nlcs:MSkabel | //nlcs:HSkabel">
         <let name="uitvoering" value="nlcs:Uitvoering"/>
         <let name="rule_number" value="8"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="kabel-has-uitvoering"
                 test="keronic:element-exists-and-not-empty($uitvoering)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Uitvoering'])"/>
         </assert>
         <assert id="kabel-uitvoering-keuze-ontbreekt-uit-lijst-has-omschrijving-uitvoering"
                 test="not($uitvoering = 'KEUZE ONTBREEKT IN LIJST') or keronic:element-exists-and-not-empty(nlcs:OmschrijvingUitvoering)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['OmschrijvingUitvoering'])"/>
         </assert>
         <assert id="kabel-has-kabelopbouw"
                 test="keronic:element-exists-and-not-empty(nlcs:Kabelopbouw)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Kabelopbouw'])"/>
         </assert>
         <assert id="kabel-has-fabrikant"
                 test="keronic:element-exists-and-not-empty(nlcs:Fabrikant)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Fabrikant'])"/>
         </assert>
         <assert id="kabel-has-verbindingnummer"
                 test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingnummer'])"/>
         </assert>
         <assert id="kabel-has-spanningsniveau"
                 test="keronic:element-exists-and-not-empty(nlcs:Spanningsniveau)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Spanningsniveau'])"/>
         </assert>
         <assert id="kabel-has-aardingsysteem"
                 test="keronic:element-exists-and-not-empty(nlcs:Aardingsysteem)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aardingsysteem'])"/>
         </assert>
         <assert id="kabel-has-fase-aanduiding"
                 test="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['FaseAanduiding'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-lskabels-have-required-values">
      <rule context="//nlcs:LSkabel">
         <let name="rule_number" value="8"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="lskabel-has-bovengronds"
                 test="keronic:element-exists-and-not-empty(nlcs:Bovengronds)"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Bovengronds'])"/>
         </assert>
         <assert id="lskabel-has-functie"
                 test="keronic:element-exists-and-not-empty(nlcs:Functie)"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-moffen-have-required-values">
      <rule context="//nlcs:MSmof | //nlcs:HSmof">
         <let name="rule_number" value="10"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="functie_present"
                 test="keronic:element-exists-and-not-empty(nlcs:Functie)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
         </assert>
         <assert id="verbindingnummer_present"
                 test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingnummer'])"/>
         </assert>
      </rule>
      <rule context="//nlcs:LSmof">
         <let name="rule_number" value="10"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="functie_present"
                 test="keronic:element-exists-and-not-empty(nlcs:Functie)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
         </assert>
         <assert id="verbindingnummer_present"
                 test="keronic:element-exists-and-not-empty(nlcs:Verbindingnummer)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Verbindingnummer'])"/>
         </assert>
         <assert id="bovengronds_present"
                 test="keronic:element-exists-and-not-empty(nlcs:Bovengronds)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Bovengronds'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-hs-msmoffen-have-required-values">
      <rule context="//nlcs:MSmof | //nlcs:HSmof">
         <let name="rule_number" value="10"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="naam_monteur_present"
                 test="keronic:element-exists-and-not-empty(nlcs:NaamMonteur)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['NaamMonteur'])"/>
         </assert>
         <assert id="cross_bounding_present"
                 test="keronic:element-exists-and-not-empty(nlcs:CrossBondingAanwezig)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['CrossBondingAanwezig'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-lsoverdrachtspunt-has-required-values">
      <rule context="//nlcs:LSoverdrachtspunt">
         <let name="rule_number" value="11"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="functie-present"
                 test="keronic:element-exists-and-not-empty(nlcs:Functie)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
         </assert>
         <assert id="eigen-richting-present"
                 test="keronic:element-exists-and-not-empty(nlcs:EigenRichting)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['EigenRichting'])"/>
         </assert>
         <assert id="fase-aanduiding-present"
                 test="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['FaseAanduiding'])"/>
         </assert>
         <assert id="aardingsysteem-present"
                 test="keronic:element-exists-and-not-empty(nlcs:Aardingsysteem)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aardingsysteem'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-ovloverdrachtspunt-has-required-values">
      <rule context="//nlcs:OVLoverdrachtspunt">
         <let name="rule_number" value="12"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="aansluitset-present"
                 test="keronic:element-exists-and-not-empty(nlcs:Aansluitset)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aansluitset'])"/>
         </assert>
         <assert id="mastnummer-present"
                 test="keronic:element-exists-and-not-empty(nlcs:Mastnummer)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Mastnummer'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-msoverdrachtspunt-has-identification">
      <rule context="//nlcs:MSoverdrachtspunt">
         <let name="rule_number" value="13"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="v11-msoverdrachtspunt-has-identification"
                 test="keronic:element-exists-and-not-empty(nlcs:Identificatie)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Identificatie'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-stations-kasten-have-required-values">
      <rule context="//nlcs:LSkast | //nlcs:MSstation | //nlcs:HSstation">
         <let name="rule_number" value="14"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="object-has-functie"
                 test="keronic:element-exists-and-not-empty(nlcs:Functie)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie'])"/>
         </assert>
         <assert id="object-has-number"
                 test="keronic:element-exists-and-not-empty(nlcs:Nummer)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Nummer'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-mantelbuis-has-required-values">
      <rule context="//nlcs:Amantelbuis">
         <let name="rule_number" value="15"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="mantelbuis-has-thema"
                 test="keronic:element-exists-and-not-empty(nlcs:Thema)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Thema'])"/>
         </assert>
         <assert id="mantelbuis-has-materiaal"
                 test="keronic:element-exists-and-not-empty(nlcs:Materiaal)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Materiaal'])"/>
         </assert>
         <assert id="mantelbuis-has-diameter"
                 test="keronic:element-exists-and-not-empty(nlcs:Diameter)"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Diameter'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-points-connected-to-lines">
      <rule context="//nlcs:MSmof | //nlcs:MSoverdrachtspunt">
         <let name="mskabel_pos_lists"
              value="//nlcs:MSkabel/nlcs:Geometry/gml:LineString/gml:posList"/>
         <let name="point"
              value="tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos))"/>
         <let name="point_connected"
              value="some $pos_list in $mskabel_pos_lists satisfies keronic:point-3d-touches-line-3d($point, tokenize(normalize-space($pos_list)), 0)"/>
         <let name="rule_number" value="20"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="geometry_3d" value="$point"/>
         <assert id="point-connected-to-kabel"
                 test="$point_connected"
                 properties="scope rule-number object-type object-id geometry-3d"
                 severity="Fout">
            <value-of select="keronic:get-translation('point-not-connected-to-any-line')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-mskabel-connected-to-correct-object">
      <rule context="//nlcs:MSkabel[nlcs:Bedrijfstoestand ne 'VERLATEN']">
         <let name="geometry"
              value="tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList))"/>
         <let name="rule_number" value="21"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="geometry_3d" value="$geometry"/>
         <let name="moffen-geometries"
              value="//nlcs:MSmof/nlcs:Geometry/gml:Point/gml:pos"/>
         <let name="overdrachtspunt-geometries"
              value="//nlcs:MSoverdrachtspunt/nlcs:Geometry/gml:Point/gml:pos"/>
         <let name="station-geometries"
              value="//nlcs:MSstation/nlcs:Geometry/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList"/>
         <let name="first-point"
              value="$geometry[1], $geometry[2], $geometry[3]"
              as="xs:string*"/>
         <let name="last-point"
              value="$geometry[count($geometry) - 2], $geometry[count($geometry) - 1], $geometry[count($geometry)]"
              as="xs:string*"/>
         <let name="first-connected-to-moffen"
              value="keronic:point-3d-connected-to-one-of-several-point-3d($first-point, $moffen-geometries)"/>
         <let name="last-connected-to-moffen"
              value="keronic:point-3d-connected-to-one-of-several-point-3d($last-point, $moffen-geometries)"/>
         <let name="first-connected-to-overdrachtspunt"
              value="keronic:point-3d-connected-to-one-of-several-point-3d($first-point, $overdrachtspunt-geometries)"/>
         <let name="last-connected-to-overdrachtspunt"
              value="keronic:point-3d-connected-to-one-of-several-point-3d($last-point, $overdrachtspunt-geometries)"/>
         <let name="first-connected-to-station"
              value="keronic:point-3d-connected-to-one-of-several-area-3d($first-point, $station-geometries)"/>
         <let name="last-connected-to-station"
              value="keronic:point-3d-connected-to-one-of-several-area-3d($last-point, $station-geometries)"/>
         <let name="first-connected"
              value="$first-connected-to-moffen or $first-connected-to-overdrachtspunt or $first-connected-to-station"/>
         <let name="last-connected"
              value="$last-connected-to-moffen or $last-connected-to-overdrachtspunt or $last-connected-to-station"/>
         <assert test="$first-connected and $last-connected"
                 properties="scope rule-number object-type object-id geometry-3d"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-not-connected-to-valid-object', [nlcs:Handle])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-connected-kabels-share-netvlak">
      <rule context="//nlcs:MSkabel">
         <let name="mskabel" value="."/>
         <let name="connected_msmoffen"
              value="//nlcs:MSmof[                 keronic:point-3d-touches-line-3d(                     tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos)),                     tokenize(normalize-space($mskabel/nlcs:Geometry/gml:LineString/gml:posList)),                     0)]"/>
         <let name="connected_lskabels"
              value="//nlcs:LSkabel[                 some $connected_mof in $connected_msmoffen satisfies                     keronic:line-3d-touches-point-3d(                         tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),                         tokenize(normalize-space($connected_mof/nlcs:Geometry/gml:Point/gml:pos)),                         0)]"/>
         <let name="connected_hskabels"
              value="//nlcs:HSkabel[                 some $connected_mof in $connected_msmoffen satisfies                     keronic:line-3d-touches-point-3d(                         tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),                         tokenize(normalize-space($connected_mof/nlcs:Geometry/gml:Point/gml:pos)),                         0)]"/>
         <let name="rule_number" value="22"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <assert id="mskabel-connected-to-lskabel"
                 test="empty($connected_lskabels)"
                 properties="scope rule-number object-type object-id"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-cable-does-not-match-netvlak',                 [$object_type, string(count($connected_lskabels)),'LSkabel'])"/>
         </assert>
         <assert id="mskabel-connected-to-hskabel"
                 test="empty($connected_hskabels)"
                 properties="scope rule-number object-type object-id"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-cable-does-not-match-netvlak',                 [$object_type, string(count($connected_hskabels)), 'HSkabel'])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-connected-kabels-share-properties">
      <rule context="//nlcs:MSkabel">
         <let name="mskabel" value="."/>
         <let name="connected_msmoffen"
              value="//nlcs:MSmof[                 keronic:point-3d-touches-line-3d(                     tokenize(normalize-space(nlcs:Geometry/gml:Point/gml:pos)),                     tokenize(normalize-space($mskabel/nlcs:Geometry/gml:LineString/gml:posList)),                     0)]"/>
         <let name="connected_mskabels"
              value="//nlcs:MSkabel[                 some $connected_mof in $connected_msmoffen satisfies                     . ne $mskabel and                     keronic:line-3d-touches-point-3d(                         tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),                         tokenize(normalize-space($connected_mof/nlcs:Geometry/gml:Point/gml:pos)),                         0)]"/>
         <let name="rule_number" value="23"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <!-- Compare bedrijfstoestanden against original-->
         <let name="expected_bedrijfstoestand" value="nlcs:Bedrijfstoestand"/>
         <let name="unexpected_bedrijfstoestanden"
              value="distinct-values($connected_mskabels/nlcs:Bedrijfstoestand)[. != $expected_bedrijfstoestand]"/>
         <assert id="connected-mskabel-does-not-match-bedrijfstoestand"
                 test="empty($unexpected_bedrijfstoestanden)"
                 properties="scope rule-number object-type object-id"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-cable-does-not-match-property',                 ['Bedrijfstoestand', $expected_bedrijfstoestand, string-join($unexpected_bedrijfstoestanden, ', ')])"/>
         </assert>
         <!-- Compare subnettypes against original-->
         <let name="expected_subnettype" value="nlcs:Subnettype"/>
         <let name="unexpected_subnettypes"
              value="distinct-values($connected_mskabels/nlcs:Subnettype)[. != $expected_subnettype]"/>
         <assert id="connected-mskabel-does-not-match-subnettype"
                 test="empty($unexpected_subnettypes)"
                 properties="scope rule-number object-type object-id"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-cable-does-not-match-property',                 ['Subnettype', $expected_subnettype, string-join($unexpected_subnettypes, ', ')])"/>
         </assert>
         <!-- Compare verbindingnummers against original-->
         <let name="expected_verbindingnummer" value="nlcs:Verbindingnummer"/>
         <let name="unexpected_verbindingnummers"
              value="distinct-values($connected_mskabels/nlcs:Verbindingnummer)[. != $expected_verbindingnummer]"/>
         <assert id="connected-mskabel-does-not-match-verbindingnummer"
                 test="empty($unexpected_verbindingnummers)"
                 properties="scope rule-number object-type object-id"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-cable-does-not-match-property',                 ['Verbindingnummer', $expected_verbindingnummer, string-join($unexpected_verbindingnummers, ', ')])"/>
         </assert>
         <!-- Compare spanningsniveaus against original-->
         <let name="expected_spanningsniveau" value="nlcs:Spanningsniveau"/>
         <let name="unexpected_spanningsniveaus"
              value="distinct-values($connected_mskabels/nlcs:Spanningsniveau)[. != $expected_spanningsniveau]"/>
         <assert id="connected-mskabel-does-not-match-spanningsniveau"
                 test="empty($unexpected_spanningsniveaus)"
                 properties="scope rule-number object-type object-id"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-cable-does-not-match-property',                 ['Spanningsniveau', $expected_spanningsniveau, string-join($unexpected_spanningsniveaus, ', ')])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-fase-and-uitvoering-same">
      <rule context="//nlcs:MSkabel">
         <let name="rule_number" value="21"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="fase" value="nlcs:FaseAanduiding"/>
         <let name="uitvoering" value="nlcs:Uitvoering"/>
         <let name="expected_uitvoering_prefix"
              value="if ($fase = '3 Fasen') then '3x'                 else if ($fase = 'L1' or $fase = 'L2' or $fase = 'L3') then '1x'                 else ''"/>
         <assert id="fase-and-uitvoering-same"
                 properties="scope rule-number object-type object-id"
                 test="starts-with($uitvoering, $expected_uitvoering_prefix)"
                 severity="Informerend">
            <value-of select="keronic:get-translation('fase-not-the-same-as-uitvoering')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-connected-kabels-have-correct-phase">
      <rule context="//nlcs:MSmof">
         <let name="rule_number" value="25"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="msmof" value="."/>
         <let name="connected_mskabels"
              value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(                         tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),                         tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),                         0)]"/>
         <let name="unique_connected_phases"
              value="distinct-values($connected_mskabels/nlcs:FaseAanduiding)"/>
         <let name="allowed_phases" value="('3 Fasen', 'L1', 'L2', 'L3')"/>
         <let name="unique_allowed_connected_phases"
              value="$unique_connected_phases[. = $allowed_phases]"/>
         <let name="unique_unallowed_connected_phases"
              value="$unique_connected_phases[not(. = $allowed_phases)]"/>
         <let name="connections" value="count($connected_mskabels)"/>
         <let name="all_connected_cables_match_fases"
              value="count($unique_allowed_connected_phases) = 1"/>
         <let name="all_connected_cables_have_combined_and_split_fases"
              value="count($unique_allowed_connected_phases) = 4"/>
         <assert id="msmof-2-3-4-connected-only-allowed-phases"
                 properties="scope rule-number object-type object-id"
                 test="if($connections = 2 or $connections = 3 or $connections = 4) then empty($unique_unallowed_connected_phases) else true()"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-fases-not-allowed',                 [string($connections), string-join($unique_unallowed_connected_phases, ', ')])"/>
         </assert>
         <assert id="msmof-2-3-connected-cables-have-same-fase"
                 properties="scope rule-number object-type object-id"
                 test="if($connections = 2 or $connections = 3) then $all_connected_cables_match_fases else true()"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-fases-do-not-match',                 [string($connections), string-join($unique_allowed_connected_phases, ', ')])"/>
         </assert>
         <assert id="msmof-4-connected-cables-have-combined-and-split-fasen"
                 properties="scope rule-number object-type object-id"
                 test="if($connections = 4) then $all_connected_cables_have_combined_and_split_fases else true()"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'connected-fases-do-not-split',                 [string-join($allowed_phases, ', '), string-join($unique_allowed_connected_phases, ', ')])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-mantelbuis-inhoud-fits-in-mantelbuis">
      <rule context="//nlcs:Amantelbuis">
         <let name="rule_number" value="27"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="assetId" value="nlcs:AssetId"/>
         <let name="inhoud"
              value="//nlcs:AmantelbuisInhoud[nlcs:MantelbuisAssetId = $assetId]"/>
         <let name="inhoud_diameter" value="$inhoud/nlcs:Diameter"/>
         <assert id="mantelbuis_inhoud_fits_in_mantelbuis"
                 test="nlcs:Diameter &gt; $inhoud_diameter"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation-and-replace-placeholders(                 'mantelbuis-inhoud-diameter-larger-than-own',                 [nlcs:Diameter, $inhoud_diameter])"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-mantelbuis-inhoud-correct">
      <rule context="//nlcs:Amantelbuis">
         <let name="rule_number" value="28"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="bedrijfsToestand" value="nlcs:BedrijfsToestand"/>
         <let name="assetId" value="nlcs:AssetId"/>
         <let name="inhoud"
              value="//nlcs:AmantelbuisInhoud[nlcs:MantelbuisAssetId = $assetId]"/>
         <assert id="inhoud_exists_when_in_bedrijf"
                 test="if ($bedrijfsToestand = 'IN BEDRIJF') then $inhoud else true()"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation('inhoud-not-found')"/>
         </assert>
         <assert id="inhoud_does_not_exist_when_reserve"
                 test="if ($bedrijfsToestand = 'RESERVE') then not($inhoud) else true()"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation('inhoud-found')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-verplaatsen-correctly-applied">
      <rule context="//nlcs:MSkabel | //nlcs:LSkabel">
         <let name="rule_number" value="29"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="isVerplaatsing"
              value="nlcs:Status = 'REVISIE' and nlcs:Bewerking = 'VERPLAATSEN'"/>
         <let name="hasSomeOriginal"
              value="some $kabel in //nlcs:MSkabel satisfies $kabel ne . and $kabel/nlcs:Status = 'BESTAAND' and $kabel/nlcs:GisId = nlcs:GisId"/>
         <assert id="verplaatsen_correctly_applied"
                 test="if ($isVerplaatsing) then $hasSomeOriginal else true()"
                 properties="scope rule-number object-type object-id"
                 severity="Fout">
            <value-of select="keronic:get-translation('verplaatsen-incorrectly-applied')"/>
         </assert>
      </rule>
   </pattern>
   <pattern id="v11-amount-of-cables-correct-for-mof-functie">
      <rule context="//nlcs:MSmof[nlcs:Functie = ('EINDMOF', 'EINDDOP', 'LOODKOP', 'EIND GEAARD')]">
         <let name="rule_number" value="26"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="msmof" value="."/>
         <let name="connected_mskabels"
              value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(                         tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),                         tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),                         0)]"/>
         <let name="required_amount" value="1"/>
         <assert id="mof_connected_to_right_amount_of_cables"
                 properties="scope rule-number object-type object-id"
                 test="count($connected_mskabels) = $required_amount"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string($required_amount), string(count($connected_mskabels))])"/>
         </assert>
      </rule>
      <rule context="//nlcs:MSmof[nlcs:Functie = ('VERBINDING', 'ZEGELWIJZIGING', 'MANTELREPARATIE')]">
         <let name="rule_number" value="26"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="msmof" value="."/>
         <let name="connected_mskabels"
              value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(                         tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),                         tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),                         0)]"/>
         <let name="unique_connected_phases"
              value="distinct-values($connected_mskabels/nlcs:FaseAanduiding)"/>
         <let name="required_amount"
              value="if (count($unique_connected_phases) = 1) then 2 else 4"/>
         <assert id="mof_connected_to_right_amount_of_cables"
                 properties="scope rule-number object-type object-id"
                 test="count($connected_mskabels) = $required_amount"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string($required_amount), string(count($connected_mskabels))])"/>
         </assert>
      </rule>
      <rule context="//nlcs:MSmof[nlcs:Functie = ('AFTAK')]">
         <let name="rule_number" value="26"/>
         <let name="object_type" value="name(.)"/>
         <let name="object_id" value="nlcs:Handle"/>
         <let name="msmof" value="."/>
         <let name="connected_mskabels"
              value="//nlcs:MSkabel[keronic:line-3d-connected-to-point-3d(                         tokenize(normalize-space(nlcs:Geometry/gml:LineString/gml:posList)),                         tokenize(normalize-space($msmof/nlcs:Geometry/gml:Point/gml:pos)),                         0)]"/>
         <let name="cable_statuses" value="$connected_mskabels/nlcs:Status"/>
         <let name="required_amount"
              value="if (count($cable_statuses[. = 'BESTAAND']) = 0) then 3 else 2"/>
         <assert id="mof_connected_to_right_amount_of_cables"
                 properties="scope rule-number object-type object-id"
                 test="count($connected_mskabels) = $required_amount"
                 severity="Informerend">
            <value-of select="keronic:get-translation-and-replace-placeholders('cable-amount-incorrect', [string($required_amount), string(count($connected_mskabels))])"/>
         </assert>
         <assert id="bestaande_cable_also_connected_to_one_new_cable"
                 properties="scope rule-number object-type object-id"
                 test="not($required_amount = 2) or count($cable_statuses[. = 'NIEUW'] != 0)"
                 severity="Informerend">
            <value-of select="keronic:get-translation('bestaande-cable-not-connected-to-new-cable')"/>
         </assert>
      </rule>
   </pattern>
</schema>
