<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" name="html" encoding="iso-8859-1" indent="yes"/>
	<xsl:include href="fiche-auteur.xslt"/>
	<xsl:include href="fiche-recette.xslt"/>
	<xsl:include href="fiche-ingredient.xslt"/>
	<xsl:include href="fiche-produit.xslt"/>
	<xsl:include href="fiche-categorie.xslt"/>
	
	<xsl:template match="/">
		<xsl:result-document format="html" encoding="utf-8" href="index.html">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="lang">fr</xsl:attribute>
				<head>
					<title>Accueil</title>
					<link rel="stylesheet" href="cssIndex.css" media="screen" type="text/css" />
				</head>
				<body>
					<ul id="navigation">
						<li>
							<a href="index.html" title="Aller à la page d'accueil">Accueil</a>
						</li>
						<li>
							<a href="Auteurs.html" title="Aller à la page Auteurs">Auteurs</a>
						</li>
						<li>
							<a href="Recettes.html" title="Aller à la page Recettes">Recettes</a>
						</li>
						<li>
							<a href="Produits.html" title="Aller à la page Produits">Produits</a>
						</li>
						<li>
							<a href="Categories.html" title="Aller à la page Catégories">Catégories</a>
						</li>
					</ul>
					<h1>Bienvenue sur le site de cuisine</h1>
					<img alt="Logo AMU" src="amu.png" width="150" height="75"/>
					<h6 id="ref">Site inspiré de <a href="https://odelices.ouest-france.fr/">Ôdelices</a> </h6>
				</body>
				<xsl:call-template name="fiche-produit"/>
				<xsl:call-template name="fiche-auteur"/>				
				<xsl:call-template name="fiche-categorie"/>
				<xsl:call-template name="fiche-ingredient"/>
				<xsl:call-template name="fiche-recette"/>
				
		</html>
		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>
