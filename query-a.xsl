<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <xsl:apply-templates select="warehouses/warehouse/address[country='Singapore']/.."/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="warehouse">
        <xsl:choose>
            <xsl:when test="items/item[qty > 975]">
                <h3> Warehouse: <xsl:value-of select="name"/></h3>
                <h4>filtered items (qty > 975):</h4>
                <ul>
                    <xsl:apply-templates select="items/item[qty > 975]"/>
                </ul>
                <br/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <xsl:value-of select="name"/>, <xsl:value-of select="qty"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
