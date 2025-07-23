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

    <phase id="R.13">
        <active pattern="v11-msoverdrachtspunt-has-identification"/>
    </phase>
        <include href="../patterns/verplichte_waardes/msoverdrachtspunt_has_identification.sch"/>
</schema>