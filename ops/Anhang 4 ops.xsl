<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:skos="http://www.w3.org/2004/02/skos/core#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:fn="http://www.w3.org/2005/xpath-functions"
        xmlns:icd="http://icd.org/ops2013syst_claml_20121012#" version="1.0">
        
        <xsl:variable name="code_temp" select="10"/>
        <xsl:template match="/">
                <rdf:RDF xml:icd="http://icd.org/ops2013syst_claml_20121012#" >
                        <xsl:for-each select="/ClaML/Modifier">
                                <skos:Concept>
                                       <xsl:attribute name="rdf:about">
                                               <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="@code"/>
                                       </xsl:attribute>
                                        
                                        <skos:definition>Modifier</skos:definition>
                                        
                                        <xsl:variable name="code_temp" select="@code"/>
                                       
                                        <skos:inScheme rdf:resource=""/>
                                       
                                        <xsl:for-each select="SubClass">
                                               <skos:narrower> 
                                                       <xsl:attribute name="rdf:resource">
                                                               <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="$code_temp"/>Class<xsl:value-of select="@code"/>
                                                       </xsl:attribute> 
                                                       <xsl:value-of select="@code"/>
                                               </skos:narrower>
                                        </xsl:for-each>
                                        
                                        <xsl:for-each select="Rubric/Label">
                                                <skos:note>
                                                        <xsl:value-of select="text()"/>
                                                </skos:note>
                                        </xsl:for-each>
                                </skos:Concept>
                        </xsl:for-each>
                        
                        <xsl:for-each select="/ClaML/ModifierClass">
                                <skos:Concept>
                                        <xsl:attribute name="rdf:about">
                                                <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="@modifier"/>Class<xsl:value-of select="@code"/>
                                        </xsl:attribute> 
                                        <skos:definition>ModifierClass</skos:definition>
                                       
                                        <xsl:for-each select="Meta">
                                                <xsl:if test="@name = 'excludeOnPrecedingModifier'">
                                                                <skos:note>
                                                                        <xsl:value-of select="@name"/>
                                                                </skos:note>
                                                                
                                                                <skos:related>
                                                                        <xsl:attribute name="rdf:resource">
                                                                                <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="fn:replace(@value,' ','Class')"/>  
                                                                        </xsl:attribute>
                                                                </skos:related>
                                                </xsl:if>
                                        </xsl:for-each>
                                        
                                        <skos:broader> 
                                                <xsl:attribute name="rdf:resource">
                                                        <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="SuperClass/@code"/>
                                                </xsl:attribute> 
                                         </skos:broader>
                                                                 
                                        <skos:inScheme rdf:resource=""/>
                                
                                <xsl:for-each select="Rubric">              
                                        
                                        <xsl:if test="@kind = 'preferred'">
                                                <skos:prefLabel>
                                                        <xsl:value-of select="Label"/>
                                                </skos:prefLabel>
                                        </xsl:if>
                                       
                                        <xsl:if test="@kind = 'preferredLong'">
                                                <skos:altLabel>
                                                        <xsl:value-of select="Label"/>
                                                </skos:altLabel>
                                        </xsl:if>
                                        
                                        <xsl:if test="@kind = 'inclusion'">
                                                <skos:altLabel>
                                                        <xsl:value-of select="Label"/>
                                                </skos:altLabel>
                                        </xsl:if>
                                        
                                        <xsl:if test="@kind = 'definition'">
                                                <skos:note>
                                                        <xsl:value-of select="Label"/>
                                                </skos:note>
                                        </xsl:if>
                                        
                                        <xsl:if test="@kind = 'note'">
                                                <skos:note>
                                                        <xsl:value-of select="Label"/>
                                                </skos:note>
                                        </xsl:if>
                                        
                                        
                                        <xsl:if test="@kind = 'exclusion'">
                                                
                                                        <skos:note>
                                                                <xsl:value-of select="Label"/>
                                                        </skos:note>
                                                        <xsl:if test="Label/Reference/@code">
                                                                <skos:related>
                                                                        <xsl:attribute name="rdf:resource">
                                                                                <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="Label/Reference/@code"/>
                                                                        </xsl:attribute>
                                                                </skos:related>
                                                        </xsl:if>          
                                        </xsl:if>
                                </xsl:for-each>       
                                       
                                </skos:Concept>
                        </xsl:for-each>
                        
                        <xsl:for-each select="/ClaML/Class">
                                         <skos:Concept>
                                                 <xsl:attribute name="rdf:about">
                                                         <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="@code"/>
                                                 </xsl:attribute>
                                                 
                                                 <skos:definition>Class</skos:definition>
                                                
                                                 <xsl:if test="@usage">
                                                         <skos:skopeNote>
                                                                 <xsl:value-of select="@usage"/>     
                                                         </skos:skopeNote> 
                                                 </xsl:if>
                                                 
                                                 <skos:broader> 
                                                         <xsl:attribute name="rdf:resource">
                                                                 <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="SuperClass/@code"/>
                                                         </xsl:attribute> 
                                                 </skos:broader>
                                                 
                                                 <skos:narrower> 
                                                         <xsl:attribute name="rdf:resource">
                                                                 <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="ModifiedBy/@code"/>
                                                         </xsl:attribute> 
                                                 </skos:narrower>
                                                 
                                                 <xsl:for-each select="SubClass">
                                                         <skos:narrower> 
                                                                 <xsl:attribute name="rdf:resource">
                                                                         <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="@code"/>
                                                                 </xsl:attribute> 
                                                                 <xsl:value-of select="@code"/>
                                                         </skos:narrower>
                                                 </xsl:for-each>
                                                 
                                                 
                                                 <xsl:for-each select="Rubric">              
                                                         
                                                         <xsl:if test="@kind = 'preferred'">
                                                                 <skos:prefLabel>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:prefLabel>
                                                         </xsl:if>
                                                         
                                                         <xsl:if test="@kind = 'preferredLong'">
                                                                 <skos:altLabel>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:altLabel>
                                                         </xsl:if>
                                                         
                                                         <xsl:if test="@kind = 'inclusion'">
                                                                 <skos:altLabel>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:altLabel>
                                                                 <skos:skopeNote>
                                                                         <xsl:for-each select="Label/Fragment/Reference">
                                                                                 <xsl:if test="@usage">
                                                                                        <xsl:value-of select="@usage"/>
                                                                                 </xsl:if>
                                                                         </xsl:for-each>
                                                                 </skos:skopeNote>
                                                         </xsl:if>
                                                         
                                                         <xsl:if test="@kind = 'exclusion'">
                                                                 
                                                                 <skos:note>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:note>
                                                                 
                                                                 <xsl:if test="Label/Reference/@code">
                                                                        <skos:related>
                                                                                <xsl:attribute name="rdf:resource">
                                                                                        <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="Label/Reference/@code"/>
                                                                                </xsl:attribute>
                                                                        </skos:related>
                                                                 </xsl:if> 
                                                         </xsl:if>
                                                         
                                                         <xsl:if test="@kind = 'definition'">
                                                                 <skos:note>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:note>
                                                         </xsl:if>
                                                         
                                                         <xsl:if test="@kind = 'note'">
                                                                 <skos:note>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:note>
                                                         </xsl:if>
                                                         
                                                         <xsl:if test="@kind = 'modifierlink'">
                                                                <skos:note>
                                                                        <xsl:value-of select="Label"/>
                                                                </skos:note>
                                                                <xsl:if test="Label/Reference/@code">
                                                                        <skos:related>
                                                                                <xsl:attribute name="rdf:resource">
                                                                                        <xsl:text disable-output-escaping="yes"><![CDATA[#]]></xsl:text><xsl:value-of select="Label/Reference/@code"/>
                                                                                </xsl:attribute>
                                                                        </skos:related>
                                                                </xsl:if>     
                                                         </xsl:if>
                                                         
                                                         <xsl:if test="@kind = 'text'">
                                                                 <skos:note>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:note>
                                                         </xsl:if>
                                                         
                                                                                                                 
                                                         <xsl:if test="@kind = 'introduction'">
                                                                  <skos:note>
                                                                         <xsl:value-of select="Label"/>
                                                                 </skos:note>
                                                         </xsl:if>
                                                         
                                                 </xsl:for-each>       
                                         </skos:Concept>
                        </xsl:for-each>   
                </rdf:RDF>
        </xsl:template>
</xsl:stylesheet>