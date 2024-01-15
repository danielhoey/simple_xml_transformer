require 'nokogiri'
require_relative './transformer'

class SXT::Template
  def initialize(xml)
    @doc = Nokogiri::XML(xml)
    @transforms_map = {}
    @doc.xpath('//template[@type="sxt"]').each do |transform_element|
      transform_element.elements.each do |element|
        if element.name !~ /^_/
          raise "Element '#{element.name}' in sxt:transform does not have a name starting with '_' (underscore)"
        end

        tag_name = element.name.gsub(/^_/,'')
        @transforms_map[tag_name] = SXT::Transformer.new(element)
      end
    end
  end

  def selectors
    @transforms_map.keys
  end

  def transform(html)
    html_doc = Nokogiri::HTML(xml)
    @transforms_map.each do |tag_name, transformer|
      html_doc.css(tag_name).each do |element|
        transformer.execute(element)
      end
    end

    return html_doc.to_s
  end
end
