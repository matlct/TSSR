# Maintenance d'un système en production

## Analyser le système

L'analyse d'un système d'exploitation permet de vérifier que tout fonctionne correctement.  
Nous pouvons compter sur 2 outils permettant l'analyse :

- proactifs
- réactifs

Afin d'analyser facilement son système, il est utile de lire les **journaux** du système (les **logs**).  
Afin de préserver un bon fonctionnement, il est utile d'**automatiser** des tâches administratives.  
Enfin, il est important de connaître des commandes de prise d'informations du système, la RAM, le CPU, les processus, etc.  

## Gestion des journaux système et applicatif

Depuis Debian 9 deux services permettent la gestion des journaux applicatifs: 

- **Journald** au travers de **systemd**
- L'ancien système **rsyslog** au travers de journald

### journald

Elle permet d'interargir avec systemd afin de récupérer des informations. En effet tous les services, programmes, tâches gérées par systemd ont leurs comportements remontés dans **journald**.  
La commande `systemctl <status> [daemon]` affiche le statut du service mais aussi les logs de l'application.  
Ces logs sont enregistrés dans une base de données gérée par **journald**

### Commande `journalctl`

Puisque **journald** stocke les informations dans une base de données, il est possible de regarder les logs complets de chaque service via la commande `journalctl`.  

!!! tip ""
    Le fichier de configuration de **journald** est  
    `/etc/systemd/journald`

```root
root@deb:~$ systemctl status sshd.service
ssh.service - OpenBSD Secure Shell server
    Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
    Active: active (running) since Thu 2021-06-03 14:22:07 CEST; 6 days ago
      Docs: man:sshd(8)
            man: sshd_config(5)
    Process: 614 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
   Main PID: 621 (sshd)
      Tasks: 1 (limit: 2315)
     Memory: 3.8M
     CGroup: /system.slice/ssh.service
             -621 /usr/sbin/sshd -D
juin 09 15:35:20 client-linux sshd[5154] : Accepted password for jdoe from
172.19.11.13 port 61644 ssh2
juin 09 15:35:20 client-linux sshd[5154] : pam_unix(sshd:session) : session opened
for user jdoe by (uid=0)
```

l'utilisation de `journalctl` est la suivante :  

??? example "utilisation de `journalctl`"
    === "`journalctl -f`
        Permet la visualisation des logs en temps réel  
        ```bash
        root@deb:~$ journalctl -f
        -- Logs begin at Thu 2021-06-03 14:22:04 CEST. --
        juin 09 15:36:22 client-linux cracklib[5204] : no dictionary update necessary.
        juin 09 15:36:23 client linux anacron [4086]: Job cron.daily' terminated
        juin 09 15:36:45 client linux PackageKit [4305]: daemon quit
        juin 09 15:36:45 client linux systemd [1]: packagekit.service : Main process exited,
        code=killed, status=15/TERM
        ```  
    === "`journalctl -u [nom_du_service]`
        remonte les logs spécifique au service nommé  
        ```bash
        root@deb:~$ journalctl u cron
        --Logs begin at Thu 2021 06 03 14:22:04 CEST, end at Wed 2021 06 09 15:41:22 CEST. --
        juin 03 14:22:06 client-linux systemd [1] : Started Regular background program
        processing daemon.
        juin 03 14:22:06 client-linux cron [529]: (CRON) INFO (pidfile fd = 3)
        juin 03 14:22:07 client-linux cron [529]: (CRON) INFO (Running @reboot jobs)
        juin 03 14:30:01 client-linux CRON[1337]: pam_unix cron:session ): session opened for
        user root by (uid=0)
        juin 03 14:30:01 client-linux CRON[1338]: (root) CMD ([ x / etc init.d anacron ] && if
        [ ! d /run/ systemd /system ]; then /usr/sbin/invoke-rc.d an
        juin 03 14:30:01 client-linux CRON[1337]: pam_unix(cron:session): session closed for
        user root
        [...]
        ```
    === "`journalctl _PID [n° du PID(processus)]`"
        remonte les logs d'un processus spécifique  
        ```bash
        root@deb:~$ journalctl _PID=1
        -- Logs begin at Sun 2019-04-21 07:14:36 CEST, end at Thu 2019-05-09 13:24:52 CEST. --
        avril 21 08:01:38 debian systemd [1]: Started Run anacron jobs.
        avril 21 08:01:38 debian systemd [1]: anacron.timer : Adding 2min 48.679199s random
        time.
        avril 21 08:53:38 debian systemd [1]: Starting Daily apt download
        avril 21 08:53:45 debian systemd [1]: Started Daily apt download
        avril 21 08:53:45 debian systemd [1]: apt daily.timer : Adding 10h 23.576305s random
        time.
        ```  
    === "`journalctl [chemin du programme/binaire]`"
        remonte les logs d'un programme/binaire spécifique
        ```bash
        root@deb:~$ journalctl /usr/bin/sshd
        -- Logs begin at Thu 2021-06-03 14:22:04 CEST, end at Wed 2021-06-09 16:32:19 CEST. --
        juin 03 14:22:07 client linux sshd [621]: Server listening on 0.0.0.0 port
        juin 03 14:22:07 client linux sshd [621]: Server listening on :: port
        juin 09 15:35:20 client linux sshd [5154]: Accepted password for jdoe from 172.19.11.13
        port 61644 ssh2
        juin 09 15:35:20 client linux sshd [5154]: pam_unix sshd:session ): session opened for
        user jdoe by (uid=0)
        ```
    === "`journalctl -p <level>`"
        remonte les logs selon un niveau de priorité défini dans la commande  
        ```bash
        root@deb:~$ journalctl -p err
        -- Logs begin at Thu 2021-06-03 14:22:04 CEST, end at Wed 2021-06-09 16:32:19 CEST. --
        juin 03 14:22:07 client-linux kernel: sd 3:0:0:0: [ sdc ] No Caching mode page found
        juin 03 14:22:07 client-linux kernel: sd 3:0:0:0: [ sdc ] Assuming drive cache: write
        through
        juin 09 15:35:20 client-linux gdm-password][18939]: pam_unix (gdm-password:auth) :
        conversation failed
        juin 09 15:35:20 client-linux gdm-password][18939]: pam_unix (gdm-password:auth) : auth
        could not identify password for [jdoe]
        ```

