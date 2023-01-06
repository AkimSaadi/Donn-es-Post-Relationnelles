<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" name="html" encoding="iso-8859-1" indent="yes"/>
		<xsl:template name="fiche-recette">
		<xsl:result-document format="html" encoding="utf-8" href="Recettes.html">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="lang">fr</xsl:attribute>
			<head>
				<title>Recettes</title>
				<link rel="stylesheet" href="cssRecette.css" media="screen" type="text/css" />
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
					Liste des recettes
				</h1>
				<ul>
				<xsl:attribute name="id">liste</xsl:attribute>
					<xsl:for-each select="//recette">
						<xsl:sort select="datePublication" order="descending" data-type="text"/>
						<li><a href="#{@id}"><xsl:value-of select="titre"/></a></li>
					</xsl:for-each>
				</ul>
				<h1>Recettes</h1>
				<xsl:for-each select="//recette">
					<xsl:sort select="datePublication" order="descending" data-type="text"/>
					<div id="recette">
					<h2 id="{@id}">
						<xsl:value-of select="titre"/>
					</h2>	
				Résume : <xsl:value-of select="resumé"/>
					<br/>
					<img src="{photo}" alt="photo de {titre}" width="400" height="400"> </img>
					<br/>
				Date de Publication : <xsl:value-of select="datePublication"/>
					<br/>
				Difficulté : <xsl:value-of select="difficulté"/>
					<br/>
				Ingrédient(s) :
					<ul>
						<xsl:for-each select="ingredients/ingredientRecette">
							<xsl:variable name="idRecette" select="ref"/>
							<li>
								<a href="Ingredients.html#{ref}">
									<xsl:value-of select="//ingredient[@id=$idRecette]/nom"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="quantite"/>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				Nombre de personne : <xsl:value-of select="nombrePersonne"/>
					<br/>
				Temps de préparation : <xsl:value-of select="tempsPréparation"/>
					<br/>
				Temps de cuisson : <xsl:value-of select="tempsCuisson"/>
					<br/>
				Temps de repos : <xsl:value-of select="tempsRepos"/>
					<br/>
				Description : <xsl:copy-of select="description"/><br/>
				Note : <xsl:value-of select="note"/>
					<br/>
					<xsl:variable name="refauteur" select="ref-auteur/@ref"/>
				Auteur : <a href="Auteurs.html#{ref-auteur/@ref}">
						<xsl:value-of select="//auteur[@id=$refauteur]/nom"/>
					</a> <br/>
					<xsl:variable name="refsouscat" select="ref-sous-categorie/@ref"/>
				Sous Catégorie : <a href="Categories.html#{ref-sous-categorie/@ref}">
						<xsl:value-of select="//sousCategoriePlat[@id=$refsouscat]/nom"/>
					</a>
				</div>
				</xsl:for-each>
			</body>
		</html>
		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>