
		require 'uri'
		require 'net/http'

		url = URI("https://api.ngapps.co.za")

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Post.new(url)
		request["authorization"] = "ve.93*\?S'2ga9V9"
		request["content-type"] = 'application/json'
		request["accept"] = 'application/json'

		request.body = "{\"from\":\"InfoSMS\",\"to\":\"27815631761\",   \"text\":\"Test SMS.\"}"

		response = http.request(request)
		puts response.read_body