Pour la commande `journalctl -p` les niveaux de priorité sont les suivants:  
  - emerg
  - alert
  - crit
  - err
  - warning
  - notice
  - info
  - debug

Il est évidemment possible de cumuler les options: 

```bash
root@deb
:~$ journalctl f usr sbin sshd p info
-- Logs begin at Thu 2021 06 03 14:22:04 CEST, end at Wed 2021 06 09 16:32:19 CEST. --
mai 06 09:56:48 debian sshd [18901]: Accepted password for jdoe from 10.9.121.13
    port    60042 ssh2
mai 06 09:56:48 debian sshd [18901]: pam_unix(sshd:session) : session opened for user
    jdoe by (uid=0)
mai 06 15:48:06 debian sshd [18901]: pam_unix (sshd:session): session closed for user
    jdoe
```

>A noter que les logs `journald` ne sont conservé que pour la session en cours !

### Rsyslog

Il s'agit du mode historique de Gestion des logs de Linux, tous les logs de **journalctl** sont transférés à **rsyslog**  
Les actions correspondent généralement à l'écriture du journal dans un fichier, mais il est possible de configurer **rsyslog** pour qu'il envoie les messages à enregistrer vers un autre serveur rsyslog.  
**Rsyslog** utilise des ^^facilities^^ elles peuvent être considérées comme des "thêmes" et des niveaux de **priorités** qui déclenchent une action.  

!!! tip ""
    === "facilities"
       - **auth**: utilisée pour des évènements concernant la sécurité ou l'authentification à travers des applications d'accès (type SSH)
       - **authpriv**: utilisée pour les messages relatifs au contrôle d'accès
       - **daemon**: utilisée par les différents processus systèmes et d'application
       - **kern**: utilisée pour les messages concernant le noyau
       - **mail**: utilisée pour les évènements des services mail
       - **user**: facility par défaut quand aucune n'est spécifiée
       - **local0** à **local7**: utilisées pour les messages de différents programmes
       - **"*"**: désigne toutes les facilities
       - **none**: désigne aucune facility
    === "niveaux priorité"
       - **emerg**: urgence, système inutilisable
       - **alert**: alerte, intervention immédiate nécessaire
       - **crit**: erreur système critique
       - **err**: erreur de fonctionnement
       - **warning**: avertissement
       - **notice**: évènement normaux devant être signalés
       - **info**: pour information
       - **debug**: message de débogage

voici un exemple de configuration des règles dans le fichier **/etc/rsyslog.conf**:

```bash
auth,authpriv;*         /var/log/auth.log
*.*;auth,authpriv.none  -/var/log/syslog
#cron.*                 /var/log/cron.log
daemon.*                -/var/log/daemon.log
kern.*                  -/var/log/kern.log
# le "-" devant certains chemins indique un enregistrement des logs asynchrone
```

### Commande `logger`

`logger <option> [message]`  

Permets de faire des tests ou créer des scripts qui intéragissent avec journald et rsyslog via la commande **logger**  

```bash
root@deb:~$ logger -p cron.info Message de test
```

