# Gestion du réseau

Objectifs  

Prendre des informations sur le réseau  
Configuration réseau d’un système sans interface graphique  
Configuration réseau d’un système avec interface graphique  

## Prise d’information réseau

Pour une mise en réseau des postes client et serveur, la couche IP doit être correctement réalisée  
La configuration IP a généralement besoin :  

- d’une adresse IP
- d’un masque réseau
- potentiellement d’une passerelle par défaut

Afin de résoudre les noms d’hôtes, il faudra également renseigner un ou des serveurs DNS.  

Pour prendre les renseignements réseau nécessaires sur notre machine la commande `ip`sera à la base des prochaines recherches  

### Connaitre l’adresse réseau

La commande `ip`suivie de l’option `<address>`ou le raccourci `<a>`  

???+ abstract "`ip address` ou `ip a`"
    ```bash
    root@deb:~# ip a
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
            valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host
            valid_lft forever preferred_lft forever
    2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
        link/ether 00:0c:29:7c:ff:ba brd ff:ff:ff:ff:ff:ff
        inet 192.168.1.50/24 brd 192.168.1.255 scope global dynamic ens33
            valid_lft 85457sec preferred_lft 85457sec inet6 fe80::20c:29ff:fe7c:ffba/64 scope link
            valid_lft forever preferred_lft forever
    ```

### Connaitre la passerelle

La commande `ip`avec l’option `<route>`ou son raccourci `<r>`  

???+ abstract "`ip route` ou `ip r`"
    ```bash
    root@deb:~# ip r
    default via 192.168.1.1 dev ens33
    192.168.1.0/24 dev ens33 proto kernel scope link src 192.168.1.50
    ```

### Connaitre le serveur DNS

Les informations de DNS se trouvent dans le fichier `/etc/resolv.conf`  

???+ abstract "Chemin DNS"
    ```bash
    root@deb:~# cat /etc/resolv.conf
    search mondomaine.fr
    nameserver 10.1.2.20
    nameserver 10.1.2.21
    ```

## Système sans GUI

Dans un système sans GUI la configuration IP & DNS se font dans deux fichiers de configuration  

Pour gérer la partie IP il faut se rendre dans le fichier **/etc/network/interfaces**  
Il sera possible d’avoir une configuration simplifiée via un serveur **DHCP** ou une configuration **statique**  

### Configuration IP en DHCP et en statique

!!! abstract ""
    === "configuration DHCP"
        ```bash
        root@deb:~# vim /etc/network/interfaces
        # The loopback network interface
        auto lo
        iface lo inet loopback
        # Carte réseau - Ethernet ens33
        auto ens33
        allow-hotplug ens33
        iface ens33 inet dhcp
        ```
    === "configuration Statique"
        ```bash
        root@deb:~# vim /etc/network/interfaces
        # The loopback network interface
        auto lo
        iface lo inet loopback
        # Carte réseau - Ethernet ens33
        auto ens33
        iface ens33 inet static
                address 10.1.1.10
                netmask 255.255.0.0
                gateway 10.1.255.254
        ```

### Configuration DNS Statique

Il faudra mettre en place une configuration **statique** dans le fichier ***/etc/resolv.conf*** via la directive *nameserver*

!!! abstract ""
    ```bash
    root@deb:~# vim /etc/resolv.conf
    search mondomaine.fr
    nameserver 10.1.2.20
    nameserver 10.1.2.21
    ```

### Validation des modifications

Pour effectuer la prise en compte des modifications, on utilise la commande  
`systemctl` pour gérer le service **networking**  

#### Arrêter/démarrer/redémarrer le service réseau

!!! abstract ""
    === "Arrêter"
        ```bash
        root@deb:~# systemctl stop networking.service
        ```
    === "Démarrer"
        ```bash
        root@deb:~# systemctl start networking.service
        ```
    === "Redémarrer"
        ```bash
        root@deb:~# systemctl restart networking.service
        ```

## Système avec GUI

Une GUI offre la possibilité d’utiliser Network Manager pour effectuer les paramétrages réseau.  

<!-- insérer capture d’écran network manager p15 cours module 5 -->

ou via la commande `nmtui`à rentrer dans le terminal  

Pour la prise en compte des modifications, il faudra :  

Soit redémarrer **NetworkManager** via le terminal avec la commande `systemctl`  

!!! abstract ""
    ```bash
    root@deb:~# systemctl restart NetworkManager
    ```

ou bien via l’interface graphique  

<!-- insérer capture d’écran page 16 module 5-->
