<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  
  <!-- Match the root element 'products' -->
  <xsl:template match="/products">
    <html>
      <head>
        <title>ShopSmart Product Catalog</title>
      </head>
      <body>
        <h1>Product Catalog</h1>
        <table>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
          </tr>
          <!-- Apply the template for each 'product' element -->
          <xsl:apply-templates select="product"/>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <!-- Match each 'product' element -->
  <xsl:template match="product">
    <tr>
      <td><xsl:value-of select="id"/></td>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="price"/></td>
      <td><xsl:value-of select="description"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
