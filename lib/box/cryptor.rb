require 'crypt/blowfish'

module Box
  class Cryptor

    def self.encrypt(data)
      binary_arry = data.force_encoding(Encoding::BINARY).scan(/.{1,8}/)

      binary_arry.map! do |byte|
        pad(byte, 8)
      end

      binary_arry.map! do |byte|
        encode.encrypt_block(byte).unpack('H*').first
      end

      binary_arry.join('')
    end

    def self.decrypt(data)
      binary_arry = data.force_encoding(Encoding::BINARY).scan(/.{1,16}/)

      binary_arry.map! do |byte|
        pad([byte].pack('H*'), 8)
      end

      binary_arry.each do |byte|
        decode.decrypt_block(byte)
      end.join('')

    end

    def self.encode
      Crypt::Blowfish.new '2%3WCL*JU$MP]4'
    end

    def self.decode
      Crypt::Blowfish.new 'U#IO$RZPAB%VX2'
    end

    private

    def self.pad(data, length)
      data + ("\0" * [length - data.length, 0].max)
    end

  end
end
