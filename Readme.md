# **1 Consignes**

Concevoir une application, à partir d’une API en accès libre.

L’exercice devra être développé avec le pattern MVVM, sans Rx, dans le langage :
- Kotlin pour Android
- Swift pour iOS

L’exercice vise à démontrer la maîtrise des bonnes pratiques de développement.
Vous êtes libre d’utiliser les librairies que vous jugerez nécessaires.

## **1.2 Voici les consignes à respecter :**

### **1.2.1 Sur la Home page :**

1. 1- L’utilisateur cherche une league : champs de recherche avec auto-complétions sur
la liste des leagues disponibles (API 1 – cf page suivante)
2. 2- Choix de l’utilisateur sur la league à afficher
3. 3- Appel API 2(cfpagesuivante)
4. 4- Traitement de la réponse
5. 5- Affichage de la liste des équipes du championnat triées par ordre anti-alphabétique en n’affichant qu’1 équipe sur 2.
    

### **1.2.2 Sur le détail d’une équipe**

6- L’utilisateur sélectionne une équipe
7- Appel vers API3 (cfpagesuivante)
8- Traitement de la réponse
9- Affichage du détail de l’équipe

### **1.2.3 Données à afficher pour les équipes (toutes ces informations sont disponibles
via l’API) :**

- Nom de l’équipe
- Bannière
- Pays
- Championnat
- Description

# **2 Utilisation de l’API « TheSportsDB »**

Documentation de l’API : https://www.thesportsdb.com/api.php
API Key: 50130162

API 1 : API pour récupérer la liste des ligues disponibles :
https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php

API 2 : API pour construire la liste des équipes d’une league:
https://www.thesportsdb.com/api/v1/json/50130162/search_all_teams.php?l=French%20Ligue%201

API 3 : API pour récupérer le détail d’une équipe
https://www.thesportsdb.com/api/v1/json/50130162/searchteams.php?t=Paris%20SG
