require 'test/unit'

class SXTTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def test_fail
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
