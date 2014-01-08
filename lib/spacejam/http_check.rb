module Spacejam
  class HTTPCheck
    attr_accessor :url, :response_code, :body, :result, :reason
    def initialize(opts={})
      if opts.is_a?(String)
        opts = {
          url: opts
        }
      end

      opts = {
        response_code: 200,
        body: nil
      }.merge(opts)

      @url = opts[:url]
      @response_code = to_regexp(opts[:response_code])
      @body = to_regexp(opts[:body])
    end
    
    def online?
      @reason = nil
      @result = Curl::Easy.perform(@url)

      if @response_code && @response_code.match(@result.response_code.to_s) == nil
        @reason = :response_code
        return false
      end

      if @body && @result.body_str.match(@body) == nil
        @reason = :body
        return false
      end

      true
    rescue
      @reason = :error
      false
    end

    protected
    def to_regexp(s)
      return if !s
      if ! s.is_a?(Regexp)
        s = Regexp.compile(s.to_s)
      end
      s
    end
  end
end
