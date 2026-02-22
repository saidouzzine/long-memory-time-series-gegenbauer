# Analyse de séries temporelles à mémoire longue : ARFIMA, Gegenbauer et GARMA

[![R](https://img.shields.io/badge/R-4.0+-276DC3)]()
[![TimeSeries](https://img.shields.io/badge/Domaine-Séries%20Temporelles%20Avancées-blue)]()
[![Modeling](https://img.shields.io/badge/Modèles-ARFIMA%20%7C%20Gegenbauer%20%7C%20GARMA-orange)]()
[![Climate](https://img.shields.io/badge/Application-Données%20Climatiques-lightgrey)]()
[![Reproducible](https://img.shields.io/badge/Workflow-Reproductible-green)]()

## 1. Présentation générale

Ce dépôt présente une étude complète des modèles à mémoire longue appliqués à des séries temporelles climatiques (indices ENSO/NINO).  
L’objectif est d’explorer, simuler et estimer des modèles avancés tels que :

- ARFIMA  
- Processus de Gegenbauer (1 ou 2 facteurs)  
- Modèles GARMA  
- Analyse spectrale et autocorrélation théorique  

Le projet combine théorie, implémentation R et application à des données réelles.

## 2. Contexte scientifique

Les séries climatiques présentent souvent une structure complexe :

- mémoire longue,  
- persistance ou antipersistence,  
- pics spectraux liés à des cycles naturels,  
- dépendances non stationnaires.

Les modèles ARFIMA et Gegenbauer permettent de capturer ces phénomènes grâce à la différenciation fractionnaire et aux polynômes de Gegenbauer.  
Les modèles GARMA étendent cette approche en intégrant une dynamique ARMA.

## 3. Contenu du dépôt

### 3.1 Modules R

Le dossier `R/` contient les modules essentiels :

- `gegenbauer_poly.R` : calcul des polynômes de Gegenbauer  
- `gegenbauer_ma.R` : coefficients MA des processus Gegenbauer  
- `gegenbauer_sim.R` : simulation de processus Gegenbauer  
- `garma_acf.R` : autocovariance et autocorrélation théoriques GARMA  
- `garma_sim.R` : simulation GARMA  
- `garma_est.R` : estimation GARMA par recherche sur grille  

### 3.2 Scripts d’exécution

- `main.R` : pipeline complet d’analyse  
- `install_packages.R` : installation automatique des dépendances  
- `requirements.txt` : liste des packages nécessaires  

### 3.3 Données

- `data/DLNINO.csv` : indices climatiques transformés (LNINO, DLNINO)

## 4. Approche méthodologique

### 4.1 Analyse exploratoire
- Visualisation des séries LNINO  
- ACF, spectres, densités  
- Étude des versions différenciées  

### 4.2 Modélisation
- Estimation ARFIMA  
- Calcul des polynômes de Gegenbauer  
- Simulation de processus à 1 ou 2 facteurs  
- Estimation GARMA par grille (u, d, p)  

### 4.3 Validation
- Comparaison AIC  
- ACF théorique vs empirique  
- Analyse spectrale  

## 5. Compétences mises en avant

### 5.1 Data Science
- Séries temporelles avancées  
- Modélisation statistique  
- Prévision et analyse spectrale  

### 5.2 Ingénierie logicielle
- Code modulaire et documenté  
- roxygen2  
- Workflow reproductible  
- Architecture de type package R  

### 5.3 Expertise métier
- Analyse climatique ENSO/NINO  
- Interprétation de la mémoire longue  
- Dynamique multi‑facteurs  

## 6. Structure du projet

```
├── R/
│   ├── gegenbauer_poly.R
│   ├── gegenbauer_ma.R
│   ├── gegenbauer_sim.R
│   ├── garma_acf.R
│   ├── garma_sim.R
│   └── garma_est.R
├── data/
│   └── DLNINO.csv
├── main.R
├── install_packages.R
├── requirements.txt
└── README.md
```

## 7. Auteur

Projet développé par **Said Ouzzine**, Data Scientist spécialisé en :

- séries temporelles à mémoire longue,  
- modélisation statistique avancée,  
- analyse climatique et économique,  
- développement de modules R professionnels.

Profil :  
https://www.linkedin.com/in/said-ouzzine/
