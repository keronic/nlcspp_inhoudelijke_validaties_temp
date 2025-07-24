<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-cables-have-subnettype">
    <rule context="//nlcs:MSkabel">
        <let name="subnettype"
            value="nlcs:Subnettype"/>
        
        <let name="placeholders"
            value="let $map := map{
                        'handle': nlcs:Handle 
                    }
                return $map
            "/>
        
        <let name="message"
            value="keronic:get-translation('cable-has-no-subtype')"/>
        
        <assert test="keronic:element-exists-and-not-empty($subnettype)">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>
