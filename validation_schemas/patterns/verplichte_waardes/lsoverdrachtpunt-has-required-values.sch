<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-lsoverdrachtspunt-has-required-values">
    <rule context="//nlcs:LSoverdrachtspunt">
    <let name="handle"
        value="nlcs:Handle"/>
        <assert id="functie_present"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
                    <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Functie', $handle])"/>
        </assert>

        <assert id="eigen_richting_present"
            test="keronic:element-exists-and-not-empty(nlcs:EigenRichting)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['EigenRichting', $handle])"/>
        </assert>
        
        <assert id="fase_aanduiding_present"
            test="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['FaseAanduiding', $handle])"/>
        </assert>
        
        <assert id="aardingsysteem_present"
            test="keronic:element-exists-and-not-empty(nlcs:Aardingsysteem)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['Aardingsysteem', $handle])"/>
        </assert>
    </rule>
</pattern>