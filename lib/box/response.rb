require 'json'

module Box
  class Response

    attr_reader :data

    def self.for(data)
      new(JSON.parse(data))
    end

    def initialize(data)
      @data = data
    end

    def success?
      data['stat'] == 'ok'
    end

    def result
      data['result']
    end

    def method_missing(method_sym, *arguments, &block)
      if result[method_sym.to_s]
        return result[method_sym.to_s]
      end

      super
    end
  end
end
