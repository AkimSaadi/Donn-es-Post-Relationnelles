<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" name="html" encoding="iso-8859-1" indent="yes"/>
		<xsl:template name="fiche-produit">
				<xsl:result-document format="html" encoding="utf-8" href="Produits.html">
				<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
				<xsl:text>&#10;</xsl:text>
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:attribute name="lang">fr</xsl:attribute>
					<head>
						<title>Produits</title>
						<link rel="stylesheet" href="cssProduit.css" media="screen" type="text/css" />
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
						<h1>
							Liste des produits
						</h1>
						<ul>
						<xsl:attribute name="id">liste</xsl:attribute>
						<xsl:for-each select="//produitIngredient">
							<li><a href="#{@id}"><xsl:value-of select="nom"/></a></li>
						</xsl:for-each>
						</ul>
						<h1>Produits</h1>
						<xsl:for-each select="//produitIngredient">
						<div id="produit">
							<h2 id="{@id}">
								<xsl:value-of select="nom"/>
							</h2>	
						Ingredient appartenant au produit <xsl:value-of select="nom"/> :
							<ul>
								<xsl:for-each select="ref-ingredient">
									<xsl:variable name="refingredient" select="@ref"/>
									<li>
										<a href="Ingredients.html#{@ref}">
											<xsl:value-of select="//ingredient[@id=$refingredient]/nom"/>
										</a>
									</li>
								</xsl:for-each>
							</ul>
							</div>
						</xsl:for-each>
					</body>
				</html>
				</xsl:result-document>
		</xsl:template>
</xsl:stylesheet>