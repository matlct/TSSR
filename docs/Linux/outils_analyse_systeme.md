# Outils d'analyse du Système

## Prise d'informations sur le système

### Version du système

Afin de connaitre la version du système utilisé il suffit de ce servir de la commande `cat`  

```bash
root@deb:~$ cat /etc/debian_version
10.9
```

### Version du noyau

Pour la version du noyau linux actif et son architecture la commande `uname` sera utilisée:  

```bash
root@deb:~$ uname -a
Linux deb 5.2.0-8-amd64 #1 SMP Debian 5.2.0-8.1
(2021-05-19)  x86_64  GNU/Linux
```

### CPU

Pour connaître le type de CPU la commnande `lscpu`  

```bash
root@deb:~$ lscpu
Architecture : x86_64
Mode(s) opératoire(s) des processeurs : 32-bit, 64-bit
Boutisme : Little Endian
Processeur(s) : 1
Liste de processeur(s) en ligne : 0
Thread(s) par coeur : 1
Coeur(s) par socket : 1
[…]
Famille de processeur : 6
Modèle : 42
Nom de modèle : Intel(R) Core (TM) i5-2500 CPU @ 3.30GHz
[…]
```

### Lister informations PCI

Commande `lspci`  

```bash
root@deb lspci
00:00.0 Host bridge: Intel Corporation 440BX/ZX - 82443 Host bridge ( rev 01)
00:01.0 PCI bridge: Intel Corporation 440BX/ZX - 82443 AGP bridge ( rev 01)
00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 08)
00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
00:07.7 System peripheral : VMware Virtual Machine Communication Int. (rev 10)
00:0f.0 VGA compatible controller : VMware SVGA II Adapter
00:10.0 SCSI storage controller : LSI Logic / Symbios Logic 53c1030 PCI-X
Fusion-MPT Dual Ultra320 SCSI (rev 01)
00:11.0 PCI bridge: VMware PCI bridge (rev 02)
00:15.0 PCI bridge: VMware PCI Express Root Port (rev 01)
00:15.1 PCI bridge: VMware PCI Express Root Port (rev 01)
```

### Lister les périphériques USB

Commande `lsusb`  

```bash
root@deb lsusb
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 003: ID 0e0f:0002 VMware, Inc. Virtual USB Hub
Bus 001 Device 002: ID 0e0f:0003 VMware, Inc. Virtual Mouse
Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
```

### Lister les informations sur stockage et système de fichiers

Voir [stockage](./Espace_stockage.md)  

### Lister des informations sur répertoires et fichiers

Commande `du` voir fiche [Espace de Stockage](./Espace_stockage.md)  

Commande `ls` & `file` voir fiche [Fichiers et Dossiers](./Fichiers_Dossiers.md)  

Commande `lsof` voir fiche [bash 201](Bash_avance.md)  

## Performances et processus

### Comande `top`

La commande `top` permet de voir les informations de la machine en temps réel.  

```bash
top - 10:52:12 up 11:27, 3 users , load average : 0,00, 0,00, 0,00
Tasks: 193 total, 2 running, 191 sleeping,     0 stopped ,     0 zombie
%Cpu (s): 1,0 us,   0,3 sy,   0,0 ni,   98,7 id,   0,0 wa,   0,0 hi,   0,0 si,   0,0 st
MiB Mem :   1970,9 total,   406,0 free,     848,2 used,     716,7 buff/cache
MiB Swap:   976,0 total,    976,0 free,     0,0 used.       938,3 avail Mem
   PID USER        PR  NI      VIRT    RES     SHR S   %CPU   %MEM         TIME+ COMMAND
     5 root        20   0         0      0       0 I    0,3    0,0       0:41.44 kworker/0:0-
mm_percpu_wq
   550 root        20   0    122940  12316   10708 S    0,3    0,6       0:45.42 vmtoolsd
  2257 jdoe        20   0   2582664 295840  106080 S    0,3   14,7      11:46.09 gnome shell
  6155 jdoe        20   0     16972   5968    4844 S    0,3    0,3       0:00.04 sshd
  6296 jdoe        20   0     11272   3728    3008 R    0,3    0,2       0:00.04 top
     1 root        20   0    104324  10568    7852 S    0,0    0,5       0:03.68 systemd
     2 root        20   0         0      0       0 S    0,0    0,0       0:00.00 kthreadd
     3 root         0  -20        0      0       0 I    0,0    0,0       0:00.00 rcu_gp
```

2 autres outils permettant de lister les performances et processus peuvent être utilisés mais pour cela il faudra les telecharger et les installer.  
Il s'agit de :

- `htop`
- `glances`

### Commande `free`

La commande `free` permet quant à elle de lister les informations sur la ram.  

```bash
root@deb:~$ free -h
        total       used    free    shared  buff/cache  available
Mem:    1,9Gi      802Mi   451Mi      23Mi       716Mi      983Mi
Swap:   975Mi         0B   975Mi2
```