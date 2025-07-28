<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns ="http://purl.oclc.org/dsdl/schematron"
        xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:gml="http://www.opengis.net/gml/3.2"
        queryBinding="xslt3">
    
    
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
</schema>