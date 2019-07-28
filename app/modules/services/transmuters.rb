module Transmuters
    def transmute_user_phone_number(user_phone_number)
        if user_phone_number[0..3] == "0048"
          polish_local_area_codes = ['12', '13', '14', '15', '16', '17', '18', '22', '23', '24', '25', '29', '32',
            '33', '34', '41', '42', '43', '44', '46', '48', '52', '54', '55', '56', '58',
            '59', '61', '62', '63', '65', '67', '68', '71', '74', '75', '76', '77', '81',
            '82', '83', '84', '85', '86', '87', '89', '91', '94', '95']
          user_phone_number = user_phone_number[4..-1]
          if user_phone_number.length == 9
            if polish_local_area_codes.include?(user_phone_number[0..1])
              user_phone_number = "(" + user_phone_number[0..1] + ") " + user_phone_number[2..4] + " " + user_phone_number[5..6]+ " " + user_phone_number[7..8]
            else
              user_phone_number = user_phone_number[0..2] + " " + user_phone_number[3..5] + " " + user_phone_number[6..8]
            end
          end
        end
        return user_phone_number
      end

      def create_cipher_key
        cipher = OpenSSL::Cipher.new('AES-256-CBC')
        cipher.encrypt
        key = Base64.encode64(cipher.random_key)
        iv = Base64.encode64(cipher.random_iv)
        salt = SecureRandom.hex(16)
        cipher.update('foo')
        cipher.final
        render json: {
          key: key,
          iv: iv,
          salt: salt
        }
      end   
end