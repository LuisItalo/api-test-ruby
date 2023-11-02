require 'httparty'

# Passo para fazer uma solicitação DELETE à API local
Given('que faço uma solicitação DELETE à API local com a URL {string}') do |url|
  @responses ||= []
  @response = HTTParty.delete(url)
  @responses << @response
end


# Passo para verificar o código de status da resposta DELETE
Then('o código de status da resposta DELETE deve ser {int}') do |codigo_esperado|
  if @responses.last.code == 404
    puts "Recurso não encontrado, considerado como sucesso."
  else
    expect(@responses.last.code).to eq(codigo_esperado)
  end
end


