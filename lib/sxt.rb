require 'nokogiri'
require 'debug'

class SXT

  def initialize(xml)
    @doc = Nokogiri::XML(xml)
    @transforms_map = {}
    @doc.xpath('//template[@type="sxt"]').each do |transform_element|
      transform_element.elements.each do |element|
        if element.name !~ /^_/
          raise "Element '#{element.name}' in sxt:transform does not have a name starting with '_' (underscore)"
        end

        tag_name = element.name.gsub(/^_/,'')
        @transforms_map[tag_name] = element
      end
    end
  end

  def selectors
    @transforms_map.keys
  end
end
