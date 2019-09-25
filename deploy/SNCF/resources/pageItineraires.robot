#coding utf-8

*** Settings ***

Library  SeleniumLibrary

*** Keywords ***

Cliquer Sur Le Voyage
    [Documentation]  Selectionner le voyage

    Click Element  class=results-item