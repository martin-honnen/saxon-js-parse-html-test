<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="#all"
  expand-text="yes">

  <xsl:import href="override-saxon-parse-html2.xsl"/>

  <xsl:output method="html" indent="yes" html-version="5.0"/>

  <xsl:mode on-no-match="shallow-copy"/>

  <xsl:template match="/" name="xsl:initial-template">
    <xsl:next-match/>
    <xsl:comment xmlns:saxon="http://saxon.sf.net/">Run with {system-property('xsl:product-name')} {system-property('xsl:product-version')} {system-property('Q{http://saxon.sf.net/}platform')}</xsl:comment>
  </xsl:template>
  
 <xsl:template match="html-data">
    <div>
      <xsl:apply-templates select="saxon:parse-html(.)/html/body/node()" mode="strip-html-namespace" xpath-default-namespace="http://www.w3.org/1999/xhtml"/>
    </div>
  </xsl:template>

  <xsl:mode name="strip-xhtml-namespace" on-no-match="shallow-copy"/>

  <xsl:template match="*" mode="strip-xhtml-namespace" xpath-default-namespace="http://www.w3.org/1999/xhtml">
    <xsl:element name="{local-name()}" namespace="">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>