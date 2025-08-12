<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-connected-kabels-share-properties">
    <rule context="//nlcs:MSkabel">

        <let name="connected_moffen"
            value=""/>

        <!-- (Recursively) get all connected kabels -->
        <!-- From kabel A, find all connected moffen B, then find all connected kabels (excluding A), then find all connected moffen (excluding B), etc... -->

        <!-- 4 separate asserts to verify if any connected kabel's property does not match own -->

        <let name="rule_number" value="23"/>
        <let name="object_type" value="name(.)"/>
        <let name="object_id" value="nlcs:Handle"/>

        <assert id="point-connected-to-kabel"
            test="false()"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation('point-not-connected-to-any-line')"/>
        </assert>
    </rule>
</pattern>