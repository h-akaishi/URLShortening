require 'net/http'

# 短縮URL作成
def self.generate_uri
  list = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
  short_uri = "https://goo.gl/"+ (0...6).map { list[rand(list.length)] }.join
end

def self.request_uri(uri)
  begin
    response = Net::HTTP.get_response(URI.parse(uri))
  rescue
    raise
  else
    case response
    when Net::HTTPMovedPermanently
      puts uri
    end
  end
end


50.times {
  request_uri(generate_uri)
}


