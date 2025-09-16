<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:keronic="http://example.com/my-functions"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            version="3.0">

  <variable name="sys_config_file" select= "document('../../../configuration/sys_config.xml')"/>
  <variable name="user_config_file" select= "document('../../../configuration/user_config.xml')"/>

  <function name="keronic:get-connected-threshold">
    <value-of select="$sys_config_file/config/V10/Topology/ConnectedThreshold"/>
  </function>

  <function name="keronic:map-mof-functie" as="xs:string">
    <param name="functie" as="xs:string"/>
    <sequence select="name(($sys_config_file/config/V11/MofFuncties/*[Functie = $functie]))"/>
  </function>
</stylesheet>
