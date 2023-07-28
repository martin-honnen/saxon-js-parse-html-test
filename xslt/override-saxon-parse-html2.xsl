<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:saxon="http://saxon.sf.net/"
  xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
  exclude-result-prefixes="#all"
  expand-text="yes">

  <xsl:function name="saxon:parse-html" as="document-node()" use-when="system-property('xsl:product-name') = 'SaxonJS'">
    <xsl:param name="html" as="xs:string"/>
    <xsl:sequence select="ixsl:eval('new DOMParser()') => ixsl:call('parseFromString', [$html, 'text/html'])"/>
  </xsl:function>

</xsl:stylesheet>