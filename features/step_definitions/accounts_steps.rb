#encoding: utf-8

Dado("que o cliente informou seus dados cadastrais:") do |table|
    @request = table.rows_hash
    remove_account(@request)
end

Dado("esse cliente já está cadastrado") do
    steps %{
        Quando faço uma requisição POST para o serviço accounts
    }
end

Quando("faço uma requisição POST para o serviço accounts") do
    puts "text: #{@request}"   
    @result =  HTTParty.post(
        'http://nbooks.herokuapp.com/api/accounts',
        body: @request
    )
end

Então("o código de resposta deve ser {string}") do |status_code|
  expect(
      @result.response.code
  ).to eql status_code
end

Então("deve ser exibido um JSON com a mensagem:") do |mensagem|
    expect(
        @result.parsed_response['message']
    ).to eql mensagem
end