<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-elec-assets-have-measurement-details">
    <rule context="//nlcs:LSoverdrachtspunt">
        <assert id="functie_present"
            test="keronic:element-exists-and-not-empty(nlcs:Functie)">
            De functie op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
        
        <assert id="eigen_richting_present"
            test="keronic:element-exists-and-not-empty(nlcs:EigenRichting)">
            Het attribuut EigenRichting op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
        
        <assert id="fase_aanduiding_present"
            test="keronic:element-exists-and-not-empty(nlcs:FaseAanduiding)">
            Het attribuut FaseAanduiding op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
        
        <assert id="aardingsysteem_present"
            test="keronic:element-exists-and-not-empty(nlcs:Aardingsysteem)">
            Het attribuut Aardingsysteem op object <value-of select="nlcs:Handle"/> is niet aanwezig!
        </assert>
    </rule>
</pattern>