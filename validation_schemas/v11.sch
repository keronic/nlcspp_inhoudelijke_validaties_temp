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
    
    <phase id="R.10">
        <active pattern="v11-moffen-have-required-values"/>
        <active pattern="v11-hs-msmoffen-have-required-values"/>
    </phase>
    
    <phase id="R.11">
        <active pattern="v11-lsoverdrachtspunt-has-required-values"/>
    </phase>
    
    <phase id="R.12">
        <active pattern="v11-ovloverdrachtspunt-have-required-values"/>
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
    <include href="patterns/topologie/points_connected_to_lines.sch"/>
    <include href="patterns/verplichte_waardes/kabels_have_required_values.sch"/>
    <include href="patterns/verplichte_waardes/lskabels_have_required_values.sch"/>
    <include href="patterns/verplichte_waardes/moffen_have_required_values.sch"/>
    <include href="patterns/geometrie/hs-msmoffen-have-required-values.sch"/>
    <include href="patterns/verplichte_waardes/lsoverdrachtpunt-has-required-values.sch"/>
    <include href="patterns/verplichte_waardes/ovloverdrachtspunt_have_required_values.sch"/>
    <include href="patterns/verplichte_waardes/msoverdrachtspunt_has_identification.sch"/>
    <include href="patterns/verplichte_waardes/stations_kasten_have_required_values.sch"/>
    <include href="patterns/verplichte_waardes/mantelbuis_has_required_values.sch"/>
</schema>