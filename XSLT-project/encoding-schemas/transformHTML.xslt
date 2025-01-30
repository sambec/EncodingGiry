<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                version="2.0">
    <xsl:param name="prev_link"/> <!-- Paramètre pour la lettre précédente -->
    <xsl:param name="next_link"/> <!-- Paramètre pour la lettre suivante -->


    <!-- Output as HTML -->
    <xsl:output method="html" indent="yes" encoding="UTF-8" />

    <!-- Define a variable for the licence URL -->
    <xsl:variable name="licenceURL" select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:licence/tei:ref/@target" />

    <!-- Racine de transformation -->
    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="../style.css"/>
            </head>
            <body>
                <div class="container">

                                        <!-- Barre de navigation -->
                    <nav class="top-nav">
                        <a href="index.html">📜 Retour à l'Index</a>
                        <xsl:if test="$prev_link != ''">
                            <a href="{$prev_link}">⬅ Lettre précédente</a>
                        </xsl:if>
                        <xsl:if test="$next_link != ''">
                            <a href="{$next_link}">Lettre suivante ➡</a>
                        </xsl:if>
                    </nav>

                    <!-- Section principale -->
                                        <header>
                        <h1>
                            <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                        </h1>
                        <p><strong>Distributor:</strong> 
                            <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:distributor"/>
                        </p>
                        <p><strong>Date:</strong> 
                            <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>
                        </p>
                        <!-- Include hyperlink for the licence -->
                        <p><strong>Licence:</strong> 
                            <a href="{$licenceURL}">
                                <xsl:value-of select="$licenceURL"/>
                            </a>
                        </p>
                    </header>

                    <!-- Main Section -->
                    <main>
                        <!-- Letter Details -->
                        <section>
                            <h2>Letter Details</h2>
                            <p><strong>Sender:</strong> 
                                <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:persName"/>
                                from <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:placeName"/>
                                (<xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:date/@when"/>)
                            </p>
                            <p><strong>Receiver:</strong> 
                                <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:persName"/>
                                in <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:placeName"/>
                            </p>
                        </section>
                        <!-- Section détaillée pour le Sender -->
                        <section id="sender">
                            <h2>Sender</h2>
                            <p><strong>Name:</strong> 
                                <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:persName"/>
                            </p>
                            <p><strong>Location:</strong> 
                                <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:placeName"/>
                            </p>
                        </section>

                        <!-- Section détaillée pour le Receiver -->
                        <section id="receiver">
                            <h2>Receiver</h2>
                            <p><strong>Name:</strong> 
                                <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:persName"/>
                            </p>
                            <p><strong>Location:</strong> 
                                <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:placeName"/>
                            </p>
                        </section>

                        <!-- Contenu principal de la lettre -->
                        <section>
                            <h2>Letter Content</h2>
                            <h3>
                                <xsl:value-of select="tei:text/tei:body/tei:head"/>
                            </h3>
                            <p><strong>Date:</strong> 
                                <xsl:value-of select="concat(tei:text/tei:body/tei:opener/tei:dateline/tei:placeName, ', ', tei:text/tei:body/tei:opener/tei:dateline)"/>
                            </p>
                            <p><strong>Salutation:</strong> 
                                <xsl:value-of select="tei:text/tei:body/tei:opener/tei:salute"/>
                            </p>

                            <!-- Hyperliens vers Sender et Receiver -->
                            <p><strong>From:</strong> 
                                <a href="#sender">
                                    <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:persName"/>
                                </a>
                            </p>
                            <p><strong>To:</strong> 
                                <a href="#receiver">
                                    <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:persName"/>
                                </a>
                            </p>

                            <!-- Contenu avec boucle -->
                            <div>
                                <xsl:for-each select="tei:text/tei:body/tei:p">
                                    <p>
                                        <xsl:value-of select="."/>
                                    </p>
                                </xsl:for-each>
                            </div>

                            <!-- Postscript -->
                            <h3>Postscript</h3>
                            <xsl:if test="tei:text/tei:body/tei:postscript">
                                <div>
                                    <xsl:for-each select="tei:text/tei:body/tei:postscript/tei:p">
                                        <p class="postscript">
                                            <xsl:value-of select="."/>
                                        </p>
                                    </xsl:for-each>
                                </div>
                            </xsl:if>

                            <!-- Closing -->
                            <p><strong>Closing:</strong> 
                                <xsl:value-of select="tei:text/tei:body/tei:closer/tei:salute"/>
                            </p>
                            <p><strong>Signed:</strong> 
                                <xsl:value-of select="tei:text/tei:body/tei:closer/tei:signed"/>
                            </p>
                        </section>              
                    </main>
                      <!-- Barre de navigation bas de page -->
                    
                    <nav class="bottom-nav">
                        <a href="index.html">📜 Retour à l'Index</a>
                        <xsl:if test="$prev_link != ''">
                            <a href="{$prev_link}">⬅ Lettre précédente</a>
                        </xsl:if>
                        <xsl:if test="$next_link != ''">
                            <a href="{$next_link}">Lettre suivante ➡</a>
                        </xsl:if>
                    </nav>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
