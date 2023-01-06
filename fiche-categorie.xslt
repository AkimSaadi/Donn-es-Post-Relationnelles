<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" name="html" encoding="iso-8859-1" indent="yes"/>
	<xsl:template name="fiche-categorie">
		<xsl:result-document format="html" encoding="utf-8" href="Categories.html">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="lang">fr</xsl:attribute>
			<head>
				<title>Categories et Sous Categories</title>
				<link rel="stylesheet" href="cssCategorie.css" media="screen" type="text/css" />
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
					Liste des catégories &amp; sous catégories
				</h1>
				<ul>
				<xsl:attribute name="id">liste</xsl:attribute>
					<xsl:for-each select="//categoriePlat">
						<li>
							<a href="#{@id}"><xsl:value-of select="nom"/></a>
							<xsl:variable name="idcate" select="@id" />
							<xsl:if test="count(//sousCategoriePlat[ref-categorie/@ref=$idcate]) gt 0">
							<ul>
								<xsl:variable name="idCategorie" select="@id" />
								<xsl:for-each-group select="//sousCategoriePlat" group-by="ref-categorie/@ref">
									<xsl:if test="current-group()/ref-categorie/@ref=$idCategorie">
										<xsl:for-each select="current-group()">
											<li>
												<a href="#{@id}">
													<xsl:value-of select="nom"/>
												</a>
											</li>
										</xsl:for-each>
									</xsl:if>
								</xsl:for-each-group>
							</ul>
							</xsl:if>
						</li>
					</xsl:for-each>
				</ul>
				<h1>Categories</h1>
					<xsl:for-each select="//categoriePlat">
						<div id="categorie">
						<h2 id="{@id}">
							<xsl:value-of select="nom"/>
						</h2>	
					Description : <xsl:copy-of select="description/*"/>
						</div>
						<br/>
					</xsl:for-each>
				<h1>Sous Categories</h1>
					<xsl:for-each select="//sousCategoriePlat">
						<div id="souscategorie">
						<h2 id="{@id}"><xsl:value-of select="nom"/>
						</h2>
						Description : <xsl:copy-of select="description/*"/>
						<xsl:variable name="refcategorie" select="ref-categorie/@ref" />
						Categorie : <a href="#{ref-categorie/@ref}"><xsl:value-of select="//categoriePlat[@id=$refcategorie]/nom"/></a> <br/>
						Nombre de recette appartenant à cette sous categorie : <xsl:value-of select="nombreRecette"/> <br/>
						<xsl:if test="nombreRecette &gt; 0 ">
							Liste des recettes appartenant à cette sous categorie :
							<xsl:variable name="idSousCat" select="@id" />
							<ul>
								<xsl:for-each select="//recette">
								<xsl:if test="ref-sous-categorie/@ref=$idSousCat">
									<li><a href="Recettes.html#{@id} "><xsl:value-of select="titre"/></a></li>
								</xsl:if>
								</xsl:for-each>
							</ul>
						</xsl:if>
						</div>
					</xsl:for-each>
			</body>
		</html>
		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>