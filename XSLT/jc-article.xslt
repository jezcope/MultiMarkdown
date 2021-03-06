<?xml version='1.0' encoding='utf-8'?>

<!-- XHTML-to-Article converter by Fletcher Penney
	specifically designed for use with MultiMarkdown created XHTML
	
	Uses the LaTeX memoir class with the article option for output
	
	MultiMarkdown Version 2.0.b6
	
	$Id: article.xslt 499 2008-03-23 13:03:19Z fletcher $
-->

<!-- 
# Copyright (C) 2005-2008  Fletcher T. Penney <fletcher@fletcherpenney.net>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
#    Free Software Foundation, Inc.
#    59 Temple Place, Suite 330
#    Boston, MA 02111-1307 USA
-->

	
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml"
	version="1.0">

	<xsl:import href="memoir.xslt"/>
	
	<xsl:output method='text' encoding='utf-8'/>

	<xsl:strip-space elements="*" />

	<xsl:template match="/">
		<xsl:apply-templates select="html:html/html:head"/>
		<xsl:apply-templates select="html:html/html:body"/>
		<xsl:call-template name="latex-footer"/>
	</xsl:template>

	<xsl:template name="latex-document-class">
		<xsl:text>\documentclass{article}

%\makeglossary
%\makeindex

</xsl:text>
	</xsl:template>

	<xsl:template name="latex-paper-size">
	</xsl:template>
	
	<xsl:template name="latex-title">
			<xsl:text>
% Title
\maketitle

</xsl:text>
	</xsl:template>

	<xsl:template name="latex-header">
  </xsl:template>

	<xsl:template name="latex-copyright">
			<xsl:text>% Copyright Info
\begin{quotation}
\noindent\ignorespaces
\ifx\mycopyright\undefined
\else
	\textcopyright{} \mycopyright
\fi
\end{quotation}

</xsl:text>
	</xsl:template>

  	<xsl:template name="latex-intro">
			<xsl:text>\usepackage[a4paper]{geometry}
\usepackage{cmbright}

%
%	PDF Stuff
%

%\ifpdf							% Removed for XeLaTeX compatibility
%  \pdfoutput=1					% Removed for XeLaTeX compatibility
  \usepackage[
  	plainpages=false,
  	pdfpagelabels,
  	pdftitle={\mytitle},
  	pagebackref,
  	pdfauthor={\myauthor},
  	pdfkeywords={\mykeywords}
  	]{hyperref}
%\fi							% Removed for XeLaTeX compatibility

\setlength{\parindent}{0pt}

%
% Title Information
%

\title{\mytitle}
\author{\myauthor}

\begin{document}
</xsl:text>
	</xsl:template>
	
	<xsl:template name="latex-begin-body">
		<xsl:text>%
% Main Content
%


% Layout settings
%\setlength{\parindent}{1em}

</xsl:text>
	</xsl:template>

	<xsl:template name="latex-footer">
		<xsl:text>%
% Back Matter
%

%\backmatter
%\appendixpage

%	Bibliography
%\bibliographystyle{\mybibliostyle}
%\bibliocommand

\end{document}
</xsl:text>
	</xsl:template>

</xsl:stylesheet>