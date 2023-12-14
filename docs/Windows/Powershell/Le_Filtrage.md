# Le filtrage

## Basique

Permet d'affiner le *filtrage*, obtenu par le *pipeline* et la `cmdlet select`, afin de selectionner certines valeurs contenu dans des propriétés.
Pour cela la connaissance des **opérateurs de comparaisons** est nécessaire, il existe une section d'aide pour les découvrir et savoir comment les utiliser
`Get-help About_Comparison_Operators`

![tableau comparaison](./../../../../img/tableau%20comparaison.png)

Le **filtrage basique** ne permet de filtrer qu'une seule propriété via la cmdlet `Where-object` ou seulement `Where`

En reprenant l'exemple des cartes réseaux:

- Apres avoir fait un ``Get-Netadapter | select name,Status,Linkspeed``

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-netadapter | select name,status,linkspeed

name                          Status       LinkSpeed
----                          ------       ---------
VMware Network Adapter VMnet1 Up           100 Mbps
Connexion au réseau local 2   Disconnected 1 Gbps
VMware Network Adapter VMnet8 Up           100 Mbps
Wi-Fi                         Up           1.2 Gbps
Connexion réseau Bluetooth    Disconnected 3 Mbps
Ethernet                      Disconnected 0 bps
```

- Nous pouvons faire un ``Get-Netadapter | select name,Status,Linkspeed | Where Status -like Up``
la cmdlet `Where` vas permettre de selectionner la colonne `status` puis, ensuite, en lui affectant l'element de comparaison `like` on peut choisir le statut souhaité **UP** pour les éléments connecté (ou **Disconnected** pours les élements deconnectés)

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-netadapter | select name,status,linkspeed | where status -like UP

name                          Status LinkSpeed
----                          ------ ---------
VMware Network Adapter VMnet1 Up     100 Mbps
VMware Network Adapter VMnet8 Up     100 Mbps
Wi-Fi                         Up     1.2 Gbps

```

> A noter le rajout via le `|` d'une 3eme cmdlet **where** comme vue dans le module ***Pipeline***
>

## Avancés

Pour le filtrage avancé, l'utilisation de la meme `cmdlet **where**` est toujours requis mais celle-ci sera enrichi, etoffé par:

- l'ajout d'un script de filtrage `-FilterScript {}` dans la cmdlet **where-object**
- La possibilité d'utiliser la variable `$PSITEM` (ou `$`) pour plus de productivité
- `$_`contient tous les objets transmis à **Where-Object**

```Powershell
PS D:\Informatique\Mkdocs\cours-eni> get-netadapter | select name,status,linkspeed | where -filterscript {$_.status -like "up" -and $_.linkspeed -gt "100 Mbps"}

name                          Status LinkSpeed
----                          ------ ---------
VMware Network Adapter VMnet1 Up     100 Mbps
VMware Network Adapter VMnet8 Up     100 Mbps
```

>A noter le rajout de `FilterScript {}` afin de filtrer les resultats obtenus précedemment puis ajout des `$_.` pour lui specifier les elements dans lesquel il doit chercher.
