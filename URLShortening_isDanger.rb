require 'net/http'

# 短縮URL作成
def generate_uri
  list = [*'a'..'z', *'A'..'Z', *'0'..'9']
  short_uri = "https://goo.gl/"+ 6.times.map { list.sample }.join
end

def request_uri(uri)
  response = Net::HTTP.get_response(URI.parse(uri))

  case response
  when Net::HTTPMovedPermanently
    puts uri
  end
end


50.times {
  request_uri(generate_uri)
}


