<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
            	<link rel="stylesheet" type="text/css" href="style.css" />
            </head>
            <body>
                <h2>Dams</h2>
                <xsl:variable name="header" >
                              Description
                        </xsl:variable> 
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Year</th>
                        <th>Type</th>
                        <th>Capacity</th>
                        <th>Tributaries</th>
                        <th>RegionId</th>
                        <th>Img</th>
                    </tr>
                    <xsl:for-each select="/Catalog/Dams/Dam">
                        <xsl:sort
					        select = "Capacity" 
                            data-type="number"
					        order = "ascending">
                        </xsl:sort>
                        <tr>
                            <td>
                                <xsl:value-of select="Name"/>
                            </td>
                            <td>
                                <xsl:value-of select="Year"/>
                            </td>
                            <td>
                                <xsl:value-of select="Type"/>
                            </td>
                            <td>
                                <xsl:value-of select="Capacity"/>
                            </td>
                            <td>
                                <xsl:value-of select="Tributaries"/>
                            </td>
                            <td>
                                <xsl:value-of select="RegionId"/>
                            </td>
                            <td>
                                <xsl:value-of select="Img"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>