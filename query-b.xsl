<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <xsl:apply-templates select="warehouses/warehouse/address[country='Singapore' or country='Malaysia']/.."/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="warehouse">
        <h3> Warehouse: <xsl:value-of select="name"/></h3>
        <ul><xsl:apply-templates select="items/item[not(../item/qty &gt; qty)]"/></ul>
        <br/>

    </xsl:template>
    <xsl:template match="item">
        <li><xsl:value-of select="name"/>, <xsl:value-of select="qty"/></li>
    </xsl:template>
</xsl:stylesheet>