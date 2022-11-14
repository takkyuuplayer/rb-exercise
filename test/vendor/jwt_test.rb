# frozen_string_literal: true

require 'jwt'
require 'minitest/autorun'

class JwtTest < Minitest::Test
  def test_encode
    payload = { data: 'test' }
    token = JWT.encode payload, nil, 'none'

    assert_equal 'eyJhbGciOiJub25lIn0.eyJkYXRhIjoidGVzdCJ9.', token

    decoded_token = JWT.decode token, nil, false

    a = { data: 'test2' }
    assert_equal a, decoded_token
  end
end
