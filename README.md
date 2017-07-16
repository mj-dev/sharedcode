Document texte d'explications
-----------------------------

GARCIA Victor, JONCHERAY Maxence, MALDAT Cyriaque, BARNY Steven

> *Décrire les fonctionnalités développées pour visualiser le travail effectué*

- Création et rédaction d'article via un éditeur dédié (wysiwyg)
- Publication de commentaire restreint aux utilisateurs inscrits
- Espace utilisateur, qui permet de visualiser ses articles publiés
- Listes complètes des articles, mais aussi triées par catégories
- Liste des trois derniers articles publiés sur la homepage
- Espace administration qui permet de gérer les articles, les utilisateurs, les commentaires, les médias, les catégories
- Mise en place d'un avatar pour les comptes admin et utilisateurs
- Système de filtres dans l'espace pour les commentaires et articles


> *Indiquer les éventuelles actions manuelles à effectuer pour démarrer la navigation (ex : création d'un utilisateur administrateur)*

Commande pour installer les gems :

	bundle install

Commande pour générer la base de données à partir du fichier seed :

	rake db:seed

Login et mot de passe des différents compte déjà crées :

 - root / root (compte admin)
 - user0/ user0
 - user1 / user1
 - user2 / user2 
 - user3 / user3

> *Indiquer les éventuels paquets pré-requis (ex : imagemagick, mysql, ...) : éviter autant que possible d'être dans un échec d'installation ou d'utilisation de gem à cause d'un paquet manquant non renseigné*

Prérequis : ImageMagic

    sudo apt-get install imagemagick -y
    

> *Expliquer les optimisations mises en place (ex : partials, helpers, absence de requêtes N+1, utilisation performante de l'API Ruby, ...)*

- Utilisation de la fonction includes pour supprimer les requêtes n + 1
- La fonction de récupération des trois derniers aricles à été placées dans une helper afin d'être utilisée n'importe où sur le site, à la façon d'un widget.
- Utilisation de simple_for pour simplifier la génération des formulaires.
- Utilisation des partials pour le header et le footer

> *Indiquer les scénarios de tests permettant de vérifier le bon fonctionnement de chaque section*

 1. Création d'un compte via le menu "se connecter" en haut à droite
 2. Rédaction d'un article via l'espace "mon compte" disponible dans le menu en haut à droite
 3. Publication d'un commentaire sur la page d'un article qui sont eux même disponibles dans l'onglet "liste des articles" dans le menu de l'application
 4. Pour accéder à l'espace d'administration il suffit de se connecter avec un compte admin (root) dans l'espace de connecter

> *Fonctionnalités non développées. Explication des solutions recherchées pour résoudre le problème *

 - Rendu visuel à améliorer, ajout de CSS et d'animation JS pour rendre le site plus dynamique  
 - Mise en valeur des avatars de compte dans l'espace commentaire 
 - Ajout d'un système de notation des articles
 - Pouvoir partager ses articles sur les réseaux sociaux (bouton share facebook & twitter)

Ces points n'ont pas été réalisés par manque de temps.
