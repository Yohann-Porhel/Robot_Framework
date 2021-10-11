#coding utf-8
*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BOUTON_RECHERCHER}=           xpath://*[@class='block-search-home-itinerary-submit']//button


*** Keywords ***
Ouvrir Le Site SNCF
    [Documentation]  Parcours permettant d'accéder au site SNCF

    Open Browser    url=https://www.sncf.com/fr     browser=googlechrome
    SeleniumLibrary.Maximize Browser Window
    Page Should Contain     Menu
    Log     JE SUIS SUR LA PAGE DE LA SNCF

    # Tester la présence de la banière des cookies (si ${TRUE} : on clique sur le bouton "Accepter")
    ${presenceBandeauCookies}=      Run Keyword And Return Status       Wait Until Element Is Visible       id:CookieContentBanner      timeout=3s
    IF      ${presenceBandeauCookies}
        Click Button    id:CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
    END

Renseigner Les Criteres De Recherche
    [Documentation]  Renseigner les villes et valider

    # Renseigner les villes de departs et d'arrivees puis valider
    Input Text      id:departure-place      Rennes (Toutes gares)
    Input Text      id:arrival-place        Brest (Toutes gares)
    Click Element       ${BOUTON_RECHERCHER}
    Log  PARCOURS DE LA PAGE D ACCUEIL TERMINE
