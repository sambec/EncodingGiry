<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tei="http://www.tei-c.org/ns/1.0" 
                version="1.0">

    <!-- Output as HTML -->
    <xsl:output method="html" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <style>
                    body { font-family: Arial, sans-serif; line-height: 1.6; }
                    h1, h2 { color: #2c3e50; }
                    .metadata, .content { margin-bottom: 20px; }
                    .content p { margin: 10px 0; }
                </style>
            </head>
            <body>
                <!-- Main Title -->
                <h1>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </h1>

                <!-- Metadata Section -->
                <div class="metadata">
                    <h2>Metadata</h2>
                    <p><b>Distributor:</b> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:distributor"/></p>
                    <p><b>Date:</b> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/></p>
                    <p><b>Settlement:</b> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/></p>
                    <p><b>Institution:</b> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution"/></p>
                    <p><b>ID Number:</b> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/></p>
                </div>

                <!-- Correspondence Section -->
                <div class="correspondence">
                    <h2>Correspondence</h2>
                    <p><b>Sent By:</b> 
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:persName"/> 
                        from <xsl:value-of select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:placeName"/>
                    </p>
                    <p><b>Received By:</b> 
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:persName"/> 
                        in <xsl:value-of select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:placeName"/>
                    </p>
                </div>

                <!-- Letter Content -->
                <div class="content">
                    <h2>Letter Content</h2>
                    <h3>Header</h3>
                    <p><b>Paper:</b> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:head"/></p>
                    <p><b>Dateline:</b> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:opener/tei:dateline"/></p>
                    <p><b>Salute:</b> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:opener/tei:salute"/></p>

                    <h3>Main Body</h3>
                    <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:p">
                        <p><xsl:value-of select="."/></p>
                    </xsl:for-each>

                    <h3>Closing</h3>
                    <p><b>Salute:</b> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:closer/tei:salute"/></p>
                    <p><b>Signed:</b> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:closer/tei:signed"/></p>

                    <h3>Postscript</h3>
                    <xsl:for-each select="tei:TEI/tei:text/tei:body/tei:postscript/tei:p">
                        <p><xsl:value-of select="."/></p>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
