<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:ns="http://www.somewhere.org/BattleCatalog"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="
http://www.somewhere.org/BattleCatalog file:///E:/3-%D1%82%D0%B8%20%D0%BA%D1%83%D1%80%D1%81/XML/%D0%9F%D1%80%D0%BE%D0%B5%D0%BA%D1%82/BattleCatalog.xsd">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
    <xsl:value-of select="./ns:BattleCatalog./ns:Battle./ns:picture/@location"/>
    <xsl:variable name="sortby">
        <xsl:value-of select="'StartDate'" />
    </xsl:variable>
	
    The table has been sorted according to:
    <xsl:value-of select='$sortby'/>
		<html>
			<head>
				<title>XML to HTML transformation of BattleCatalog</title>
			</head>
			<body>
				<h1>Каталог от исторически конфликти</h1>
				<table border="1" width="95%">
					<tbody>
						<tr>
							<th>Конфликт</th>
							<th>Тип на конфликта</th>
							<th>Начална дата</th>
							<th>Местоположение</th>
							<th>Атакуващ</th>
							<th>Размер на атакуващата армия</th>
							<th>Защитник</th>
							<th>Размер на защитаващата армия</th>
							<th>Резултат</th>
							<th>Епоха</th>
						</tr>
						<xsl:for-each select="/ns:BattleCatalog/ns:Battle">
							<xsl:sort select="*[name() = $sortby]"/>
								<tr>							
									<td>
										<xsl:value-of select="./ns:Name"/>
									</td>
									<td>
										<xsl:value-of select="./ns:ConflictType"/>
									</td>
									<td>
										<xsl:value-of select="./ns:StartDate"/>
									</td>
									<td>
										<xsl:value-of select="./ns:Place"/>
									</td>
									<td>
										<xsl:for-each select="./ns:Attackers/ns:Attacker">
											<div><xsl:value-of select="./ns:Name"/></div>
										</xsl:for-each>	
									</td>
									<td>
										<xsl:value-of select="./ns:Attackers/@TotalArmy"/>
										<xsl:for-each select="./ns:Attackers/ns:Attacker">
											<div>
												<xsl:value-of select="./ns:Name"/>
												<xsl:text>: </xsl:text>
												<xsl:value-of select="./ns:Army"/>
											</div>
										</xsl:for-each>
									</td>
									<td>
										<xsl:for-each select="./ns:Defenders/ns:Defender">
											<xsl:value-of select="./ns:Name"/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td>
										Общо: <xsl:value-of select="./ns:Defenders/@TotalArmy"/>
										<xsl:for-each select="./ns:Defenders/ns:Defender">
											<div>
												<xsl:value-of select="./ns:Name"/>
												<xsl:text>: </xsl:text>
												<xsl:value-of select="./ns:Army"/>
											</div>
										</xsl:for-each>
									</td>
									<td>
										<xsl:value-of select="./ns:Result"/>
									</td>
									<td>
										<xsl:value-of select="./ns:Era"/>
									</td>
								</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>