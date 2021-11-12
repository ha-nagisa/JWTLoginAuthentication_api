ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# gem minitest-reporters
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase

  # プロセスが分岐した直後に呼び出し
  parallelize_setup do |worker|
    load "#{Rails.root}/db/seeds.rb"
  end

  # 並列テストの有効化・無効化
  parallelize(workers: :number_of_processors)

  # アクティブなユーザーを返す
  def active_user
    User.find_by(activated: true)
  end
end
