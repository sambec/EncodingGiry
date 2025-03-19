<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/tei:TEI">
        <!-- LaTeX Preamble -->
        \documentclass[12pt]{article}
        \usepackage{geometry}
        \usepackage{fontspec}
        \usepackage{hyperref}
        \usepackage{titlesec}
        \usepackage{tocloft}

        \geometry{a4paper, margin=1in}
        \setmainfont{Times New Roman}

        \hypersetup{
            colorlinks=true,
            linkcolor=blue,
            urlcolor=blue
        }

        \title{\xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>}
        \author{Encoded from TEI by XSLT}
        \date{\xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>}

        \begin{document}

        %%%%%%%%%%%%% Title Page %%%%%%%%%%%%%
        \begin{titlepage}
            \centering
            {\Huge \xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>} \\
            \vspace{1cm}
            {\Large Encoded from TEI using XSLT} \\
            \vspace{2cm}
            \textbf{Distributor:} \xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:distributor"/> \\
            \textbf{Date:} \xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/> \\
            \vfill
            {\small This document was generated on \today}
        \end{titlepage}

        %%%%%%%%%%%%% Table of Contents %%%%%%%%%%%%%
        \tableofcontents
        \newpage

        %%%%%%%%%%%%% Metadata Section %%%%%%%%%%%%%
        \section{Metadata}
        \textbf{Sender:} \xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:persName"/> \\
        \textbf{Location:} \xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:placeName"/> \\
        \textbf{Date:} \xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:date/@when"/> \\

        \textbf{Receiver:} \xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:persName"/> \\
        \textbf{Location:} \xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:placeName"/> \\

        %%%%%%%%%%%%% Letter Section %%%%%%%%%%%%%
        \section{Letter}
        \textbf{Header:} \xsl:value-of select="tei:text/tei:body/tei:head"/> \\
        \textbf{Date and Place:} \xsl:value-of select="concat(tei:text/tei:body/tei:opener/tei:dateline/tei:placeName, ', ', tei:text/tei:body/tei:opener/tei:dateline)"/> \\

        \textbf{Salutation:} \xsl:value-of select="tei:text/tei:body/tei:opener/tei:salute"/> \\

        \noindent\rule{0.5\textwidth}{0.4pt}  % Horizontal line

        %%%%%%%%%%%%% Letter Content %%%%%%%%%%%%%
        <xsl:for-each select="tei:text/tei:body/tei:p">
            \par
            <xsl:apply-templates select="."/>
        </xsl:for-each>

        \noindent\rule{0.5\textwidth}{0.4pt}  % Horizontal line

        \textbf{Closing:} \xsl:value-of select="tei:text/tei:body/tei:closer/tei:salute"/> \\
        \textbf{Signed:} \xsl:value-of select="tei:text/tei:body/tei:closer/tei:signed"/> \\

        %%%%%%%%%%%%% Postscript Section %%%%%%%%%%%%%
        <xsl:if test="tei:text/tei:body/tei:postscript">
            \section{Postscript}
            <xsl:for-each select="tei:text/tei:body/tei:postscript/tei:p">
                \par
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:if>

        \end{document}
    </xsl:template>

    <!-- Convert <title> elements to italic in LaTeX -->
    <xsl:template match="tei:title">
        \textit{<xsl:apply-templates/>}
    </xsl:template>

</xsl:stylesheet>
