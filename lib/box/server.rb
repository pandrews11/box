module Box
  class Server

    def self.post(params, opts, request_options)
      Response.for(Request.for params, opts, request_options)
    end

  end
end