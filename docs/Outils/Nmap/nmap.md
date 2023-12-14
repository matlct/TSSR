# NMAP 

<figure markdown=1>
![image](./NMAP-For-Port-Scanning.jpg){width=450}
</figure>

NMAP (Network MAPper) est un logiciel open-source utilisé pour la découverte des réseaux informatiques.  
Il est fréquemment utilisé pour :  

- La découverte d'hôtes actif sur un réseau (visible ou cachés, il détecte également les systèmes derrière un pare-feu).  
- Analyse des ports ouverts sur un hôte, permettant de déterminer les services en cours d'éxécution et d'identifier les éventuelles vulnérabilités.  
- Détection d'OS en fonction dont l'hôte répond aux requêtes réseau.  
- Scripting via des scripts personnalisés pouvant être utilisés pour effectuer :  
    - Des tests de sécurité  
    - Collecte d'informations spécifiques  
    - Automatiser des tâches de découverte et d'audit.  
- Prend en charge de la CLI et de la GUI.  

!!! tip ""
    lien vers le site [NMAP](https://nmap.org/)

## Scan de réseau 

Exemple d'utilisation  

```bash
nmap [Type de Scans] [Options] {Host cible} 

nmap -sP 192.168.1.1/24         # découverte de tout les hosts sur le réseau 'scan et ping )
nmap 192.168.10,.0-255          # scan plage d'adresses  
     192.168.10.*
     192.168.10.0/24
nmap -iL /host.txt              # scan de host dans un fichier 
```

## Options

```bash
-v ou -vv                   # mode bavard
--exclude 192.168.1.5       # exclure un host 
-sL 192.168.1.1/30          # liste simplement les ip du masque 
-PN 192.168.1.1/24          # pas de scan ping 
-PS 192.168.1.1/24          # ping tcp syn 
-PA                         # ping tcp ack 
-PU                         # ping udp 
-PE; -PP; -PM               # ping icmp 
-PR                         # ping arp 
--exclude 192.168.1.1       # exclure ip 
-n                          # pas de dns 
-R                          # dns 
–open                       # Afficher que les ports ouverts
-oN                         # Enregistrer le résultat du scan dans un fichier au formate texte
-oX                         # Enregistrer le résultat du scan dans un fichier au formate XML
-p                          # Spécifier les ports réseaux à scanner
-Pn                         # Désactiver la découverte d’hôte
-r                          # Analyser les ports consécutivement
-sT                         # Faire un scan de port TCP
-sU                         # Faire un scan de port UDP
-sV                         # Trouver les versions du service
-script                     # Utilise un script interne à nmap pour scan de vulnérabilité, bruteforce, etc
```