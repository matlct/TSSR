## Introduction

Comme abordé précédemment, le résultat d'éxécution de commandes peut être composé d'un ensemble objets.  
```Powershell
PS > Get-Service
```

Le nombre d'objets étant souvent élévé, il est important de pouvoir sélectionner et mettre en forme le résultat d'une commande.  
```Powershell
PS > Get-EventLog
```

L'utilisation de redirections au moyen de pipeline (caractère `|`) permet d'effectuer des commandes de triage, de mise en forme, de selection et également de conditionnerle résultat final.  

## Le pipe `|`

Le pipe `|` permet de passer un ou plusieurs objets à la commande qui suit.  
```Powershell
PS > Get-Service | Get-Member
```

le pipe `|` peut être utilisé à plusieurs reprises, tant que l'on dispose d'objets à traiter.  
```Powershell
PS > Get-EventLog -LogName "System" | Select-Object Name | Format-Table
```

Le pipe `|` utilise une variable réservée qui est $PSItem. Cela permet de cibler une propriété d'un objet.  
```Powershell
PS > Get-Process | Select Name,Id | Where { $PSItem.Id-gt 1500 -and $PSItem.ID-lt 2000 }
```
Les 2 `Id` sont des propriétés.  

