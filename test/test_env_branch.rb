require_relative 'helper'

module EnvBranch
  class TestVersion < Test::Unit::TestCase
    test 'version' do
      assert do
        !::EnvBranch::VERSION.nil?
      end
    end
  end
end
