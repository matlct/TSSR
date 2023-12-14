# Découverte de GLPI

## Présentation

**GLPI** : **G**estion **L**ibre de **P**arc **I**nformatique  
**ITSM**: **I**nformation **T**echnology **S**ervice **M**anagement confirme avec ITIL  
LOgiciel libre sous licence GPL 100% libre  
Logiciel complet pour la gestion de parc et centre de services grâce a la partie ticketing et SLA  
Plusieurs langues et plug-ins disponibles  
Installation possible sous Windows et Linux  
Pour les petits comme les grands systèmes d'information  
Administrables depuis une page web, installable sur du IIS ou apache  

## Fonctionnalités gestion de parc

![fonctionnalités_GLPI](./img/../../img/ITIL/fonctionnalités_GLPI.png)

## Les interfaces

<u>Interface simplifiée</u>  

- Interface la plus restrictive
- Destinée aux utilisateurs finaux
- Permet de créer un ticket, suivre ses tickets, accéder aux réservations et à la FAQ

<u>Interface standard</u>  

- Interface principale de GLPI
- Tous les modules y sont disponibles en fonction des droits de chacun
- Utilisée pour les tâches techniciens, d'administration et de configuration
- 3 vues de travail:
  - personnelle
  - groupe
  - globale

## Recherche rapide

Permet d'effectuer une recherche uniquement sur les champs affichés  
Etendue de la recherche aux champs affichés par défaut de tous les éléments d'inventaire  
Utilisation possible des caractères suivants (REGEX):  

- "^" pour symboliser le début du champ
- "$" pour symboliser la fin du champ
- "NULL" pour rechercher les champs vides
- Utilisation conjointe de "^" et "$" pour la valeur exacte d'un champ

## Gestion de parc

<u>Menu Parc</u>  

- Affichage par défaut des ordinateurs
- Possibilité de personnaliser les colonnes affichées
- Menu de recherche avancée
- Export possible des données sous différents formats
- Sélection du nombre d'éléments à afficher par page
- Navigation entre les pages
- Affichage possible de la corbeille

![gestion de parc GLPI](./img/ITIL/../../../img/ITIL/1_gestion_parc_GLPI.png)

<u>Recherche basique multicritères</u>  

- Possibilité de recherche combinant plusieurs critères
- Combinaison possible de critères à l'aide d'opérateurs logiques
- Opérateurs logiques disponibles: ET/OU - ET PAS/OU PAS
- S'applique à un grand nombre de paramètres de l'objet concerné
- Plusieurs critères de recherches selon le paramètre choisi
  - Contient-Est-N'est pas-Sous-Pas sous-Avant-Après,etc.
- Critères globaux de recherche possibles

![gestion de parc recherche GLPI](./img/ITIL/../../../img/ITIL/2_gestion_parc_GLPI.png)

<u>Recherche avancée</u>  

- Possibilité d'utiliser des caractères spéciaux pour les recherches
- **NULL**: s'assurer qu'un champ est vide
- **<Nb ou >Nb**: utilisé dans le cas des dates, prend un nombre de mois
- **^**: tester le début d'un champ
- **$**: tester la fin d'un champ
- **^$**: tester une valeur exacte pour un champ
- **Année-Mois-Jours**: tester un champ date

<u>Recherche sauvegardée</u>  

- POssibilité de sauvegarder ses recherches
- Création d'une recherche sauvegardée
  - Un nom
  - Une visibilité/portée
  - Entité de rattachement avec ou sans récursivité
  - Comptage
- Accès à ses recherches

<u>Modification massive</u>  

- Pour effectuer une modification sur un ensemble d'éléments
- Utilisé conjointement aux recherches avancées
- Généralement appliquée sur tous les éléments retournés d'une recherche
- Plusieurs actions possible

<u>Fiche élément</u>  

- Accessible en cliquant sur un élément
- Contient toutes les informations de l'élément
- Menu de navigation vertical sur la gauche
- Certains onglets communs à tous les éléments
- Possibilité d'afficher tous les onglets sur la même page
- Navigation possible entre les fiches des éléments de la page courante

![fiche élément GLPI](./img/../../img/ITIL/3_gestion_parc_GLPI.png)