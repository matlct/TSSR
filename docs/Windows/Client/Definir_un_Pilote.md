# Définition d'un pilotes (Drivers)

Prise en charge d'un périphérique par l'OS

- Prise en charge à chaud = Plug & play via USb ou connectique sans fils
- nécessite un redémarrage (plus rare) = non Plug & Play (périphérique interne connecté a un port Pci par ex)

Mode de prise en charge :

- detection automatique Utilisation directement apres le branchement
- detection manuel = recherche et installation manuel

Affichage et paramétrage:
Ils seront ensuite paramétrable via l'outil **Gestionnaire de périphérique** (ou win+R > *Devmgmt.msc*)

## Gestionnaire de périphérique

La console affiche les périph pris en charge et non pris en charge, possibilité de metre a jour les pilotes, desactiver, desinstaller ou editer les propriétes de l'appareil.

Via le menu des propriétés possibilité de verifier sa version, restaurer une version plus ancienne du pilote ou afficher le detail des informations.

>information intéressante dans les détails du périph ! son n° d'identification

- Composé d'un Id de fabricant `VEN_ Vendor Id`
- Id du matériel chez ce fabricant `DEV_ DEVice ID`
  - Semblable à un N° de série ou une Adresse MAC.
A l'aide de ses Id (`VEN_`&`DEV_`)il y a la possibilité de retrouver, sur internet (pcilookup.com), le pilote d'un périph non pris en charge.  

## Windows et les pilotes

il s'agit d'un manuel d'utilisation pour l'OS, via les pilotes (drivers) windows utilise le périph dasn les meilleurs conditions
selon l'architecture de la machine il existe des pilotes en 32 & 64 bits.

les pilotes *signés* sont privilégiés par MicroSoft, les signatures des pilotes sont symbolisé par un certif de conformité fourni avec le pilote, qui permettent de garantir la stabilité du systeme

>depuis la mise en place des pilotes signés ont réduit l'apparition des Blue Screen.
celui-ci etait due majoritairement a des pilotes mal construit ou a des produits defaillant

## fichiers d'un pilotes

les drivers sont définis par un ensemble ded fichiers :

- *.inf : définition du pilote au format texte
- *.sys : pilote compilé et directement utilisable par le systeme
- *.cat : signature du pilote
- *.exe,*.dll,*.xml...: fichiers complémentaire selon les besoins

la prise en charge du périph peut ce faire directement depuis le *.inf

- directement sur le fichier (clic droit **installer**)
- a partir d'un assistant d'installation (*setup.exe*) et de gestion tiers du périph (ex: mise a jour)

Une fois installé, le pilote est mémorisé par le systeme:
    - prise en charge auto a l'allumage ou au branchement du périph
    - cela permet sa réinstallation automatique
      - chaque pilote installé manuellement genere un fichier oemXX.inf
    - Tous les fichiers *.inf, de tous les périph sont disponible dans c:\windows\INF
    - tous les autres fichiers sont disponible dans

```cmd
      - c:\windows\system32
        - *.sys c:\windows\system32\drivers
        - c:\windows\sysWOW64 (system windows 32bits on Windows 64bits)
```

## Magasin de pilotes Windows

Ensemble de pilotes dispo des l'installation du systeme

- appellé egalement pilotes generique
- nb de pilotes pré-installé varie selon les version de windows et le nb de maj windows update effectué.
pratique ce magasin permet au system de trouver automatiquement qui vous permet de faire fonctionner un périph sans avoir besoin d'installer le pilote du fabricant. (intéressant quand un pilote est introuvable sur internet)

cela peut etre limitant parfois car le systeme ne peut pas utiliser toutes les fonct du periph, mais uniquemetn les foncti de base.
pour avoir toutes les fonctio il faudra obligatoirement passer par le pilote contructeur/fabricant.

Ce magasin stock tous les pilotes dans le dossier c:\windows\system32\driverstore
gestion du magasin en ligne de commande via `pnputil`

En complément:

la commande `msinfo32` permet d'afficher une fenetre graphique comportant des informations detaillé sur

- le materiel
- les periph
- le systeme

la commande `driverquery`: outil cmd pour lister les pilotes installés
    - `driverquery /SI` pour lister les pilotes signés

la commande `pnputil`: gestion du magasin de pilotes windows (ajout,suppresion, information)
    - `pnputil /enum-drivers` pour lister les pilotes tiers (oemXX.inf)
    - `pnputil /add-driver pilote.inf` pour ajouter un pilote au magasin
