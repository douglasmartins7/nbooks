#language:pt

Funcionalidade: Cadastro de usuário

    @smoke
    Cenário: Novo usuário
    
        Dado que o cliente informou seus dados cadastrais:
            | name     | Douglas Santos       |
            | email    | douglasteste@com.br  |
            | password | 1234567              |
        Quando faço uma requisição POST para o serviço accounts
        Então o código de resposta deve ser "202"

    @duplicado
    Cenário: Não permite email duplicado

        Dado que o cliente informou seus dados cadastrais:
            | name     | Fernando Duplicado        |
            | email    | fernandotduplicado@com.br |
            | password | 123456                    |
        Mas esse cliente já está cadastrado
        Quando faço uma requisição POST para o serviço accounts
        Então o código de resposta deve ser "409"
        E deve ser exibido um JSON com a mensagem:
        """
        O e-mail informado, ja está cadastrado!
        """
    
    @tentativas
    Esquema do Cenário: Dado deve ser obrigatório

        Dado que o cliente informou seus dados cadastrais:
            | name     | <name>              |
            | email    | <email>             |
            | password | <password>          |
        Quando faço uma requisição POST para o serviço accounts
        Então o código de resposta deve ser "409"
        E deve ser exibido um JSON com a mensagem:
        """
        <mensagem>
        """

    Exemplos: 
        | name             | email                  | password  | mensagem                     |
        |                  | douglasteste@com.br    | 1234567   |  Nome deve ser obrigatório!  |
        | Diego Valenzuela |                        | 123456789 |  Email deve ser obrigatório! |
        | joao Luiz        | joaoluiz@teste.com.br  |           |  Senha deve ser obrigatório! |