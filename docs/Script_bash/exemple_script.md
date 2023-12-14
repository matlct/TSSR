## Script filtrage

### Script de filtrage de fichier, par l'extension dans un répertoire spécifié.  

!!! abstract ""
    === "Script"
        ```sh
        #!/bin/bash  
        
        rep=$1                                              # Argument 1 à définir au lancement du script  
        extension=$2                                        # Argument 2 à définir au lancement du script  
        
        echo "Répertoire de travail: $rep"                  # Affiche la phrase et définit la *variable = $rep*  
        echo "Fichiers pouvant être traités: "  
        ls $rep/*$extension                                 # Effectue une recherche sur le répertoire et sur l'extension mentionné

        read -p "Quel fichier voulez-vous traiter ?" fic    # La commande read permet de créer la variable fic
        fic=$rep/$fic$extension

        nblign=$(wc -l < $fic)
        debut=$(head -n 2 $fic)
        fin=$(tail -n 2 $fic)

        echo "Caractéristiques de $fic"
        echo "Nombre de lignes du fichier : $nblign"
        echo "Début du fichier :"
        echo "$debut"
        echo "Fin du Fichier :"
        echo "$fin"
        ```
    === "Résultat"
        ```sh
        ./script.sh /etc .conf      # Les Arguments sont mentionnés ici $1= /etc et $2= .conf
        Répertoire de travail: /etc
        Fichiers pouvant être traités:  
        /etc/adduser.conf       /etc/host.conf       /etc/reportbug.conf
        [...]
        Quel fichier voulez-vous traiter ? adduser
        Caractéristiques de /etc/adduser.conf
        Nombre de lignes du fichier : 97
        Début du fichier : 
        # /etc/adduser.conf: `adduser' configuration.
        # See adduser(8) and adduser.conf(5) for full documentation.
        Fin du fichier :
        #ADD_EXTRA_GROUPS=0
        ```

### Script de filtrage de fichier, par l'extension dans le répertoire courant.  

!!! abstract ""
    === "Script"
        ```sh
        #!/bin/bash

        # Récupération du répertoire courant
        rep=$(pwd)
        extension=$1

        read -p "Quelle extension voulez-vous utilisez ?" extension
        # Définition de l'extension des fichiers à traiter
        extension=$1

        # Affichage du répertoire de travail
        echo "Répertoire de travail : $rep"

        # Affichage des fichiers pouvant être traités
        echo "Fichiers pouvant être traités :"
        ls $rep/*$extension

        # Demande du nom du fichier à traiter
        read -p "Quel fichier voulez-vous traiter ? " fic
        fic=$fic.$extension

        # Comptage du nombre de lignes
        nblign=$(wc -l < $fic)

        # Extraction des 2 premières et 2 dernières lignes
        debut=$(head -n 2 $fic)
        fin=$(tail -n 2 $fic)

        # Affichage des caractéristiques du fichier
        echo "CARACTERISTIQUES de $fic"
        echo "Nombre de lignes du fichier : $nblign"
        echo "Début du fichier :"
        echo "$debut"
        ```
    === "Résultat"
        ```sh
        $ ./script.sh
        Quelle extension voulez-vous utilisez ?txt
        Répertoire de travail : /d
        Fichiers pouvant être traités :
        /d/test.txt  /d/test2.txt
        Quel fichier voulez-vous traiter ? test
        CARACTERISTIQUES de test.txt
        Nombre de lignes du fichier : 9
        Début du fichier :
        Bonjour
        Fin du fichier :
        de Scripting Bash
        ```

## Script verification utilisateurs


