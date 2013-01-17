class Rest
  attr_accessor :body,
                :header,
                :content_type,
                :base_domain,
                :uri

  def initialize
    @body = nil
    @header ||= {}
    @content_type = 'application/xml'
    @base_domain = nil
    @uri = nil
  end

  def make_http_request(verb, endpoint)
    @uri = URI.parse "#{self.base_domain}#{endpoint}#{$format}"
    http = Net::HTTP.new(@uri.host, @uri.port)

    case verb
      when 'GET'
        request = Net::HTTP::Get.new(@uri.request_uri)
    end

    http.request(request)
  end
end