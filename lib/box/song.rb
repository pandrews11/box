module Box
  class Song

    attr_reader :data

    def self.create(data)
      new(data)
    end

    def  initialize(data)
      @data = data
    end

    def method_missing(method_sym, *arguments, &block)
      data[method_sym.to_s]
    end

  end
end