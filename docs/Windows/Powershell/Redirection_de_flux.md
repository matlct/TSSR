# Redirection de flux

<!-- inserer image de support de cours schéma cmdlets-->
Une Cmdlets donne un ordre au materiel dans le but d'obtenir un resultat,
Elle recoit cet ordre par l'entrée standard ou `Stdin ou 0` par défaut l'ordre est donnée par une entrée (le clavier)

une fois le résukltat obtenu il est renvoyé vers la sortie standard (ou Stdout = 1)
par défaut le résultat est affiché a l'ecran

Parfois l'ordre donné ne peut renvoyer de résultat, si celui-ni n'est pas executable a cause d'une cmdlets inconnu du systeme, une syntaxe incorrect, manque de privilege

le systeme renvoi 1 ou des erreurs (ou Stdr = 2) par défaut les erreurs sont egalement remontée a l'ecran

C'est mecanisme sont appele les **flux standard**

## Rediriger ces flux

Rediriger des flux dans un fichier, au lieu de l'ecran, peut avoir un interet pour conserver les résultats dans le temps afin de les retraiter, examiner des erreurs ou analyser et creer des rapports de script.

<!--inserer tableau support de cours redirection flux -->
![E/S Powershell](./../../../../img/I_O_powershell.png)

Les flux d'une commande peuvent être redirigés ou fusionnés à votre convenance. Pour cela, il suffit d'utiliser le caractère `>` pour la redirection avec ou sans l'esperluette `&` pour une fusion :

`>` Redirection vers un fichier (création/Ecrasement)
> Get-localUser > c:\temp\localUserList.txt vas envoyé directement le résultat dans le fichier sans l'afficher à l'ecran

`>>` Redirection vers un fichier (mode ajout a la fin d'un fichier, creation si fichier inexistant)
`>&` Fusion de flux
`*>` Redirige tous les flux (vers un fichier par exemple)

- Exemples :

2> Redirige les avertissements vers un fichier
2>&1 Fusionne les avertissements avec la sortie standard
