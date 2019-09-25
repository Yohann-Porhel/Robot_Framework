#coding utf-8

[Documentation]  Test Suite controlant la NR des différentes pages du site Web de la *SNCF*

*** Settings ***

Resource  ../resources/pageAccueil.robot
Resource  ../resources/pageItineraires.robot
#Test Teardown    Close All Browsers

*** Test Cases ***

Se Connecter
  [Documentation]  Accéder au site de la SNCF

  pageAccueil.Ouvrir Le Site SNCF

Renseigner Les Criteres
  [Documentation]  Renseigner les villes de départ et d'arrivée

  pageAccueil.Renseigner Les Criteres De Recherche

# Reserver Un Billet De Train

Selectionner l Ititneraire
  [Documentation]  Selectionner un Ititneraire

  pageItineraires.Cliquer Sur Le Voyage

