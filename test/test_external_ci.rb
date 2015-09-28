require_relative 'helper'

module EnvBranch
  class TestExternalCi < Test::Unit::TestCase
    extend TestHelper

    def self.startup
      stash_env_branch
    end

    def self.shutdown
      restore_env_branch
    end

    sub_test_case 'travis-ci' do
      branch_name = 'your-branch'
      setup do
        ENV['TRAVIS_BRANCH'] = branch_name
      end

      teardown do
        ENV.delete 'TRAVIS_BRANCH'
      end

      test '#branch?' do
        assert do
          EnvBranch.new.branch? == true
        end
      end
      test '#pull_request_id' do
        assert do
          EnvBranch.new.branch_name == branch_name
        end
      end
    end
  end
end
