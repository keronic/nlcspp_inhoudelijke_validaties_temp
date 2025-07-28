<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-ovloverdrachtspunt-have-required-values">
    <rule context="//nlcs:OVLoverdrachtspunt">
        
        <assert test="keronic:element-exists-and-not-empty(nlcs:Aansluitset)">
            Het object <value-of select="nlcs:Handle"/> moet een waarde voor Aansluitset hebben!
        </assert>
        
        <assert test="keronic:element-exists-and-not-empty(nlcs:Mastnummer)">
            Het object <value-of select="nlcs:Handle"/> moet een waarde voor Mastnummer hebben!
        </assert>
    </rule>
</pattern>
