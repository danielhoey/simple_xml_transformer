require 'test/unit'
require_relative '../../lib/sxt'

class SXT::TemplateTest < Test::Unit::TestCase
  def test_basic_selectors
    template_html = <<~TEXT
      <template type="sxt">
        <_input/>
        <_div/>
      </template>
    TEXT

    sxt = SXT::Template.new(template_html)
    assert_equal(%w(input div), sxt.selectors)
  end

  def test_surround_element
return
    input = <<~TEXT
      <input/>
      <template type="sxt">
        <_input>
          <div>
            <__/>
          </div>
        </_input>
      </template>
    TEXT

    sxt = SXT.new(input)
    t = sxt.transforms[0]
    assert_equal('input', t.selector)
    assert_equal('input', t.selector)
    
    expected = <<~TEXT
      <div>
        <input/>
      </div>
    TEXT
    assert(false, 'Assertion was false.')
  end
end
