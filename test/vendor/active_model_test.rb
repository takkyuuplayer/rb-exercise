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

    assert_predicate user, :valid?
    assert_equal({ 'email' => 'test@example.com', 'password' => 'password' }, user.slice(:email, :password))
  end
end
