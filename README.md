# long-memory-time-series-gegenbauer
Analyse et modélisation de séries temporelles à mémoire longue via ARFIMA et processus de Gegenbauer à k‑facteurs. Implémentation sous R, estimation, simulation, autocovariances, prévisions et application à des données climatiques et économiques.
# Analyse de séries temporelles à mémoire longue : ARFIMA, Gegenbauer et modèles GARMA

[![R](https://img.shields.io/badge/R-4.0+-276DC3)]()
[![TimeSeries](https://img.shields.io/badge/Domain-Long%20Memory%20Time%20Series-blue)]()
[![Modeling](https://img.shields.io/badge/Models-ARFIMA%20%7C%20Gegenbauer%20%7C%20GARMA-orange)]()
[![Climate](https://img.shields.io/badge/Application-Climate%20Data-lightgrey)]()
[![Reproducible](https://img.shields.io/badge/Workflow-Reproducible-green)]()

## 1. Présentation du projet

Ce dépôt présente une étude complète de séries temporelles à mémoire longue appliquée à des données climatiques (indices ENSO / NINO) et économiques.  
L’objectif est d’explorer, simuler et estimer des modèles avancés tels que :

- ARFIMA(p, d, q)  
- Processus de Gegenbauer à un ou plusieurs facteurs  
- Modèles GARMA (Gegenbauer ARMA)  
- Méthodes de prévision associées  

Le projet combine théorie, implémentation R et application à des données réelles.

## 2. Contexte scientifique

Les séries climatiques et économiques présentent souvent :

- une **mémoire longue**,  
- une **structure spectrale complexe**,  
- des comportements persistants ou antipersistants,  
- des fréquences dominantes liées à des cycles naturels.

Les modèles ARFIMA et Gegenbauer permettent de capturer ces phénomènes grâce à :

- la différenciation fractionnaire,  
- les polynômes de Gegenbauer,  
- les processus GARMA à k‑facteurs.

## 3. Contenu du dépôt

Le dépôt contient :

1. Scripts R pour :
   - calcul des polynômes de Gegenbauer,  
   - simulation de processus Gegenbauer et GARMA,  
   - estimation des paramètres via recherche sur grille,  
   - calcul d’autocovariances et autocorrélations,  
   - visualisation spectrale et temporelle.

2. Données climatiques transformées (indices LNINO, DLNINO).

3. Fonctions avancées :
   - `GARMA_acf`  
   - `ggb_macoeff`  
   - `GEGENB`  
   - `ggb_sim`  
   - `GARMA.sim`  
   - `GARMA.est`

4. Un script principal orchestrant l’ensemble de l’analyse.

## 4. Approche méthodologique

### 4.1 Analyse exploratoire
- Visualisation des séries LNINO (NINO12, NINO3, NINO4, NINO34).  
- ACF, spectres, densités, histogrammes.  
- Étude des versions différenciées DLNINO.

### 4.2 Modélisation ARFIMA
- Tests de racine unitaire (ADF).  
- Estimation du paramètre de mémoire longue d.  
- Sélection de modèles via AIC.

### 4.3 Processus de Gegenbauer
- Calcul des polynômes de Gegenbauer.  
- Coefficients MA généralisés (GLP).  
- Analyse spectrale et autocorrélation.

### 4.4 Modèles GARMA
- Modèles à 1 et 2 facteurs.  
- Calcul des autocovariances et autocorrélations.  
- Simulation de réalisations GARMA.  
- Étude de l’impact des paramètres (u, d, phi).

### 4.5 Estimation des paramètres
- Recherche sur grille (u, d).  
- Estimation ARMA sur la série transformée.  
- Reconstruction du processus GARMA.  
- Comparaison des prévisions AR vs GARMA.

## 5. Compétences mises en avant

### 5.1 Data Science
- Analyse de séries temporelles complexes.  
- Modélisation statistique avancée.  
- Implémentation de modèles non standards.  
- Prévision et validation.

### 5.2 R et ingénierie logicielle
- Construction de modules réutilisables.  
- Documentation claire et structurée.  
- Workflow reproductible.  
- Visualisation scientifique.

### 5.3 Expertise métier
- Analyse de données climatiques ENSO/NINO.  
- Compréhension des phénomènes de mémoire longue.  
- Interprétation des structures spectrales.

## 6. Structure recommandée du projet
```
├── R/
│   ├── GARMA_acf.R
│   ├── ggb_macoeff.R
│   ├── GEGENB.R
│   ├── ggb_sim.R
│   ├── GARMA_sim.R
│   ├── GARMA_est.R
│   └── main.R
├── data/
│   └── DLNINO.csv
├── requirements.txt
├── install_packages.R
└── README.md
```

## 7. Auteur

Projet réalisé par **Said Ouzzine**, Data Scientist spécialisé en :

- séries temporelles avancées,  
- modèles à mémoire longue,  
- modélisation statistique sous R,  
- analyse climatique et économique.

LinkedIn :  
https://www.linkedin.com/in/said-ouzzine/

