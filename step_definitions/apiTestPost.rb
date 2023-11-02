Given('que faço uma solicitação POST à API local com a URL {string}') do |url|
    @responses ||= []
  
    # Aqui você pode definir o corpo da solicitação em JSON
    request_body = {
      nome: 'carliane',
      endereco: 'rua a',
      email: 'carliane@email.com',
      senha: 'teocaliane',
      telefone: '32467586789'
    }.to_json
  
    @response = HTTParty.post(url, body: request_body, headers: { 'Content-Type' => 'application/json' })
    @responses << @response
  end
  
  Then('o código de status da resposta POST deve ser {int}') do |codigo_esperado|
    expect(@responses.last.code).to eq(codigo_esperado)
  end
  
  Then('nenhuma mensagem de erro deve ser retornada') do
    response = @responses.last
    response_body = JSON.parse(response.body)
    
    if response_body.key?('error_messages') && response_body['error_messages'].any?
      raise "Mensagens de erro encontradas: #{response_body['error_messages'].join(', ')}"
    end

    puts "Código de status: #{response.code}"
    puts "Corpo da resposta: #{response.body}"
  end
  