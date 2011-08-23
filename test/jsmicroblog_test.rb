require 'test/test_helper'

class TestJSMicroblog < Test::Unit::TestCase
  include TestHelper

  def test_homepage
    visit :homepage
    browser.text.include? "The JSMicroblog"
  end
end

