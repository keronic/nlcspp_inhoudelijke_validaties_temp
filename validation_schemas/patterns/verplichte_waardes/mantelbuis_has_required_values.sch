<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-mantelbuis-has-required-values">     
    <rule context="//nlcs:Amantelbuis">
        <let name="placeholders"
            value="let $map := map{
                        'handle': $handle,
                        'attribute': 'Thema',
                    }
                return $map
            "/>
        <assert id="mantelbuis-has-thema"
            test="keronic:element-exists-and-not-empty(nlcs:Thema)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', $placeholders)"/>
        </assert>
        
        <let name="placeholders"
            value="map:put($placeholders, 'attribute', 'Materiaal')"
            "/>
            
            <assert id="mantelbuis-has-materiaal"
                test="keronic:element-exists-and-not-empty(nlcs:Materiaal)">
                <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', $placeholders)"/>
            </assert>
            
                <let name="placeholders"
            value="map:put($placeholders, 'attribute', 'Diameter')"
            "/>

            <assert id="mantelbuis-has-diameter"
                test="keronic:element-exists-and-not-empty(nlcs:Diameter)">
                <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', $placeholders)"/>
            </assert>
        </rule>
    </pattern>