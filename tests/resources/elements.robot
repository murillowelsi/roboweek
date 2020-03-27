*** Variables ***
${CAMPO_NOME}          id:produto_nome
${CAMPO_DESC}          id:produto_descricao
${CAMPO_PRECO}         id:produto_preco 
${CAMPO_QTD}           id:produto_quantidade 
${BT_CRIAR_PRODUTO}    xpath://input[@value='Criar Produto']
${ALERTA_SUCESSO}      css:div[role=alert]
${ALERTA_FALHA}        class:alert-danger
${LISTA_JOGOS}         css:table tbody