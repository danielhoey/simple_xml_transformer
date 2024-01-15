require 'nokogiri'

class SXT::Transformer
  def initialize(html)
    @doc = Nokogiri::HTML(html)
  end
end
