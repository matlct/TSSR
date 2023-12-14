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
