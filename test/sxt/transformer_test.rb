require 'test/unit'
require_relative '../../lib/sxt'

class SXT::TemplateTest < Test::Unit::TestCase
  def test_replace_tag
    t = SXT::Transformer.new("<__/>")
    assert_not_nil(t.replacement_tag)
    assert("foobar", t.execute("foobar"))
  end
end