## Planification des tâches

L'automatisation des tâches peuvent être effectué avec le service **crontab**.  
Il existe 2 types de planification :

- Planification Utilisateur
- Planification Système

### Crontab

**Crontab** (contraction de "cron table") est un utilitaire permettant de programmer l'exécution automatique de commandes ou de scripts sous Unix.  
Il permet de planifier l'exécution de taches récurrentes.  
Chaque utilisateur à son **cron** dedié.  

**crontab** est un outil clé sous Unix pour l'automatisation et la planification de tâches. Simple d'utilisation, il offre une grande flexibilité pour l'exécution périodique de commndes.  

Les principales caractéristiques de crontab sont:  

- Permet de définir des tâches qui s'exécuteront automatiquement à des dates et heures précises ou selon un intervalle régulier.
- Les tâches planifiées sont définies dans une fichier **crontab**, généralement situé dans le répertoire /etc/crontab ou dans le répertoire personnel de l'utilisateur (~/.crontab)
- Chaque utilisateur à son propre **cron** dedié
- Le fichier **^^crontab^^** contient une liste de commandes avec leur planification. Chaque entrée est composée de 6 champs:
  - Minute (0-59)
  - Heure (0-23)
  - dom = day of month (1-31)
  - mon = month (1-12)
  - dow = day of week (0-, 0=dimanche)
  - Commande à exécuter
- L'utilitaire **cron** se charge, en arrière-plan, de lire le fichier **crontab** et d'exécuter les commandes aux dates/heures indiquées
- Permet d'automatiser des tâches d'administration système (sauvegardes, purge de fichiers, scripts récurrents, etc) ou des jobs d'utilisateurs.
- Utile pour planifier des jobs sans intervention humaine. Gain de temps et fiabilité.

??? tip "exemple d'un fichier cron"
    ```bash
    SHELL=/bin/sh
    PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
    # m h dom mon dow user command
    17 * * * * root cd / && run-parts --report /etc/cron.hourly
    25 6 * * * root test -x /usr/sbin/anacron || (cd / && run-parts --report /etc/cron.daily )
    47 6 * * 7 root test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly)
    52 6 1 * * root test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly)
    ```

### Anacron

**anacron** (contraction de "anachronistic cron") est un utilitaire qui permet d'exécuter des tâches périodiques sur un système Linux même si celui-ci n'est pas toujours allumé.  

Il fonctionne en complément de **cron** et comble certaines de ses limitations. Notamment, cron ne peut lancer une tâche si l'ordinateur est éteint au moment prévu.  
Le fichier de configuration **/etc/anacrontab** définit les tâches à exécuter et leur fréquence (journalière, hebdomadaire, mensuelle).  
**Anacron** ne lance pas les jobs directement mais ajoute des timestamps dans le fichier **/var/spool/anacron**.  
A chaque démarrage, anacron vérifie ces timestamps et détermine si des jobs sont "en retard" par rapport à leur fréquence définie. Si c'est le cas, il exécute ces jobs via cron.  
Anacron résout donc le problème des jobs ratés quand la machine est arrêtée. Il garantit leur exécution régulière.  
Il est particulièrement utile sur les ordinateurs portables ou les serveurs redemarrés fréquemment.  
**Anacron** ne gère pas la minute des "schedules". Pour cela, **crontab** reste nécessaire. Les 2 outils sont complémentaires.  

^^En résumé^^, anacron apporte plus de robustesse aux tâches planifiées en palliant les arrêts machine. Il travaille de paire avec **cron**.  


Pour comprendre le fonctionnement d'anacron, l'explication suivante va s'appuyer sur le travail : **cron.daily**  

- Tous les jours, si le système reste allumé 24/24, cron va exécuter cette tâche à 6h25 :  

```bash
25  6  *  *  *   root cd / && run-parts --report /etc/cron.hourly
```

- Cette tâche a pour effet de lancer tous les scripts présents dans le répertoire /etc/cron.daily.  
- En regardant dans ce répertoire, on voit qu'il y a un fichier **0anacron**. Ce script exécute une simple commande qui est :  

