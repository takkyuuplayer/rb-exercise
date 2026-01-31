# frozen_string_literal: true

require 'active_model'
require 'minitest/autorun'

class ActiveModelTest < Minitest::Test
  class User
    include ActiveModel::Model
    attr_accessor :email, :password

    validates :email, presence: true
    validates :password, presence: true
  end

  def test_methods
    user = User.new(email: 'test@example.com', password: 'password')

    assert user.valid?
    assert_equal user.slice(:email, :password), { 'email' => 'test@example.com', 'password' => 'password' }
  end
end
