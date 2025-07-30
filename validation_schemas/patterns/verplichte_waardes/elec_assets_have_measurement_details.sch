<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-elec-assets-have-measurement-details">
    <rule context="//nlcs:MSstation | //nlcs:MSkabel | //nlcs:MSmof | //nlcs:MSoverdrachtspunt | //nlcs:Amantelbuis">
        <let name="handle" 
            value="nlcs:Handle"/>

        <assert id="elec-object-has-inmeetwijze"
            test="keronic:element-exists-and-not-empty(nlcs:Inmeetwijze)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Inmeetwijze', $handle])"/>
        </assert>
        
        <assert id="elec-object-has-nauwkeurigheid"
            test="keronic:element-exists-and-not-empty(nlcs:Nauwkeurigheid)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Nauwkeurigheid', $handle])"/>
        </assert>
    </rule>
</pattern>