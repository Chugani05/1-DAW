<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:param name="mes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Informe</title>
      </head>
      <body>
        <xsl:apply-templates select="//examen[contains(., $mes)]">
          <xsl:sort select="substring(., 1, 2)" data-type="number"/>
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="examen">
    <xsl:variable name="idioma" select="../../@codigo"/>
    <xsl:variable name="fecha" select="."/>
    <xsl:if test="string-length($idioma) > 0">
      <xsl:if test="not(preceding::examen[. = $fecha and ../../@codigo = $idioma])">
        <h2><xsl:value-of select="$mes"/></h2>
        <h3><xsl:value-of select="$idioma"/></h3>
      </xsl:if>
      <p><strong>Fecha:</strong> <xsl:value-of select="$fecha"/></p>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
