# EN103 - Projet Loto Numérique

Projet réalisé dans le cadre du module **EN103 - Projet Loto Numérique** en première année du département **Électronique** à l’**ENSEIRB-MATMECA**.

**Auteurs :**  
Mattéo BINET  
Alexandre BROMET  

**Encadrant :**  
Dominique DALLET

**Date :** Avril 2025  

---

## 1. Présentation du projet

Le projet **LOTO** s’inscrit dans le cadre du module **EN103 – Projet numérique**, dont l’objectif est l’initiation à la conception d’architectures numériques en **VHDL** et leur implémentation sur circuit **FPGA**.

Il s’agit de concevoir un système capable de réaliser un **tirage aléatoire de six nombres distincts compris entre 1 et 49**, en respectant un fonctionnement strictement synchrone et des contraintes de cadencement précises.  
Le projet a été modélisé, simulé et validé expérimentalement sur la carte **NEXYS A7** (FPGA Xilinx Artix-7).

---

## 2. Objectifs pédagogiques

- Concevoir une architecture numérique modulaire en VHDL.  
- Maîtriser la notion de **machine à états (FSM)** et l’intégrer à une partie opérative.  
- Implémenter et valider le fonctionnement sur carte FPGA réelle.  
- Gérer l’affichage d’informations numériques sur afficheurs 7 segments via multiplexage.  
- Utiliser les outils de développement et de simulation sous **Vivado**.

---

## 3. Cahier des charges

### 3.1 Description fonctionnelle

Le système doit permettre le tirage aléatoire de **6 nombres différents** entre 1 et 49.  
Le principe de fonctionnement est le suivant :

1. L’utilisateur initialise le système via le signal **rst**.  
2. Lors d’un appui sur le **bouton de tirage**, un compteur défile de 1 à 49.  
3. Lorsque le bouton est relâché, le compteur se fige sur une valeur.  
4. Si la valeur n’a pas encore été tirée :
   - Elle est enregistrée.  
   - La LED_OK s’allume pour indiquer un tirage valide.  
5. Si la valeur est déjà sortie :
   - La LED_Recommence s’allume et un nouveau tirage est exigé.  
6. Lorsque les 6 tirages sont effectués, les LEDs clignotent.  
7. Les 6 valeurs tirées sont affichées cycliquement sur les afficheurs 7 segments.

---

### 3.2 Contraintes de cadencement

Le système repose sur une horloge principale de **100 MHz** issue du quartz de la carte FPGA.  
Trois signaux d’activation (**Clock Enable**) sont utilisés :

| Signal | Fonction | Fréquence approximative |
|---------|-----------|------------------------|
| `CEtraitement` | Commande du tirage aléatoire | 25 MHz |
| `CEaffichage` | Rafraîchissement des 7 segments | 3 kHz |
| `CEincrement` | Défilement cyclique des 6 valeurs | 1 Hz |

---

### 3.3 Interfaces d’entrée/sortie

| Type | Signal | Description |
|-------|--------|-------------|
| Entrée | `clk` | Horloge principale 100 MHz |
| Entrée | `rst` | Remise à zéro asynchrone |
| Entrée | `Bouton` | Déclenchement du tirage |
| Sortie | `LED_OK` | Indique une valeur valide |
| Sortie | `LED_Recommence` | Indique un doublon |
| Sortie | `Sept_Segments` | Bus de 7 bits pour l’affichage |
| Sortie | `AN` | Bus de 4 bits de sélection d’anodes |

---

## 4. Architecture générale

Le système est entièrement **synchrone** et structuré de manière **hiérarchique**.  
Il comprend huit modules principaux et un sous-bloc complexe nommé **Tirage**, lui-même composé de cinq sous-modules.

### 4.1 Schéma fonctionnel global

L’architecture globale est organisée selon les blocs suivants :

| Module | Fonction principale |
|---------|----------------------|
| `gestion_horloge` | Génération des signaux `CEtraitement`, `CEaffichage` et `CEincrement` |
| `basculeFF` | Synchronisation du bouton de tirage |
| `tirage` | Gestion complète du tirage (FSM, compteurs, mémoire, comparaison) |
| `transcodeur` | Conversion binaire → code 7 segments |
| `mod6` | Sélection cyclique du nombre parmi les 6 tirés |
| `mux6` | Multiplexage des 6 valeurs vers le transcodeur |
| `mod4` | Sélection cyclique des anodes pour les afficheurs |
| `mux4` | Multiplexage des 4 chiffres affichés synchrones avec `mod4` |

### 4.2 Bloc « Tirage »

Le bloc **Tirage** se compose des modules suivants :

| Module | Fonction |
|--------|-----------|
| `cpt_tirage` | Compteur de 1 à 49, cadencé par `CEtraitement` |
| `cpt_valeurs` | Compteur de 1 à 6, indique le rang du tirage |
| `mem` | Registres de sauvegarde des 6 valeurs tirées |
| `comp` | Comparateur combinatoire détectant les doublons |
| `FSM` | Machine à états contrôlant le processus complet du LOTO |

La **FSM** pilote les signaux d’écriture, d’incrémentation et d’indication LEDs.  
Ses entrées principales sont : `Bouton`, `Comparaison` et `Cpt_valeurs`.

---

## 5. Affichage sur 7 segments

- La carte NEXYS A7 comporte **8 afficheurs à anode commune**.  
- Seules 4 anodes sont utilisées dans le projet.  
- Les segments sont actifs à l’état bas (`0`).  
- Le multiplexage temporel, cadencé à 3 kHz, assure la perception continue de l’affichage.  
- Chaque valeur tirée (1–49) est représentée sur deux digits, précédée du numéro de tirage et d’un tiret de séparation (exemple : `2 - 23`).

---

## 6. Implémentation matérielle

### 6.1 Plateforme
- **Carte FPGA :** Digilent NEXYS A7  
- **FPGA :** Xilinx Artix-7 (XC7A100T-1CSG324)  
- **Horloge :** Quartz 100 MHz  
- **Logiciel de développement :** Xilinx Vivado  

### 6.2 Méthodologie
1. **Description VHDL** des blocs élémentaires.  
2. **Simulation fonctionnelle** individuelle (ISim / Vivado).  
3. **Assemblage** et simulation globale.  
4. **Synthèse** et génération du bitstream.  
5. **Implémentation** sur la carte NEXYS A7.  
6. **Validation expérimentale** par observation du comportement.

---

## 7. Résultats expérimentaux

Les tests réalisés sur la carte FPGA ont permis de vérifier :
- Le respect du fonctionnement décrit dans le cahier des charges.  
- L’absence de doublons dans les tirages.  
- Le bon cadencement des signaux et la stabilité du système.  
- La lisibilité et la fluidité de l’affichage multiplexé.  

Le projet est **fonctionnel**, stable et conforme aux spécifications demandées.

---

## 10. Contenu du dépôt GitHub

Le dépôt [EN103_-_Projet_loto](https://github.com/matteob29/EN103_-_Projet_loto_numerique) contient les éléments suivants :

- [Datasheet/](./Datasheet) → Fiches techniques du FPGA
- [Images/](./Images) → Schématiques et chronogrammes
- [Rapport/](./Rapport) → Rapport complet du projet LOTO (EN103 - Projet Loto.pdf)
- [Vivado/](./Vivado) → Projet et codes VHDL sur Vivado
- [README.md](./README.md)

---

© 2025 — Mattéo BINET, Alexandre BROMET  
Département Électronique — EN103  
Enseirb-Matmeca — Projet numérique FPGA
