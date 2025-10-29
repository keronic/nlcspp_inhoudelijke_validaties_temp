<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="mantelbuis-past-in-mantelbuis" abstract="true">
    <rule context="//nlcs:Amantelbuis">
        <let name="id"
             value="nlcs:ID"/>

        <let name="parent_mantelbuis_inhoud"
            value="//nlcs:AmantelbuisInhoud[nlcs:InhoudID = $id]"/>

        <let name="parent_mantelbuis"
            value="//nlcs:Amantelbuis[nlcs:ID = $parent_mantelbuis_inhoud/nlcs:MantelbuisID]"/>

        <let name="diameters_are_missing_in_list"
            value="nlcs:Diameter = 'KEUZE ONTBREEKT IN LIJST' or $parent_mantelbuis/nlcs:Diameter = 'KEUZE ONTBREEKT IN LIJST'"/>

        <let name="fits_in_parent"
            value="nlcs:Diameter lt $parent_mantelbuis/nlcs:Diameter"/>

        <assert test="if($parent_mantelbuis and not($diameters_are_missing_in_list)) then $fits_in_parent else true()">
            Parent mantelbuis inhoud: <value-of select="$parent_mantelbuis_inhoud/nlcs:ID"/>
            Parent mantelbuis: <value-of select="$parent_mantelbuis/nlcs:ID"/>

            Diameter: <value-of select="nlcs:Diameter"/>
            Parent diameter: <value-of select="$parent_mantelbuis/nlcs:Diameter"/>
        </assert>
    </rule>
</pattern>
