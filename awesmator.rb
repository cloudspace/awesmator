

module Awesmator
  def awesmate(awesm_api_key, uri, share_type="other", create_type="api", domain="awe.sm")
    parameters =
      { :version => 1,
        :target => uri,
        :api_key => awesm_api_key,
        :share_type => share_type,
        :create_type => create_type,
        :domain => domain }
    case response = awesm_create_post_call(parameters)
    when Net::HTTPSuccess
      awesm = Hash.from_xml(response.body)['url']
      return awesm['awesm_url']
    when Net::HTTPClientError
      response = awesm_create_post_call(parameters)
      if Net::HTTPSuccess
        awesm = Hash.from_xml(response.body)['url']
        return awesm['awesm_url']
      else
        uri
      end
    else
      uri
    end
  end

  def lookup(awesm_api_key, stub, domain="awe.sm")
	  parameters =
      { :version => 1,
        :api_key => awesm_api_key,
        :domain => domain }
    url = "/url/#{stub}.xml"
    case response = awesm_get_call(url, parameters)
    when Net::HTTPSuccess
      Hash.from_xml(response.body)
    when Net::HTTPClientError
      response = awesm_get_call(url, parameters)
      if Net::HTTPSuccess
        Hash.from_xml(response.body)
      else
        uri
      end
    else
      uri
    end
  end
  
  protected
    def awesm_create_post_call parameters
      response = Net::HTTP.start('create.awe.sm') do |http|
        request = Net::HTTP::Post.new('/url.xml')
        request.form_data = parameters
        http.request(request)
      end      
    end
    def awesm_get_call(url, parameters)
      response = Net::HTTP.start('create.awe.sm') do |http|
        request = Net::HTTP::Get.new(url)
        request.form_data = parameters
        http.request(request)
      end      
    end

end