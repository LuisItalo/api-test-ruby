Given('que faço uma solicitação PUT à API local com a URL {string}') do |url|
    @responses ||= []
  
    # Aqui você pode definir o corpo da solicitação em JSON para o PUT
    request_body = {
      nome: 'luis',
      email: 'luis@email.com'
    }.to_json
  
    @response = HTTParty.put(url, body: request_body, headers: { 'Content-Type' => 'application/json' })
    @responses << @response
end
  
Then('o código de status da resposta PUT deve ser {int}') do |codigo_esperado|
  response = @responses.last
  expect(response.code).to eq(codigo_esperado)

  # Suponha que você tenha os dados enviados no corpo da solicitação PUT em uma variável chamada 'request_body'
  request_body = {
    nome: 'luis',
    email: 'luis@email.com'
  }.to_json

  # Exiba o corpo da solicitação PUT
  puts "Corpo da solicitação PUT: #{request_body}"

  response_data = JSON.parse(response.body)

  # Agora você pode comparar os campos atualizados com os dados enviados
  request_data = JSON.parse(request_body)

  # Itere pelos campos para verificar o que foi atualizado
  updated_fields = {}
  request_data.each do |key, value|
    if response_data[key.to_s] != value
      updated_fields[key] = response_data[key.to_s]
    end
  end

  if updated_fields.empty?
    puts "Nenhum campo foi atualizado na resposta."
  else
    puts "Campos atualizados na resposta:"
    updated_fields.each { |key, value| puts "#{key}: #{value}" }
  end

  puts "Código de status: #{response.code}"
  puts "Corpo da resposta atualizada: #{response.body}"
end

  
  
  
  
  
  
  