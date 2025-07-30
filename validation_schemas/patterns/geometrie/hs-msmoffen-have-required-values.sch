<pattern xmlns ="http://purl.oclc.org/dsdl/schematron"
         id="v11-hs-msmoffen-have-required-values">
    <rule context="//nlcs:MSmof | //nlcs:HSmof">
        <let name="handle"
            value="nlcs:Handle"/>
        
        <assert id="naam_monteur_present"
            test="keronic:element-exists-and-not-empty(nlcs:NaamMonteur)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['NaamMonteur', $handle])"/>
        </assert>
        
        <assert id="cross_bounding_present"
            test="keronic:element-exists-and-not-empty(nlcs:CrossBoundingAanwezig)">
            <value-of select="keronic:get-translation-and-replace-placeholders('attribute-not-present', ['CrossboundingAanwezig', $handle])"/>
        </assert>
    </rule>
</pattern>