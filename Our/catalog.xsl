<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/> 

    <xsl:template match="/">
        <html>
            <body>
                <h2>My CD PORNO</h2>
                <table border="1">
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