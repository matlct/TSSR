# Powershell

Powershell est le dernier shell de windows
powershell est un interpreteur de commande il permet de creer et lancer des scripts
il est orienté objet comme certain langage de dev.
Il s'appuie sur des bibliotheque .net Framework c'est bibliotheque permettent entre autre de creer des scirpts plus aou moins elbaoré ave des fenetre graphique.

1ere version nativement présente depuis winserveur 2008 fin 2006 mais on pouvait l'installer sur XP/Vista et serveur2003
Powershell est montée en version avec le temps, apportant des nouvelles commande, foncitonnalité, securité d'utilisation, amélioration.
Version 5 dans la vidéo (version 7 en réalite sur win11)
acces via la console powershell ou la console graphique ISE (integrated Scripting Environment) = console orienté scripting
Outils tiers pour manipuler powershell comme avec windows terminal (dispo sur mwindows store ou sur git), égalemetn avec Visual Studio Code.

Pour connaitre la version du powershell pris en charge sur le poste :

```Powershell
$PSVersionTable
(contient plusieurs informations dont celle de la version de PS)
```

Il est important de la connaitre car dans la plupart des cas les entreprises possede des parcs de machine heterogene ce qui implique une heterogeneité des OS, en gros une équipe de tech peut avori a gere des OS clients WIN10/WIN7 des OS serveur 2012R2/2016/2019 si vous elaboré un script depuis un poste Win10 vous etes en PS5.1, il est possible de le script ne fonctionne pas depuis un win serveur 2012 R2 ou un WIN7, le script a peut etre elaboré sur une version de powershell comportant des commandes n'existant pas sur une version ultérieur.
Autre informations utile dans la commande $PSVersionTable, il s'agit PSCompatibleVersion elle indique la retrocompatibilité fonctionne dans la console présente.

Les commandes Powershell...
s'appel des cmdlets

- elles sont intuitives ont peut les retrouver facilement par deduction et facilement comprendre leurs roles
  - elles sont toutes composé d'un verbe et d'un nom séparé par un "-"
  - Verbes les plus courant : Get, Set, remove, Add, New
  - les noms dependent du contexte d'utilisation : LocalUser, NetAdapter, Alias, Variable (ils depdnent de l'objet que l'on souhaite utiliser)
les cmdlets peuvent pocceder des alias (des surnoms) plus rapide a utiliser que les cmdlets elle memes
Get-Alias permet d'afficher les alias powershell
Get-Verbe affiche la liste des verbes que l'on peut utiliser dasn une cmdlets
New-LocalUser : permet de creer un nouvelle utilisateur local dans l'ordinateur

chaque cmdlets est concu pour remplir une tache specifique
elle ne sont pas sensible a la casse
elle comporte des parametre (obligatoires ou optionnels)...
...avec des arguments (aucun ou plusieurs)
Peuvent posseder des alias

```Powershell
Get-ChildItem -path c:\users

Get-ChildItem = cmdlets
-path = Parametre
c:\users = argument
```
