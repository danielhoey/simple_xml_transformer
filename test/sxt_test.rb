require 'test/unit'
require_relative '../lib/sxt'

class SXTTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end
  #

  def test_basic_selectors
    transform_html = <<~TEXT
      <transform>
        <_input/>
        <_div/>
      </transform>
    TEXT

    sxt = SXT.new(transform_html)
    assert_equal(%w(input div), sxt.selectors)
  end

  def test_surround_element
    return
  input = <<~TEXT
    <input/>
    <sxt:transform>
      <_input>
        <div>
          <__/>
        </div>
      </_input>
    </sxt:transform>
    TEXT

    actual = SXT.transform(input)
    expected = <<~TEXT
      <div>
        <input/>
      </div>
    TEXT
    assert(false, 'Assertion was false.')
  end
end
