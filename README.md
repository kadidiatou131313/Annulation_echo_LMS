# Annulation d’écho acoustique par algorithme LMS
### EN bellow
## Description du projet

Ce projet implémente l’**algorithme LMS (Least Mean Squares)** dans le cadre de l’annulation d’écho acoustique.
L’objectif est d’ajuster dynamiquement les coefficients d’un filtre adaptatif pour minimiser l’erreur entre un signal de référence et la sortie du filtre, en fonction d’un signal d’entrée bruité.

Le TP se décompose en deux fichiers principaux :

* `main.m` : script principal de génération, test et visualisation des signaux.
* `algolms2.m` : fonction implémentant l’algorithme LMS.

---

## Étapes du travail

1. **Génération des signaux de test**

2. **Implémentation de l’algorithme LMS**

3. **Validation de l’algorithme**

4. **Tests et analyse des performances**

---

## Résultats principaux

* Pour `µ = 0.02`, convergence stable en ~100 itérations.
* Pour `µ = 0.1`, convergence plus rapide mais instable (forte gigue).
* Pour `µ > 0.5`, divergence observée.
* Les coefficients du filtre convergent bien vers ceux du filtre générateur `h` dans le cas sans bruit.

---

## Structure du code

```
.
├── main.m        # Script principal : génération des signaux, appels à algolms2, affichage
├── algolms2.m    # Fonction LMS : calcul des poids, sortie et erreur
└── README.md
└── rapport.pdf
```

---

## Langage et environnement

* **Langage :** MATLAB
* **Sujet :** Traitement du signal / Filtrage adaptatif
* **Contexte :** 3A SIA – ENSEA

---

# English version

## Project Description

This project implements the **LMS (Least Mean Squares)** algorithm for **acoustic echo cancellation**.
The goal is to iteratively adapt the coefficients of an FIR filter to minimize the mean square error between a desired signal and the filter output.

Main files:

* `main.m`: generates, tests, and plots the signals.
* `algolms2.m`: implements the LMS adaptive filter algorithm.

---

## Workflow

1. **Signal Generation**

2. **LMS Algorithm**

3. **Validation**

4. **Performance Tests**

---

## Main Results

* Stable convergence for `µ = 0.02` after ~100 iterations.
* Instability for large step sizes (`µ = 0.1` to `0.5`).
* Coefficients accurately reproduce the unknown filter in the noiseless case.

---

## Code Structure

```
.
├── main.m        # Main script: test signals, LMS calls, visualization
├── algolms2.m    # Function implementing the LMS algorithm
└── README.md
└── rapport.pdf
```

---

## Environment

* **Language:** MATLAB
* **Topic:** Adaptive filtering / Signal Processing
* **Context:** 3rd year engineering project (ENSEA – SIA track)
