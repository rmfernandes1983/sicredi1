*** Settings ***
Documentation       Testes da Api POST /siumularpoupanca

Resource        ../resources/services.robot

*** Test Cases ***
Simular Investimento Poupanca

    ${payload}=       Get Json              simupoup.json
    ${resp}=          Post Sicredi          ${payload}        

    Status Should Be    200         ${resp}