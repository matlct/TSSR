# Cmdlets de Base

PS est un langage d'administration orientée objets...
unobjet PS n'est pas nouvelle et viens du dev (le PHP ou le Csharp)
un objet PS est un élément du systeme que l'on peut manipuler, configurer (ex: une carte réseau, un DD, un utilisateur, un fichier etc.)
chacun de ces objets possede des propriétés/des caractéristiques et des methodes/des actions que l'on peut mener sur ces objets
comprendre la notion d'objets. comparons un objet PS avec un objet de tous les jours
l'objet : monballon
un ballon possedde des caractéristiques (propriété en PS):

- une forme (sphérique, ovale..)
- des dimensions
- une masse
- ...
des actions peuvent etre realisé sur ce ballon (des méthodes en PS):
- le lancer
- le gonfler
- ...

comment afficher les caract. de l'objet "monballon":
nous parlons de collection d'objet car nous pouvons posseder plusieurs ballon
(tout comme un ordinateur oeut posseder plusieurs utilisateur, plusieurs fichiers, ou plusieeurs carte reseau)

si je fais :
Get-monballon

- Afficher certaines propriétés de l'objet, les propriétés que le systeme considere comme majeur
- toutes les propriétés ne sont pas affiché, elles existent mais cachées pour faciliter la lecture à l'écran

Get-monballon | select*

- affiche toutes les propriétés de l'objet et lerus valeurs associées (* represente toutes les caract de l'objet)

Get-monballon | select [diametre,forme,couleur]

- n'affiche seulement que les propriétés demandées et leurs valeurs associées

(get-monballon).description

- affiche la propriété *description* de l'objet et sa valeur
- equivaut a Get-monballon | select description

il existe des cmdletsqui permettent d'interagir avec les objets d'affich les prop. de modifier, de creer, dans supp
pour cela il existe une cmdlets
[get-command](sans parametre niargument) qui permet d'afficher toutes les cmdlets/les alias/les fonctions.

il y a la possibilité de filtrer cette affichage via:
[Get-command get-*]

- n'affiche que les cmdlets commencant par le verbe get
- `*` represente n'importe quelle chaine de caraact donc n'importe quel nom

[get-command *printer*]

- affiche toutes les commandes contenant la chaine de caract printer
- permet d'intéragir avec les imprimantes (donc l'objet printer)

[get-command new-*user*]

- affiche tts les cmdlets commencant par new ET contenant la chaine de caract user

une fois avoir trouvé la bonne commande il faudra utliser l'aide pour savoir comment bien l'utiliser

## Interargir avec un objet powershell

mecanisme d'utilisation des cmdlets, interactive et intuitive
comparaison avec un objet du monde reel :

je fais la collection de ballon en tout genre, collection que je souhaite faire evoluer.
je me rend compte que la description de mon ballon de basket est fausse, je dois donc la modifier :

- set-monballon -nom "basket" -description "ballon de basket"
je veux ajouter un nouveau ballon de rugby blanc
- new-monballon -nom "rugby" -forme "ovale" -couleur "blanc" -description "ballon de rugby"
je veux supp un ballon de football
- remove-monballon -nom "Football"

Il faut réfléchir de la meme maniere avec les objets PS (utilisateur, imprimante) il faut travailler par etapes

- chercher la bonne cmdlets via get-commands
- en selectionnant la commands adequate en affichant l'aide
- on peut tester et affiner la commandes pour avoir le resultat voulu
