<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns ="http://purl.oclc.org/dsdl/schematron"
        xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:gml="http://www.opengis.net/gml/3.2"
        queryBinding="xslt3">
    
    <include href="patterns/bestand/v11/aprojectreferentie_has_other_objects.sch"/>
    <include href="patterns/bestand/v11/statuses_allowed_for_tekening_type.sch"/>
    <include href="patterns/geometrie/all_geometries_in_project_area.sch"/>
    <include href="patterns/geometrie/areas_meet_demands.sch"/>
    <include href="patterns/geometrie/lines_meet_demands.sch"/>
    <include href="patterns/verplichte_waardes/gisid_assetid_check.sch"/>
    <include href="patterns/verplichte_waardes/elec_assets_have_measurement_details.sch"/>
    <include href="patterns/verplichte_waardes/cables_have_subnettype.sch"/>
        <include href="patterns/verplichte_waardes/msoverdrachtspunt_has_identification.sch"/>
</schema>