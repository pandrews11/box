module Box
  class Station

    attr_reader :opts, :user

    def self.create(opts)
      new(opts, user)
    end

    def initialize(opts)
      @opts = opts
    end

    def rename(name)
      opts.merge :stationName => name
      Server.post rename_params, opts, rename_request_ops

    end

    private

    def method_missing(method_sym, *arguments, &block)
      opts[method_sym.to_s]
    end

    def rename_request_ops
      { :encrypt => true, :secure => false }
    end

    def rename_params
      {
        :method => 'station.renameStation',
        :user_id => user.userId,
        :partner_id => user.partner.partnerId,
        :auth_token => user.userAuthToken
      }
    end

    def opts
      {
        :userAuthToken => user.userAuthToken,
        :syncTime => Time.now.to_i - user.sync_time,
        :stationToken => stationToken
      }
    end

  end
end