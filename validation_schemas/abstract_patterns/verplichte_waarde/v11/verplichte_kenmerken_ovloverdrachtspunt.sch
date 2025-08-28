<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="verplichte-kenmerken-ovloverdrachtspunt" abstract="true">
    <rule context="//nlcs:OVLoverdrachtspunt">
        <assert id="aansluitset-present"
            test="keronic:element-exists-and-not-empty(nlcs:Aansluitset)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aansluitset'])"/>
        </assert>

        <assert id="mastnummer-present"
            test="keronic:element-exists-and-not-empty(nlcs:Mastnummer)"
            properties="scope rule-number object-type object-id">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Mastnummer'])"/>
        </assert>
    </rule>
</pattern>