```bash
anacron -u cron.daily
``.

## Gestion de la taille des fichiers de log

### journald

Journald est le gestionnaire de journaux (logs) par défaut sur les systèmes Linux utilisant **systemd**.  
Voici un résumé de ces principales caractéristiques:  

- Journald collecte les messages de log provenant du noyau, des démons système, des applications etc.  
- Il stocke les journaux sous forme de fichiers journaux binaires dans **/run/log/journal** de façon temporaire et dans **/var/log/journal** de manière persistante.  
- Contrairement à **syslog**, chaque message est associé à un identifiant unique (monotonic timestamp).  
- Journald indexe les journaux pour permettre des recherches rapides. Il peut interroger les journaux en direct.  
- La commande `journalctl` permet de lire les journaux gérés par journald et d'appliquer des filtres puissants sur les entrées.
- Journald implémente la rotation et la compression automatique des vieux journaux.
- Sa configuration s'effectue dans le répertoire **/etc/systemd/journald.conf** et permet notamment de paramétrer la taille max, la rétention, etc.
- Dans le fichier de configuration si le paramètre **#Storage=auto** est commenté journald utilisera sa valeur par défaut **auto**
- Il s'agit d'une alternative, plus riche en fonctionnalité que syslog avec des capacités de recherche et de filtration avancés.
- Il est cependant limité à un seul système, contrairement à syslog qui permet la centralisation des logs.

#### Taille des logs avec journald

Journald n'a, par défaut, pas de limite de taille fixe pour les logs. Ils peuvent croître indéfinimemt et occuper tout l'espace disque. Il est donc recommandé de définir une limite avec l'option **SystemMaxUse=** dans son fichier de conf. (ex. **SystemMaxUse=500M**).  
Ainsi journald divisera alors les logs en fichiers journaux de 500Mo max. dans le répertoire **/var/log/journal**. Les anciens journaux seront automatiquement purgés.  
A contrario l'option **SystemMaxFileSize=** permettra de limiter la taille maximum d'un seul fichier journal.  
**SystemMaxFiles=** limitera le nombre total de fichiers journaux.  
journald compresse les logs, le taux de compression dépend du contenu des logs.
Par défaut, il utilisera 10% de la partition /var.  
L'espace requis dépend du volume de logs généré par le système.  
La commande `journald --vacuum-size=` permet de vider les logs manuellement.  

#### fichier de configuration de journald

Celui ce trouve dans le répertoire **/etc/systemd/journal.conf** voici une liste non exhaustive de point pouvant être modifié:

- **SystemMaxUSe=** permet de limiter la taille totale des journaux
- **SystemMaxFileSize=** limite la taille individuelle des fichiers journaux
- **SystemMaxFiles=** fixe le nombre maximum de fichiers journaux
- **Storage=** contrôle le mode de stockage (auto, volatile, persistent, etc.)
- **Compress=** choisit si les journaux sont compressés ou non
- **MaxRetentionSec=** permet de définir la rétention maximale avant rotation
- **ForwarToSyslog=** permet le transfert des journaux à Syslog

> A noter que tous changement dans le fichier de configuration nécessitent un redémarrage de `journald` pour qu'ils soient pris en compte.  

#### Précision sur /run/log/journal

Les logs, via journald, sont nativement stocker dans une base de données volatile situé dans **/run/log/journal**.  
**/run/log/journal** contient les journaux actifs en cours d'écriture par journald. Ces fichiers ont l'extension ".journal"  
Les journaux inactifs sont, quant à eux, automatiquement archivés et compressés dans le répertoire **/var/log/journal** par journald.  
Il s'agit d'un système de fichiers *tempfs* monté en mémoire vive. Cela permet des écritures de logs rapides, MAIS ce répertoire est **^^éphemère^^** il sera vidé à chaque redémarrage.  
**/run/log/journal** contient des sous-répertoires comme *systemd/*, *user/*, *container/* avec les journaux liés à ces sources.  
La taille des journaux est limitée par le paramètre **SystemMaxUse=**.  
La commande `journalctl` permet de lire les journaux contenu dans le répertoire et constitue le meilleur moyen pour cela.  

### Logrotate

**Logrotate** est un programme permettant de gérer la rotation des fichiers journaux,  
Il permet de contrôler la taille des fichiers logs et d'éviter qu'ils grossissent indéfiniment.  
Il est généralement exécuté via une tâche **cron** quotidiennement. Il ira vérifier les règles de rotation définies danss la configuration **/etc/logrotate.conf** et les fichiers de conf. dans **/etc/logrotate.d**.  
Ces règles incluent la fréquence de rotation (quotidienne, hebdomadaire, etc.), le nb de rotation à garder, la taille max, etc.. Ainsi quand un fichiers journal atteint le critère défini, ***logrotate*** va le renommer en lui ajoutant un suffixe avec la date, puis en créer un nouveau.  
Les anciens logs peuvent être compressés avec l'option `compress` permettant de gagner de l'espace de stockage.  
***Logrotate*** est crucial pour éviter de remplir un disque lorsqu'un système génèrent beaucoups de logs, sont automatiqation permet la gestion des logs sans intervention manuelle.  

??? tip "Exemple de configuration"
    ```bash
    /var/log/squid/access.log {
    daily
    compress
    delaycompress
    rotate 366
    create 640
    }
    ```

