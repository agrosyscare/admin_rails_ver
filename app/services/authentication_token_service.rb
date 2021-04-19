class AuthenticationTokenService
  ALGORITHM_TYPE = 'RS512'
  RSA_PRIVATE = OpenSSL::PKey::RSA.generate 2048
  RSA_PUBLIC = RSA_PRIVATE.public_key

  def self.encode(user_id)
    exp = Time.now.to_i + 4 * 3600
    payload = { user_id: user_id, exp: exp }
    JWT.encode payload, RSA_PRIVATE, ALGORITHM_TYPE
  end

  def self.decode(token)
    decoded_token = JWT.decode token, RSA_PUBLIC, true, { algorithm: ALGORITHM_TYPE }
    decoded_token[0]['user_id']
  rescue JWT::ExpiredSignature
    ''
  end
end
