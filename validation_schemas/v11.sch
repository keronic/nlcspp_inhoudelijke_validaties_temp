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
    <ns prefix="nlcs" uri="NLCSnetbeheer"/>

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
        <active pattern="v11-cables-meet-demands"/>
    </phase>

    <!-- dummy rules -->
    <phase id="R.9">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.10">
        <active pattern="v11-dummy-pattern"/>
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.11">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.12">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.13">
        <active pattern="v11-dummy-pattern"/>
        <active pattern="v11-dummy-pattern"/>
        <active pattern="v11-dummy-pattern"/>
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.14">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.15">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.16">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.17">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.18">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.19">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.20">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.21">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.22">
        <active pattern="v11-dummy-pattern"/>
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.23">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.24">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.25">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.26">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.27">
        <active pattern="v11-dummy-pattern"/>
    </phase>
    <phase id="R.28">
        <active pattern="v11-dummy-pattern"/>
    </phase>

    <!-- function delcarations -->
    <xsl:include href="xsl_functions/global_functions/config_functions.xsl"/>
    <xsl:include href="xsl_functions/helper_functions/helper_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/2d_geometry_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_geometry_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/2d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/3d_2d_geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/geometry_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/line_interface_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/line_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/depth_functions.xsl"/>
    <xsl:include href="xsl_functions/geometry_functions/depth_interface_functions.xsl"/>

    <include href="patterns/bestand/v11/aprojectreferentie_has_other_objects.sch"/>
    <include href="patterns/bestand/v11/statuses_allowed_for_tekening_type.sch"/>
    <include href="patterns/geometrie/all_geometries_in_project_area.sch"/>
    <include href="patterns/geometrie/areas_meet_demands.sch"/>
    <include href="patterns/geometrie/lines_meet_demands.sch"/>
    <include href="patterns/verplichte_waardes/gisid_assetid_check.sch"/>
    <include href="patterns/verplichte_waardes/elec_assets_have_measurement_details.sch"/>
    <include href="patterns/verplichte_waardes/cables_have_subnettype.sch"/>
    <include href="patterns/verplichte_waardes/cables_meet_demands.sch"/>
</schema>