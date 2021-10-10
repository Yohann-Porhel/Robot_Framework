#coding utf-8
*** Settings ***
Library     SeleniumLibrary


***Variables***
${BOUTON_ACCEPTER_COOKIES}=     xpath://*[@class='agree-button btn btn-small cookies-btn-accept']
${BOUTON_RECHERCHER}=           xpath://*[@class='block-search-home-itinerary-submit']//button


*** Keywords ***
Ouvrir Le Site SNCF
    [Documentation]  Parcours permettant d'accéder au site SNCF

    Open Browser            url=https://www.sncf.com/fr     browser=googlechrome
    SeleniumLibrary.Maximize Browser Window
    Page Should Contain     Menu
    Log     JE SUIS SUR LA PAGE DE LA SNCF

Renseigner Les Criteres De Recherche
    [Documentation]  Renseigner les villes et valider

    # Tester la presence du bouton afin d'accepter les cookies (si TRUE : on clique dessus)
    ${presenceBandeauCookies}=    Run Keyword And Return Status     Page Should Contain Element     ${BOUTON_ACCEPTER_COOKIES}
    IF      ${presenceBandeauCookies}
        Click Button        ${BOUTON_ACCEPTER_COOKIES}
    END

    # Renseigner les villes de departs et d'arrivees puis valider
    Input Text      id:departure-place      Rennes (Toutes gares)
    Input Text      id:arrival-place        Brest (Toutes gares)
    Click Element       ${BOUTON_RECHERCHER}
    Log  PARCOURS DE LA PAGE D ACCUEIL TERMINE
