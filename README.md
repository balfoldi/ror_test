# README

Cette application permet d'accéder à une liste d'utilisateurs (User) et leurs publications (Post).

L'exercice consiste à ajouter la possibilité de commenter une publication.

Ce qui est attendu :

* Créer le modèle de commentaire, Comment, et ses relations

* Revoir la modélisation du Like pour qu'il soit possible de liker le commentaire et la publication sans ajouter de nouveau modèle 

* Ajouter une API permettant d'ajouter un commentaire à une publication
 
* Ajouter une API retournant les commentaires d'une publication

* Ajouter une API permettant de liker un commentaire

* Dans la sérialisation d'un commentaire, ajouter une variable permettant de savoir si l'utilisateur qui requête la donnée a liké ou non le commentaire

* Dans la sérialisation d'un commentaire, ne pas retourner la liste des likes mais le total de likes du commentaire (un plus est de ne pas avoir à recalculer le total de likes à chaque requête) 

Un plus sera de proposer un design pattern pour gérer les controllers (et ce même si le code des controllers reste simple, l'idée est de se projeter dans une implémentation)
