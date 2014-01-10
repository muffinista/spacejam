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

    def is_spacejam_online?
      Spacejam::HTTPCheck.new(url:"http://www2.warnerbros.com/spacejam/movie/jam.htm", body:"<title>Space Jam</title>").online?
    end
  end
end
