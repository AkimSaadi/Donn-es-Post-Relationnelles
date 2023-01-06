<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" name="html" encoding="iso-8859-1" indent="yes"/>
	<xsl:template name="fiche-auteur">
		<xsl:result-document format="html" encoding="utf-8" href="Auteurs.html">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="lang">fr</xsl:attribute>
			<head>
				<title>Auteurs</title>
				<link rel="stylesheet" href="cssAuteur.css" media="screen" type="text/css" />
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
					Liste des auteurs
				</h1>
				<ul>
				<xsl:attribute name="id">liste</xsl:attribute>			
				<xsl:for-each select="//auteur">
					<xsl:sort select="nom" order="ascending" data-type="text"/>
					<li><a href="#{@id}"><xsl:value-of select="nom"/></a></li>
				</xsl:for-each>
				</ul>
				<h1>Auteurs</h1>
				<xsl:for-each select="//auteur">
					<xsl:sort select="nom" order="ascending" data-type="text"/>
					<div id="auteur">
					<h2 id="{@id}">
						<xsl:value-of select="nom"/>
					</h2>
					Age : <xsl:value-of select="age"/>
					<br/>
					Pays : <xsl:value-of select="pays"/>
					<br/>
					Sexe : <xsl:value-of select="sexe"/>
					<br/>
					Biographie : <xsl:value-of select="biographie"/>
					<br/>
					Recette(s) de l'auteur :
					<xsl:variable name="idAuteur" select="@id" />
					<ul>
						<xsl:for-each-group select="//recette" group-by="ref-auteur/@ref">
							<xsl:if test="current-group()/ref-auteur/@ref=$idAuteur">
								<xsl:for-each select="current-group()">
									<li>
										<a href="Recettes.html#{@id}">
											<xsl:value-of select="titre"/>
										</a>
									</li>
								</xsl:for-each>
							</xsl:if>
						</xsl:for-each-group>
					</ul>
					</div>
				</xsl:for-each>
			</body>
		</html>
		</xsl:result-document>
	</xsl:template>
	
</xsl:stylesheet>