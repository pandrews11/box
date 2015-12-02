module Box
  module Error

    def self.for(code)
      {
        '0' => 'INTERNAL_ERROR',
        '1' => 'MAINTENANCE_MODE',
        '2' => 'URL_PARAM_MISSING_METHOD',
        '3' => 'URL_PARAM_MISSING_AUTH_TOKEN',
        '4' => 'URL_PARAM_MISSING_PARTNER_ID',
        '5' => 'URL_PARAM_MISSING_USER_ID',
        '6' => 'SECURE_PROTOCOL_REQUIRED',
        '7' => 'CERTIFICATE_REQUIRED',
        '8' => 'PARAMETER_TYPE_MISMATCH',
        '9' => 'PARAMETER_MISSING',
        '10' => 'PARAMETER_VALUE_INVALID',
        '11' => 'API_VERSION_NOT_SUPPORTED',
        '12' => 'LICENSING_RESTRICTIONS',
        '13' => 'INSUFFICIENT_CONNECTIVITY',
        '14' => 'Unknown method name?',
        '15' => 'Wrong protocol (http/https)?',
        '1000' => 'READ_ONLY_MODE',
        '1001' => 'INVALID_AUTH_TOKEN',
        '1002' => 'INVALID_PARTNER_LOGIN',
        '1003' => 'LISTENER_NOT_AUTHORIZED',
        '1004' => 'USER_NOT_AUTHORIZED',
        '1005' => 'MAX_STATIONS_REACHED',
        '1006' => 'STATION_DOES_NOT_EXIST',
        '1007' => 'COMPLIMENTARY_PERIOD_ALREADY_IN_USE',
        '1008' => 'CALL_NOT_ALLOWED',
        '1009' => 'DEVICE_NOT_FOUND',
        '1010' => 'PARTNER_NOT_AUTHORIZED',
        '1011' => 'INVALID_USERNAME',
        '1012' => 'INVALID_PASSWORD',
        '1013' => 'USERNAME_ALREADY_EXISTS',
        '1014' => 'DEVICE_ALREADY_ASSOCIATED_TO_ACCOUNT',
        '1015' => 'UPGRADE_DEVICE_MODEL_INVALID',
        '1018' => 'EXPLICIT_PIN_INCORRECT',
        '1020' => 'EXPLICIT_PIN_MALFORMED',
        '1023' => 'DEVICE_MODEL_INVALID',
        '1024' => 'ZIP_CODE_INVALID',
        '1025' => 'BIRTH_YEAR_INVALID',
        '1026' => 'BIRTH_YEAR_TOO_YOUNG',
        '1027' => 'INVALID_COUNTRY_CODE or INVALID_GENDER ',
        '1034' => 'DEVICE_DISABLED',
        '1035' => 'DAILY_TRIAL_LIMIT_REACHED',
        '1036' => 'INVALID_SPONSOR',
        '1037' => 'USER_ALREADY_USED_TRIAL',
        '1039' => 'PLAYLIST_EXCEEDED'
      }[code.to_s]
    end

  end
end
