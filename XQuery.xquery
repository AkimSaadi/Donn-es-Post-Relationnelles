xquery version "1.0" encoding "utf-8";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method         "xhtml";
declare option output:doctype-public "-//W3C//DTD XHTML 1.0 Transitional//EN";
declare option output:doctype-system "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd";
declare option output:indent "yes";

let $source_doc := doc("Recettes.xml")
return 
<html lang="fr">
	<head>
		<title>
			Liste des auteurs via XQuery
		</title>
	</head>
	<body xmlns="">{
		for $a in $source_doc//Recettes/auteur
		let $id := $a/@id
		order by $a/nom ascending		
		return( 
			data($a/nom), 
			<ul>{
				for $r in $source_doc//Recettes/recette
				where data($r/ref-auteur/@ref) eq $id
				return 
					<li>{data($r/titre),'Sous Categorie : ',
					for $sc in $source_doc//Recettes/sousCategoriePlat
					where $sc/@id eq $r/ref-sous-categorie/@ref
					return
						 data($sc/nom)
					}</li>
			}</ul>
		)
	}</body>
</html>