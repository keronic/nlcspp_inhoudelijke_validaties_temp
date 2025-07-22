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
    
    <include href="setup.sch"/>
    <include href="all-rules.sch"/>
    
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
    
    <phase id="R.10">
        <active pattern="v11-moffen-have-required-values"/>
    <phase id="R.11">
        <active pattern="v11-lsoverdrachtspunt-has-required-values"/>
    </phase>
</schema>