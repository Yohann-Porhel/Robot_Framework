#coding utf-8

*** Settings ***

Library  SeleniumLibrary

***Variables***

${BOUTON_ACCEPTER_COOKIES}  //*[@class='agree-button btn btn-small cookies-btn-accept']
${BOUTON_RECHERCHER}        //*[@class='block-search-home-itinerary-submit']//button

*** Keywords ***

Ouvrir Le Site SNCF
  [Documentation]  Parcours permettant d'accéder au site SNCF

  Open Browser  https://www.sncf.com/fr
  Page Should Contain  Menu
  Log  JE SUIS SUR LA PAGE DE LA SNCF

Renseigner Les Criteres De Recherche
  [Documentation]  Renseigner les villes et valider

  # Tester la presence du bouton afin d'accepter les cookies (si TRUE : on clique dessus)
  ${presenceBandeauCookies}=  Run Keyword And Return Status  Page Should Contain Element  ${BOUTON_ACCEPTER_COOKIES}
  Run Keyword If  '${presenceBandeauCookies}'=='${TRUE}'     Click Button  ${BOUTON_ACCEPTER_COOKIES}

  # Renseigner les villes de departs et d'arrivees puis valider
  Input Text  id=departure-place  Rennes
  Input Text  id=arrival-place    Brest
  Click Element  ${BOUTON_RECHERCHER}
  Log  PARCOURS DE LA PAGE D ACCUEIL TERMINE
