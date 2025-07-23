<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-msoverdrachtspunt-has-identification">
    <rule context="//nlcs:MSoverdrachtspunt">
        <assert id="v11-msoverdrachtspunt-has-identification"
            test="keronic:element-exists-and-not-empty(nlcs:Identificatie)">
            Object <value-of select="nlcs:Handle"/> moet een EAN-Code identificatie hebben.
        </assert>
    </rule>
</pattern>