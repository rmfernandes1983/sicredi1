*** Settings ***
Documentation       Testes da Api GET /sicredi

Resource        ../resources/services.robot

*** Test Cases ***
Obter valor simulacao poupanca sicredi

    ${simulacao}=           Get Sicredi

    Status Should Be        200     ${simulacao}