# Le Pipeline

il permet de transmettre le résultat de la sortie standard d'une `cmdlets` dans l'entrée standard d'une autre `cmdlets`
Ainsi le resultat de la `cmdlets 1` sera directement traité par la `cmdlets 2`.
Cela peut, eventuellement, permettre de chainer 1,2,3 ... cmdlets à la suite.

<!-- inserer image support cours pipeline-->
![pipeline](./../../../../img/pipeline_powershell.excalidraw.svg)

Pour reprendre l'exemple du dessin en faisant un
`Get-NetAdapter`voici la liste que nous renvoi le shell

![get-netadapter](./../../../../img/get-netadapter.png)

Maintenant si je ne veux que les noms, status & vitesse des cartes reseaux je vais utiliser le `|` pour chainer ma 2eme `cmdlet = select` afin de trier mes resultats.

![get-netadapter_select](./../../../../img/get-netadapter_select.png)
