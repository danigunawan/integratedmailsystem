module EncryptionHelper
  def self.init
    @cipher = OpenSSL::Cipher::Cipher.new("aes-256-cbc")

    File.open(Rails.root.join('private', 'pgas.key'), 'r') do |file|
      while line = file.gets
        @key = line if line.length > 0
        break if line.length > 0
      end
    end

    File.open(Rails.root.join('private', 'pgas.iv'), 'r') do |file|
      while line = file.gets
        @iv = line if line.length > 0
        break if line.length > 0
      end
    end

    @cipher.key = @key
    @cipher.iv = @iv
  end

  def self.encode(text)
    @cipher.encrypt
    encrypted = cipher.update(text)
    encrypted << cipher.final
    return encrypted
  end

  def self.decode(encrypted)
    @cipher.decrypt
    decrypted = cipher.update(encrypted)
    decrypted << cipher.final
    return decrypted
  end
end