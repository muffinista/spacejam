require "spacejam/version"
require 'curl'

module Spacejam
  require 'spacejam/http_check'
  class << self
    def check(*args)
      Spacejam::HTTPCheck.new(*args)
    end

    def online?(*args)
      Spacejam::HTTPCheck.new(*args).online?
    end
  end
end
