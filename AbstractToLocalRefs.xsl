<xsl:stylesheet	xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml"/>
	<xsl:key name="identifier" match="gml:identifier[@codeSpace='urn:uuid:']" use="text()"/>
	<xsl:template match="@xlink:href[starts-with(., 'urn:uuid:') and key('identifier', substring-after(., 'urn:uuid:'))/../@gml:id]">
		<xsl:attribute name="xlink:href">
			<xsl:text>#</xsl:text>
			<xsl:value-of select="key('identifier', substring-after(., 'urn:uuid:'))/../@gml:id"/>
		</xsl:attribute>
	</xsl:template>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
