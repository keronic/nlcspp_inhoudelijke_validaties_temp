<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-mantelbuis-has-required-values">     
<rule context="//nlcs:Amantelbuis">   
    <assert id="mantelbuis-has-thema"
        test="keronic:element-exists-and-not-empty(nlcs:Thema)">
        Object <value-of select="nlcs:Handle"/> moet een waarde voor Thema hebben.
    </assert>
    
    <assert id="mantelbuis-has-materiaal"
        test="keronic:element-exists-and-not-empty(nlcs:Materiaal)">
        Object <value-of select="nlcs:Handle"/> moet een waarde voor Materiaal hebben.
    </assert>
    
    <assert id="mantelbuis-has-diameter"
        test="keronic:element-exists-and-not-empty(nlcs:Diameter)">
        Object <value-of select="nlcs:Handle"/> moet een waarde voor Diameter hebben.
    </assert>
</rule>
</pattern>