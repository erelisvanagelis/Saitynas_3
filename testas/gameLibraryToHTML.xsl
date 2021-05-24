<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : gameLibraryToHTML.xsl
    Created on : 2021 m. kovo 22 d., 14:06
    Author     : Acer
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="C:/Users/Acer/IdeaProjects/gameLibrary-rest/style.css"/>
                <script src="C:/Users/Acer/IdeaProjects/gameLibrary-rest/script.js"></script>
            </head>
            <body>
                <h2>Game Library</h2>
                <h3>
                    Account name: 
                    <xsl:value-of select= "gameLibrary/accountName"/>
                </h3>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:value-of select="gameLibrary/avatar"/>
                    </xsl:attribute>
                    <xsl:attribute name="style">width:50px;height:60px;
                    </xsl:attribute>
                </xsl:element>
                <h3>Games:</h3>

                <div class="buttonContainer">
                    <xsl:for-each select = "gameLibrary/games/game" >  
                        <button onclick="collapse(this)" class="block">
                            <xsl:attribute name="id">
                                <xsl:value-of select="title"/>
                            </xsl:attribute>
                            <xsl:value-of select = "title"/>
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="icon"/>
                                </xsl:attribute>
                                <xsl:attribute name="style">width:30px;height:30px;
                                </xsl:attribute>
                            </xsl:element>
                        </button>
                    </xsl:for-each>                    
                </div>
                
                <div id="container" class="container">
                    <xsl:for-each select = "gameLibrary/games/game" >  
                        <div class="game">
                            <xsl:attribute name="id">
                                <xsl:value-of select="title"/>1</xsl:attribute>
                            <xsl:attribute name="style">
                                background-image: url('<xsl:value-of select="image"/>');
                                background-position: center top;
                                background-size: 100%;
                                background-attachment: fixed;
                            </xsl:attribute>
                            <h2>
                                <xsl:value-of select="title"/>
                            </h2>
                            <h3>Installed: <xsl:value-of select = "installed"/></h3>
                            <h3>Size: 
                                <xsl:value-of select = "size"/>
                                <xsl:value-of select = "sizeMeasure"/>
                            </h3>
                            <h3>Play time: 
                                <xsl:value-of select="playTime"/>
                                <xsl:value-of select="playTimeMeasure"/>
                            </h3>
                            <h3>Developer:
                                <xsl:value-of select="developer/title"/>
                            </h3>
                            <h3>Publisher:
                                <xsl:value-of select="publisher/title"/>
                            </h3>
                            <h3>Version:
                                <xsl:value-of select="version/title"/>
                            </h3>
                            <h4 style="margin:20px;">Build:
                                <xsl:value-of select="version/build"/>
                            </h4>
                            <h4 style="margin:20px;">Release:
                                <xsl:value-of select="version/release"/>
                            </h4>
                            <h4 style="margin:20px;">Description:
                                <xsl:value-of select="version/description"/>
                            </h4>                                
                            
                            <h3>Achievements:</h3>                                  
                            <xsl:for-each select = "achievements/achievement" >
                                <button onclick="collapseAchievement(this)" class="block">
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="title"/>
                                    </xsl:attribute>
                                    
                                    <xsl:value-of select="title"/>
                                </button>
                                <div style="margin:20px;display:none;">
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="title"/>1</xsl:attribute>
                                    <h4>Title:
                                        <xsl:value-of select="title"/>
                                    </h4>
                                    <h4>Description:
                                        <xsl:value-of select="description"/>
                                    </h4>
                                    <h4>Achieved:
                                        <xsl:value-of select="achieved"/>
                                    </h4>
                                    <h4>Percent of players achieved:
                                        <xsl:value-of select="percentOfPlayersAchieved"/>
                                    </h4>                                     
                                </div>

                            </xsl:for-each>
                            
                            <h4>Purchased DLC:
                            </h4>                                  
                            
                            <xsl:for-each select = "purchasedDLC/dLC" >
                                <button onclick="collapseAchievement(this)" class="block">
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="title"/>
                                    </xsl:attribute>
                                    
                                    <xsl:value-of select="title"/>
                                </button>
                                <div style="margin:20px;display:none;">
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="title"/>1</xsl:attribute>
                                    <h4>Title:
                                        <xsl:value-of select="title"/>
                                    </h4>
                                    <h4>Is it installed:
                                        <xsl:value-of select="installed"/>
                                    </h4>
                                    <h4>Date added:
                                        <xsl:value-of select="added"/>
                                    </h4>                             
                                </div>

                            </xsl:for-each>     

                        </div>
                    </xsl:for-each>                    
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
