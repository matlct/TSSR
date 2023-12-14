# CLI

on utilise habituellement la GUI pour administrer windows.
on peut également interargir avec le systeme via la CLI (command Lines interface)
il existe 2 type de shell nativement avec win.
Le shell cmd.exe
le shell powershell

Cmd.exe est historique il s'agit de l'evolution du shell present avec ms-dos, on l'utilisepour configurer le systeme de facon plus detaille, pour executer certaine action que le GUI ne propose ou ne permet pas.
ce shell possede ces propre commande (commande interne) on peut egalement lancer des programmes externe qui sont des programmes windows. on peut accumuler des commandes dans un fichier txt et on peut lui demander de lire ce fichier txt et d'enchainer les commandes qui sont a linterieur c'est un script.
Principe d'utilisation de la ligne de commande:
avec la ligne de commande cmd on a d'abord le prompt, il indique ou l'on se situe dans le systeme. c:\windows\system32>
A la suite du prompt on a la main pour taper un mot dans l'ex "help" qui est une commande seule, en effet une commande peut ete suivi d'un parametre afin de preciser la commande c:\windows\system32>help shutdown
une commande peut etre auss suivi d'une option, en generale elle sont remarquable car defini par une lettre precede d'un "/" et parfois les options peuvent posseder leurs propre parametre.
Tous les elements (commande/option/argument) sont separé par un espace.

Pour bien demarrer avec la ligne de commande :
Le premier mot est toujours une commande, sinon le systeme remonte une erreur
chaque mot est separe par un espace, l'espace est important il est considere comme un caractere speciale par le systeme, il permet de separer les commandes des parametre des options etc. si on veut banaliser l'espace en caractere non speciale par le systeme il faut le proteger par des cotes ex: 'Mes Documents'
en dernier, une commande a pour but de donner un ordre au syst d'exploit, l'OS va utiliser les ressources du matériel pour repondre a cette ordre et donner un resultat, par defaut le résultat sera afficher a l'ecran, mais on peut demander au systeme de donner les resulats dans un fichier grace aux chevrons > et/ou doubles chevrons >>
ex: help shutdown>aide.txt enregistre l'aide detaille de la commande shutdown dans le fichier aide.txt au lieu de l'afficher à l'écran

## la syntaxe de l'aide

Si une commande donne un ordre, quelle ordre donne telle, quelles sont se parametre , ses options, comment utilise ton une commande.
Pour cela il suffit de lire l'aide de la commande.
Si la syntaxe est mauvaise le systeme ne comprend pas l'ordre et il remonte une erreur.
Comprendre la syntaxe d'une commande :

- Txt sans crochet ou accolades = element obligatoire que vous devez taper ou choisir une valeur
- [txt entre crochet] = element facultatif
- {txt en accolade} = Choisir un elements parmi ceux présents
- Barre verticale ou "pipeline" | = Séparateur d'elements
- Points de suspension ... = Elements qui peuvent etre repetes et utilisé plusieurs fois

Exemple:

```cmd
c:\windows\system32> help copy  
COPY [/D] [/V] [/N ] [/Y | /-Y] [/Z] [/L] [/A | /B] source  
[/A | /B] [+source [/A | /B] [+ ...]] [cible [/A | /B]]  
```

- **copy** et **source** obligatoire car sans crochet ni accolade
- Possibilité de choisir 0,1 ou des options seules (/D /N /A ou /B car il y a un |) facultative dasn la syntaxe car entouré de "[]", impossible de choisir /A & /B car separé par "|"
- Possibilité de choisir plusieurs sources car presence de "..."

## Commande de base CLI

cls = permet d'effacer l'ecran du CLI

app interne notepad = lance le bloc note
timedate.cpl = lance la gestion de l'heure et de la date
diskmgmt.msc = gestionnaire de disque

commande interne
/help recense toutes les commandes interne au shell.