*** Settings ***
Documentation       Aqui nós vamos encapsular algumas chamadas de serviços

Library         RequestsLibrary
Library         Collections
Library         OperatingSystem

#Library         libs/db.py

*** Keywords ***
### Helprs
Get Json
    [Arguments]         ${json_file}

    ${file}=            Get File            ${EXECDIR}/resources/fixtures/${json_file}
    ${json}=            evaluate            json.loads($file)        json

    [return]            ${json}

### Keywords
Get Sicredi
    Create Session      sicredi          http://5b847b30db24a100142dce1b.mockapi.io/api/v1

    ${resp}=            Get Request   sicredi      /simulador

    [return]            ${resp}

Post Sicredi
    [Arguments]         ${payload}

    Create Session      sicredi          https://www.sicredi.com.br/acao/simulador_investimento_poupanca

    &{headers}=         Create Dictionary     Content-Type=application/x-www-form-urlencoded

    ${resp}=            Post Request   sicredi      /simular        data=${payload}         headers=${headers}

    [return]            ${resp}

