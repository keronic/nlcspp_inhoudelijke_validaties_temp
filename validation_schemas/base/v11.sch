<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns ="http://purl.oclc.org/dsdl/schematron"
        xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:gml="http://www.opengis.net/gml/3.2"
        queryBinding="xslt3">

    <!-- schematron namespace declarations -->
    <ns prefix="keronic" uri = "http://example.com/my-functions"/>
    <ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="nlcs" uri="NLCSnetbeheer"/>
    <ns prefix="nvr" uri="NLCSValidatieRegelsNameSpace"/>

    <!-- properties for more detailed assert reports -->
    <properties>
        <property id="scope">NO SCOPE SELECTED</property>
        <property id="rule-number"><value-of select="$rule_number"/></property>
        <property id="object-type"><value-of select="$object_type"/></property>
        <property id="object-id"><value-of select="$object_id"/></property>
        <property id="geometry-2d"><value-of select="$geometry_2d"/></property>
        <property id="geometry-3d"><value-of select="$geometry_3d"/></property>
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

    <include href="../patterns/bestand/v11/aprojectreferentie_has_other_objects.sch"/>
    <include href="../patterns/bestand/v11/statuses_allowed_for_tekening_type.sch"/>
    <include href="../patterns/geometrie/all_geometries_in_project_area.sch"/>
    <include href="../patterns/geometrie/areas_meet_demands.sch"/>
    <include href="../patterns/geometrie/lines_meet_demands.sch"/>
    <include href="../patterns/verplichte_waarde/gisid_assetid_check.sch"/>
    <include href="../patterns/verplichte_waarde/elec_assets_have_measurement_details.sch"/>
    <include href="../patterns/verplichte_waarde/cables_have_subnettype.sch"/>
    <include href="../patterns/verplichte_waarde/objects-have-valid-date.sch"/>
    <include href="../patterns/verplichte_waarde/kabels_have_required_values.sch"/>
    <include href="../patterns/verplichte_waarde/lskabels_have_required_values.sch"/>
    <include href="../patterns/verplichte_waarde/moffen_have_required_values.sch"/>
    <include href="../patterns/verplichte_waarde/hs_msmoffen_have_required_values.sch"/>
    <include href="../patterns/verplichte_waarde/lsoverdrachtspunt_has_required_values.sch"/>
    <include href="../patterns/verplichte_waarde/ovloverdrachtspunt_have_required_values.sch"/>
    <include href="../patterns/verplichte_waarde/msoverdrachtspunt_has_identification.sch"/>
    <include href="../patterns/verplichte_waarde/stations_kasten_have_required_values.sch"/>
    <include href="../patterns/verplichte_waarde/mantelbuis_has_required_values.sch"/>
    <include href="../patterns/topologie/points_connected_to_lines.sch"/>
    <include href="../patterns/topologie/cables_connected_to_correct_objects.sch"/>
    <include href="../patterns/netlogica/connected_kabels_share_netvlak.sch"/>
    <include href="../patterns/netlogica/connected_kabels_share_properties.sch"/>
    <include href="../patterns/inhoud_waarde/fase_ms_kabel.sch"/>
    <include href="../patterns/inhoud_waarde/connected_kabels_have_correct_fase.sch"/>
    <include href="../patterns/inhoud_waarde/mantelbuis_inhoud_fits_in_mantelbuis.sch"/>
    <include href="../patterns/consistentie/mantelbus_inhoud_correct.sch"/>
    <include href="../patterns/consistentie/verplaatsen_correctly_applied.sch"/>
    <include href="../patterns/inhoud_waarde/amount_of_cables_correct_for_mof_functie.sch"/>
</schema>
