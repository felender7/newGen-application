
		require 'uri'
		require 'net/http'

		url = URI("https://api.infobip.com/sms/1/text/single")

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Post.new(url)
		request["authorization"] = 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='
		request["content-type"] = 'application/json'
		request["accept"] = 'application/json'

		request.body = "{\"from\":\"InfoSMS\",\"to\":\"27814075744\",   \"text\":\"Test SMS.\"}"

		response = http.request(request)
		puts response.read_body
