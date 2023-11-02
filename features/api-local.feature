Feature: Verificação de código de status da API local

  @get
  Scenario: Verificar o código de status da API com a 
    Given que faço uma solicitação à API local com a URL "http://localhost:3000/api/clientes"
    Then verifico o código de status e mensagens de erro da resposta

  @post
  Scenario: Enviar uma solicitação POST à API local com sucesso
    Given que faço uma solicitação POST à API local com a URL "http://localhost:3000/api/clientes"
    Then o código de status da resposta POST deve ser 201
    And nenhuma mensagem de erro deve ser retornada

  @put
  Scenario: Atualizar um recurso na API local
    Given que faço uma solicitação PUT à API local com a URL "http://localhost:3000/api/clientes/5"
    Then o código de status da resposta PUT deve ser 200    

  @delete
  Scenario: Deletar um recurso na API local
    Given que faço uma solicitação DELETE à API local com a URL "http://localhost:3000/api/clientes/1"
    Then o código de status da resposta DELETE deve ser 204
