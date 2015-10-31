require 'json'

module Box
  class Response

    attr_reader :opts

    def self.for(opts)
      new(JSON.parse(opts))
    end

    def initialize(opts)
      @opts = opts
    end

    def success?
      opts['stat'] == 'ok'
    end

    def result
      opts['result']
    end

    def method_missing(method_sym, *arguments, &block)
      if result[method_sym.to_s]
        return result[method_sym.to_s]
      end

      super
    end
  end
end
