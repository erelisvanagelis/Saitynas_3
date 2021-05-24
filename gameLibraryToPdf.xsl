<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <fo:root language="EN">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-portrail" page-height="297mm"
                                       page-width="210mm" margin-top="5mm"
                                       margin-bottom="5mm" margin-left="5mm"
                                       margin-right="5mm">
                    <fo:region-body margin-top="25mm" margin-bottom="20mm"/>
                    <fo:region-before region-name="xsl-region-before"
                                      extent="25mm" display-align="before"
                                      precedence="true"/>
                    <fo:region-after region-name="xsl-region-after" extent=".5in"/>
                </fo:simple-page-master>                    
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4-portrail">
                
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block>
                        <fo:leader leader-pattern="rule" leader-length="20cm"/>
                    </fo:block>
                    
                    <fo:block text-align="end">
                        Page <fo:page-number/> of 
                        <fo:page-number-citation 
                            ref-id="TheVeryLastPage"/>
                    </fo:block>
                </fo:static-content>
                
                <fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">
                    <fo:block>Game library</fo:block>
                    <fo:block>Account name: <xsl:value-of select="gameLibrary/accountName"/></fo:block>
                    <fo:block>
                        <xsl:element name="fo:external-graphic">
                            <xsl:attribute name="src">
                                <xsl:value-of select="gameLibrary/avatar"/>
                            </xsl:attribute>
                            <xsl:attribute name="content-height">
                                scale-to-fit
                            </xsl:attribute>
                            <xsl:attribute name="height">
                                4.50in
                            </xsl:attribute>
                            <xsl:attribute name="content-width">
                                7.80in
                            </xsl:attribute>
                            <xsl:attribute name="scaling">
                                non-uniform
                            </xsl:attribute>
                        </xsl:element>                              
                    </fo:block>
                        
                    <xsl:for-each select="gameLibrary/games/game">
                        <fo:block page-break-before="always" font-size="20pt" >
                            <xsl:value-of select="title"/>
                        </fo:block>
                        <fo:block text-align="right" line-height="0pt">
                            <xsl:element name="fo:external-graphic">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="icon"/>
                                </xsl:attribute>
                                <xsl:attribute name="content-height">
                                    scale-to-fit
                                </xsl:attribute>
                                <xsl:attribute name="height">
                                    1.00in
                                </xsl:attribute>
                                <xsl:attribute name="content-width">
                                    1.00in
                                </xsl:attribute>
                                <xsl:attribute name="scaling">
                                    non-uniform
                                </xsl:attribute>
                                <xsl:attribute name="text-align">
                                    right
                                </xsl:attribute>
                                <xsl:attribute name="display-align">
                                    after
                                </xsl:attribute>
                            </xsl:element>                               
                        </fo:block>

                        <fo:block font-size="20pt" font-family="serif"
                        line-height="30pt">
                           <!-- 
						   <fo:instream-foreign-object>
                                <svg:svg xmlns:svg="http://www.w3.org/2000/svg" width="20" height="20">
                                    <svg:g style="fill:red; stroke:#000000">
                                        <svg:rect x="0" y="0" width="15" height="15"/>
                                        <svg:rect x="5" y="5" width="15" height="15"/>
                                    </svg:g>
                                </svg:svg>
                            </fo:instream-foreign-object>
							-->
                        </fo:block>
                
                        
                        <fo:block>
                            Is it installed:
                            <xsl:value-of select="installed"/>
                        </fo:block>
                        <fo:block>
                            Size: 
                            <xsl:value-of select="size"/>
                            <xsl:value-of select="sizeMeasure"/>
                        </fo:block>
                        <fo:block>
                            Play time: 
                            <xsl:value-of select="playTime"/>
                            <xsl:value-of select="playTimeMeasure"/>
                        </fo:block>
                        <fo:block>
                            Version:
                        </fo:block>
                        <fo:block text-indent="10mm">
                            Title: 
                            <xsl:value-of select="version/title"/>
                        </fo:block>
                        <fo:block text-indent="10mm">
                            Build: 
                            <xsl:value-of select="version/build"/>
                        </fo:block>
                        <fo:block text-indent="10mm">
                            Release 
                            <xsl:value-of select="version/release"/>
                        </fo:block>
                        <fo:block text-indent="10mm">
                            Description: 
                            <xsl:value-of select="version/description"/>
                        </fo:block>
                        
                        <fo:block> 
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block>
                            Developer: 
                        </fo:block>
                        <fo:block text-indent="10mm">
                            Title: 
                            <xsl:value-of select="developer/title"/>
                        </fo:block>
                        <fo:block text-indent="10mm">
                            URL: 
                            <xsl:value-of select="developer/url"/>
                        </fo:block>
                        
                        <fo:block> 
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block>
                            Publisher: 
                        </fo:block>
                        <fo:block text-indent="10mm">
                            Title: 
                            <xsl:value-of select="publisher/title"/>
                        </fo:block>
                        <fo:block text-indent="10mm">
                            URL: 
                            <xsl:value-of select="publisher/url"/>
                        </fo:block>
                        
                        <fo:block> 
                            <fo:leader/>
                        </fo:block>
                        
                        <fo:block>
                            Achievements: 
                        </fo:block>
                        <xsl:for-each select="achievements/achievement">
                            <fo:block text-indent="10mm">
                                Title: 
                                <xsl:value-of select="title"/>
                            </fo:block>
                            <fo:block text-indent="10mm">
                                Description: 
                                <xsl:value-of select="description"/>
                            </fo:block>
                            <fo:block text-indent="10mm">
                                Is it achieved: 
                                <xsl:value-of select="achieved"/>
                            </fo:block>
                            <fo:block text-indent="10mm">
                                Percent of players achieved: 
                                <xsl:value-of select="percentOfPlayersAchieved"/>
                            </fo:block>
                            <fo:block> 
                                <fo:leader/>
                            </fo:block>
                        </xsl:for-each>
                        <fo:block>
                            Purchased DLC:
                        </fo:block>
                        <xsl:for-each select="purchasedDLC/dLC">
                            <fo:block text-indent="10mm">
                                Title: 
                                <xsl:value-of select="title"/>
                            </fo:block>
                            <fo:block text-indent="10mm">
                                Is it installed: 
                                <xsl:value-of select="installed"/>
                            </fo:block>
                            <fo:block text-indent="10mm">
                                It was added on: 
                                <xsl:value-of select="added"/>
                            </fo:block>
                            <fo:block> 
                                <fo:leader/>
                            </fo:block>
                        </xsl:for-each>
                        
                        <fo:block>
                            <xsl:element name="fo:external-graphic">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="image"/>
                                </xsl:attribute>
                                <xsl:attribute name="content-height">
                                    scale-to-fit
                                </xsl:attribute>
                                <xsl:attribute name="height">
                                    4.50in
                                </xsl:attribute>
                                <xsl:attribute name="content-width">
                                    7.8in
                                </xsl:attribute>
                                <xsl:attribute name="scaling">
                                    non-uniform
                                </xsl:attribute>
                            </xsl:element>                              
                        </fo:block>
                        
                        <fo:block text-align="end">
                            <xsl:value-of select="title"/>
                        </fo:block>
                    </xsl:for-each>
                    <fo:block id="TheVeryLastPage"> </fo:block>
                </fo:flow>
                
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>