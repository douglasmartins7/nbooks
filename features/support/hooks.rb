

After do |scenario|

    if scenario.failed?
        puts "REQUEST=> #{@request.to_json}"
        puts "RESPONSE=> #{@result.parsed_response.to_json}"
    end

    #puts @result.parsed_response if scenario.failed?
    #puts @request.to_json if scenario.failed?
end