## langage orienté objet

Contrairement au Bash ou au CMD, PowerShell est un langage orienté objet.  

ex: on recherche l'utilisateur local "Tom" en CMD et en PowerShell.  

<!--- inserer capture module 2 page 3 --->

La composition d'un objet PowerShell :  

- Un objet est défini par un ensemble de propriétés et de méthodes.  
- On peut comparer un objet PowerShell à un objet du quotidien.  
- Un feutre possède des propriétés et des méthodes.  

<!--- Inserer capture module 2 page 4 --->

### `Get-Service`

La commande   
```PowerShell
PS > Get-Service
```
renvoie un objet "service Windows".  

<!--- inserer capture module 2 page 5 --->

### `Get-Member`

La CMDLET  
```PowerShell
PS > Get-Member
```
est la commande qui permet de connaître :  

<!--- inserer capture module 2 page 6 --->

Elle s'utilise exclusivement à la suite d'une commande dont le verbe est `Get`.  
```Powershell
PS > Get-LocalUser | Get-Member
```
Le `PIPE` ou `|` est à ajouter aux deux commandes vues précedemment `Get-Command` et `Get-Help`.  
Ces trois commandes sont dites commandes **clés** pour pratiquer le langage PowerShell.  
```Powershell
PS > Get-Command | Get-Help | Get-Member
```
[rajouter les explications de la démo]

## Les Objets

### Propriétés

Les propriétés d'un objet PowerShell sont définies par le type d'objet.  
La valeur des propriétés peut être de différents types.  

<!--- inserer capture module 2 page 9 --->

### Propriété & Valeur

<!--- inserer capture module 2 page 10 --->

La propriété d'une valeur peut être modifiée avec le verbe `Set` en début de commande suivi du nom de l'objet.  
```Powershell
PS > Set-Service -Name wsearch -DisplayName "Service de recherche windows"
```
On effectue à nouveau la commande `PS > Get-Service -ServiceName wsearch`

<!--- inserer capture module 2 page 11 --->

[rajouter les explications de la démo]

### Méthodes

Les objets disposent également de méthodes parfois communes à plusieurs types d'objets.  
Contrairement aux propriétés, les méthodes effectuent des actions sur la totalité de l'objet ou sur la valeur d'une ou plusieurs propriétés d'un objet.  
<!--- inserer capture module 2 page 13 --->

Pour appliquer une méthode, on utilise la commande permettant d'obtenir un objet.  

<!--- inserer capture module 2 page 14 (1) --->

On encadre la commande avec des parenthèses afin d'appliquer la méthode.  
On ajoute la méthode précédée d'un point de concaténation, puis à la suite de la méthode on ajoute entre parenthèsela valeur nécessaire à la méthode.  
```Powershell
PS > (Get-Date).AddDays(*)
```
Ici la méthode `AddDays` ajoute un jour de plus à l'objet `System.DateTime` renvoyé par la commande `Get-Date`.  

<!--- inserer capture module 2 page 14 (2) --->

[rajouter les explications de la démo]