require 'httparty'


Given('que faço uma solicitação à API local com a URL {string}') do |url|
  @responses ||= []
  @response = HTTParty.get(url)
  @responses << @response
end

Then('verifico o código de status e mensagens de erro da resposta') do
  response = @responses.last
  expect([200, 404, 500]).to include(response.code)  # Verifique se o código de status é 200, 404 ou 500

  response_body = response.body
  response_data = JSON.parse(response_body)

  if response_data.is_a?(Array)
    response_data.each do |data|
      if data.key?('error_messages') && data['error_messages'].any?
        puts 'Mensagens de erro encontradas:'
        data['error_messages'].each { |error| puts error }
      else
        puts 'Nenhuma mensagem de erro encontrada.'
      end
    end
  end

  puts "Código de status: #{response.code}"
  puts "Corpo da resposta: #{response.body}"
end
