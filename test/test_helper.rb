require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'
require 'watir-webdriver'

require File.expand_path('jsmicroblog.rb')

module TestHelper
  include Rack::Test::Methods
  def app() JSMicroblog end

  def browser
    @browser ||= Watir::Browser.new
  end

  def visit(url)
    url = 'http://localhost:9292/' if url == :homepage
    url = "http://locahost:9292" + url if url.start_with?("/")

    browser.goto url
  end

  def teardown
    @browser.close
  end

end

