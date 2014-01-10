require 'test_helper'

class SpacejamTest < MiniTest::Test
  def test_online_works
    assert Spacejam.online?('http://www.google.com/')
  end

  def test_works_with_string
    @checker = Spacejam.check('http://www.google.com/')
    assert @checker.online?   
  end

  def test_works_with_hash
    @checker = Spacejam.check(url:'http://www.google.com/')
    assert @checker.online?
  end

  def test_works_with_hash_and_response_code
    @checker = Spacejam.check(url:'http://www.google.com/', response_code:200)
    assert @checker.online?
  end

  def test_works_with_hash_and_bad_response_code
    @checker = Spacejam.check(url:'http://www.google.com/', response_code:555)
    assert !@checker.online?
    assert @checker.reason == :response_code
  end

  def test_works_with_bad_host
    @checker = Spacejam.check('http://foobar.loc/')
    assert !@checker.online?
    assert @checker.reason == :error
  end

  def test_works_with_bad_path
    @checker = Spacejam.check('http://www.google.com/weird.html')
    assert !@checker.online?
    assert @checker.reason == :response_code
  end

  def test_works_with_response_code_as_regex
    @checker = Spacejam.check(url:'http://www.google.com/', response_code:Regexp.new('200'))
    assert @checker.online?
  end

  def test_works_with_body
    @checker = Spacejam.check(url:'http://www.google.com/', body:"Google has many special features to help you find exactly what you're looking for")
    assert @checker.online?
  end

  def test_works_with_body_as_regex
    @checker = Spacejam.check(url:'http://www.google.com/', body:Regexp.new("Google has many special features to help you find exactly what you're looking for"))
    assert @checker.online?
  end

  def test_works_with_body_as_regex
    @checker = Spacejam.check(url:'http://www.google.com/', body:Regexp.new("Yahoo"))
    assert !@checker.online?
    assert @checker.reason == :body
  end
  
end

