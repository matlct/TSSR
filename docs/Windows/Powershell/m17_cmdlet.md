
<!--- inserer capture cours liste cmdlet module 1 page 9 --->

# Les CmdLet

A la différence du système de commande CMD PowerShell utilisent des cmdlets.  
les cmdlets sont des commandes qui vont être constituées de 2 éléments :  

- un verbe d'action
- un nom  

La constitution d'une cmdlet  
<!--- inserer une capture d'une cmdlet ou de sa constitution --->

- le verbe (ex: GET)  
- le "-" qui va agir comme le lien entre le verbe et le nom  
- le nom qui va indiquer la fonctionnalité, l'objet, la commande ce sur quoi le verbe va agir.  

Les cmdlets sont toujours utilisées au singulier.  
Les verbes d'action seront toujours déterminés par les modules présents dans la console powershell.  

Les cmdlets sont parlantes, on se rend a la lecture du résultat attendu.  
En exemple, "Get-volume" :  

- le verbe "Get" va permettre d'obtenir la liste des volumes disponibles sur le système d'exploitation.  

Chaque commande PowerShell va également disposer de paramètres nécessaires au bon fonctionnement de la commande. Une commande peut disposer de plusieurs paramètres.  

Chaque paramètres sera indiquée avec un "-".  
La cmdlets "Get-LocalUser", par exemple, va nous permettre d'obtenir la liste des utilisateurs locaux.  
Si on souhaite obtenir un utilisateur particulier, Il faudra utiliser le paramètre "-name" à laquelle on va fournir une valeur (le nom de l'utilisateur).  

Cette valeur sera déclarée comme un <u>argument</u> et permettra à la cmdlet de n'agir que sur cette valeur.  

!!! note "Exemple de cmdlet PowerShell"
    === "Get-LocalUser"
        ```powershell
        Get-LocalUser
        Name               Enabled Description
        ----               ------- -----------
        Administrateur     False   Compte d’utilisateur d’administration
        DefaultAccount     False   Compte utilisateur géré par le système.
        Invité             False   Compte d’utilisateur invité
        ```
    === "Get-localUser -name"
        ```Powershell
        get-localUser -name Math
        Name Enabled Description
        ---- ------- -----------
        Math True
        ```

### `Get-Command`

`Get-Command` permet de rechercher et d'afficher les commandes disponibles.  
La recherche se fait sur le paramètre `-Name`.  

L'utilisation du caractère `*` permet de substituer une chaîne de caractères.  

<!--- capture d'écran module 1 page 11 --->

`Get-command` permet également d'effectuer uen recherche sur le paramètre `-Verb`.  

<!--- capture d'écran module 1 page 12 --->

### `Get-Help`

Elle permet de comprendre comment utiliser la commande trouvée via `Get-Command`.  
Toutes Cmdlet comporte un manuel. Celui-ci est disponible avec la commande `Get-Help` suivi du paramètre `-Name "la Cmdlet concernée"`.  

L'aide de la commande est affiché dans la console.  
Nous pouvons utiliser des paramètres supplémentaires afin d'améliorer les informations obtenues.  

L'aide des commandes est réparties en catégories. Le paramètres `-Full` permet d'afficher toutes les catégories disponibles dans l'aide d'une commande.  

On obtient une aide complète plus détaillée avec des exemples d'utilisation de commande.  

Le paramètre `-Online` permet de suivre le lien fourni dans l'aide et de l'ouvrir dans un navigateur web. L'aide en ligne fournit la version la plus à jour avec des liens vers des commandes annexes.  

Le paramètre `-Examples` permet d'afficher uniquement les exemples d'utilisation de la commande.  

Pour faciliter la lecture de l'aide, PowerShell met à disposition une fenêtre avec un champ de recherche.  
Cela permet de filtrer les catégories, copier-coller des exemples, etc.  

### Update-Help

Il est possible de mettre à jour l'ensemble des fichiers d'aide avec la commande :  

```Powershell
PS > Update-Help
```

Sans paramètres, cette commande va tenter de chercher sur le web les mises à jour de l'aide en passant par le service Windows Update.  
Dans le cas où le service serait inaccessible, il est possible d'indiquer une source locale contenant les fichiers d'aide.  

```Powershell
PS > Update-Help -SourcePath D:\PowerShell
```

Il est également possible de choisir un langage.  

```Powershell
PS > Update-Help -SourcePath D:\powerShell-UICulture En-US
```

### La commande de Protection

L'éxécution de script est par défaut soumise à une forte restriction.  
Le niveau de confiance requis pour l'éxécution est modifiable :  

<!--- capture d'écran module 1 page 18 --->

### Les modules

Chaque cmdlet provient d'un module PowerShell.  
Les modules PowerShell sont des fichiers portant l'extension .PSM1.  
La commande `Get-Module` permet de voir les modules actuellement disponibles dans PowerShell.  

#### Les modules - Ajout

Après la récupération d'un fichier PSM1 pour connaître l'emplacement disponible, il faut saisir la commande :  
```Powershell
PS> $env:PsModulePath
```

Après la copie du fichier dans l'emplacement, on importe le module dans la console :  
```Powershell
PS > Import-Module -Name " Le nom du dossier contenant le module "
```

Puis on vérifie l'importation :  
```Powershell
PS > Get-Command -module " Le nom du module "
```

## La personnalisation de la console

Il est possible de modifier les propriétés de la console PowerShell en faisant un clic droit sur le bandeau puis en cliquant sur propriétés.  

La console se personnalise par le choix d'une police de la taille des caractères ainsi que des couleurs de caractères.  

Il est également possible de créer un profil personnalisé en saisissant la commande :  

```Powershell
PS > New-Item -Path $Profile -Type File -Force
```

Cette commande écrit dans le dossier Documents de l'utilisateur actuel un fichier PS1 qui peut contenir des commandes qui seront exécutées à l'ouverture de la console PowerShell.  

