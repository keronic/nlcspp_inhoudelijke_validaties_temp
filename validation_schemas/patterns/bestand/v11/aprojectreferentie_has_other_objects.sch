<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-aprojectreferentie-has-other-objects">
    <rule context="//nlcs:NLCSnetbeheerType">
        <let name="nlcs_objecten"
            value="*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]"/>
        
        <let name="aprojectreferenties"
            value="nlcs:AprojectReferentie"/>
        
        <let name="message"
            value="keronic:get-translation('aprojectreferentie-not-present-or-only-object')"/>
        
        <let name="placeholders"
            value="let $map := map{
                        'amount-of-objects': count($nlcs_objecten)
                    }
            return $map
            "/>
            
            <assert id="assert-objects-in-file" 
                test="count($nlcs_objecten) > 0 and count($aprojectreferenties) = 1">
                <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
            </assert>
        </rule>
    </pattern>
    
