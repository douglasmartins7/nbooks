
module Helpers
    def remove_account(user)
        #garante que meu usuário será deletado antes de inserir
        HTTParty.delete("http://nbooks.herokuapp.com/api/accounts/#{user['email']}")
    end
end