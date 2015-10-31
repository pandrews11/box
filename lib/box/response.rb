require 'json'

module Box
  class Response

    attr_reader :data, :error

    def self.for(data)
      new(JSON.parse(data))
    end

    def initialize(data)
      @data = data

      unless success?
        @error = Error.for data['code']
      end
    end

    def success?
      data['stat'] == 'ok'
    end

    def error?
      !success?
    end

    def result
      data['result']
    end

    def message
      data['message']
    end
  end
end
