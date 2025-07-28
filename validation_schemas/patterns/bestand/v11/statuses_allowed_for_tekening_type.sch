<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns ="http://purl.oclc.org/dsdl/schematron" id="v11-statuses-allowed-for-tekening-type">
    <rule context="//nlcs:NLCSnetbeheerType">
        
        <let name="tekening_type"
            value="nlcs:AprojectReferentie/nlcs:TekeningType"/>
        
        <let name="allowed_statuses"
            value="
                if ($tekening_type = 'BESTAANDE SITUATIE') then 
                    ['BESTAAND']
                else if ($tekening_type = 'DEELREVISIE') then 
                    ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD', 'TIJDELIJK']
                else if ($tekening_type = 'DEFINITIEF ONTWERP') then 
                    ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD', 'TIJDELIJK']
                else if ($tekening_type = 'EINDREVISIE') then 
                    ['BESTAAND', 'NIEUW', 'REVISIE', 'VERWIJDERD']
                else if ($tekening_type = 'VOORONTWERP') then 
                    []
                else 
                    []
            "/>
        
        <let name="nlcs_objecten"
            value="*[not(self::nlcs:VersieNummer or self::nlcs:AprojectReferentie)]"/>
        
        <let name="nlcs_objecten_with_invalid_statuses"
            value="$nlcs_objecten[nlcs:Status[not(. = $allowed_statuses)]]"/>

        <let name="invalid_objects"
            value="string-join(for $nlcs_object in $nlcs_objecten_with_invalid_statuses return concat('Handle: ', $nlcs_object/nlcs:Handle, ', Status: ', $nlcs_object/nlcs:Status), ' | ')"/>

        <let name="message"
            value="keronic:get-translation('invalid-status-for-tekening-type')"/>

        <let name="placeholders"
            value="let $map := map{
                        'invalid-objects': $invalid_objects,
                        'allowed-statuses': string-join($allowed_statuses, ', '),
                        'tekening-type': $tekening_type
                    }
                return $map
            "/>
        
        <assert id="status-in-line-with-type" 
            test="count($nlcs_objecten_with_invalid_statuses) = 0">
            <value-of select="keronic:replace-placeholders($message, $placeholders)"/>
        </assert>
    </rule>
</pattern>

