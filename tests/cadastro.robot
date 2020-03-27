*** Settings ***
Documentation    Cadastro de jogos

Resource    resources/keywords.robot

Suite Setup       Inicia Sessao
Suite Teardown    Encerra Sessao
Test Teardown     Depois do teste

*** Test Cases ***
Cadastrar novo jogo
    [tags]        smoke
    Dado que eu tenho o seguinte produto
    ...     Pitfal    Aventura na selva    19.99    10
    E acesso o portal de cadastro de jogos
    Quando eu faço o cadastro deste item
    Então vejo a mensagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista

Jogo não pode ser duplicado
    Dado que eu tenho o seguinte produto
    ...     Enduro    Clássico de corrida    20.30    40
    E acesso o portal de cadastro de jogos
    Mas este produto já foi cadastrado
    Quando eu faço o cadastro deste item
    Então vejo a mensagem de alerta "Nome já está em uso"

Nome deve ser obrigatório
    [Template]    Tentar Cadastrar
    ${EMPTY}      19.99               10            Nome não pode ficar em branco    

Preço deve ser obrigatório
    [Template]    Tentar Cadastrar
    Pitfal        ${EMPTY}            10            Preco não pode ficar em branco

Quantidade deve ser obrigatório
    [Template]    Tentar Cadastrar
    Pitfal        19.99               ${EMPTY}      Quantidade não pode ficar em branco

*** Keywords ***
Tentar Cadastrar
    [Arguments]    ${nome}    ${preco}    ${qtd}    ${alerta}

    Dado que eu tenho o seguinte produto
    ...                                            ${nome}    Aventura na selva    ${preco}    ${qtd}
    E acesso o portal de cadastro de jogos
    Quando eu faço o cadastro deste item
    Então vejo a mensagem de alerta "${alerta}"


