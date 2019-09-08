#coding utf-8

*** Settings ***

Resource  ../resources/pageAccueil.robot
#Test Teardown    Close All Browsers

*** Test Cases ***

Se Connecter

  pageAccueil.Ouvrir Le Site SNCF

Renseigner Les Criteres

  pageAccueil.Renseigner Les Criteres De Recherche

# Reserver Un Billet De Train

#   [Documentation]  Parcours afin de reserver un billet de train sur le site SNCF

#   pageAccueil.Ouvrir Le Site SNCF
#   pageAccueil.Renseigner Les Criteres De Recherche