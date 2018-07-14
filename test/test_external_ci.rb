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
      test '#branch_name' do
        assert do
          EnvBranch.new.branch_name == branch_name
        end
      end
    end

    sub_test_case 'circle-ci' do
      branch_name = 'your-branch'
      setup do
        ENV['CIRCLE_BRANCH'] = branch_name
      end

      teardown do
        ENV.delete 'CIRCLE_BRANCH'
      end

      test '#branch?' do
        assert do
          EnvBranch.new.branch? == true
        end
      end
      test '#branch_name' do
        assert do
          EnvBranch.new.branch_name == branch_name
        end
      end
    end

    sub_test_case 'bitrise' do
      branch_name = 'your-branch'
      setup do
        ENV['BITRISE_GIT_BRANCH'] = branch_name
      end

      teardown do
        ENV.delete 'BITRISE_GIT_BRANCH'
      end

      test '#branch?' do
        assert do
          EnvBranch.new.branch? == true
        end
      end
      test '#branch_name' do
        assert do
          EnvBranch.new.branch_name == branch_name
        end
      end
    end

    sub_test_case 'GitHub pull request builder plugin' do
      branch_name = 'your-branch'
      setup do
        ENV['ghprbSourceBranch'] = branch_name
      end

      teardown do
        ENV.delete 'ghprbSourceBranch'
      end

      test '#branch?' do
        assert do
          EnvBranch.new.branch? == true
        end
      end
      test '#branch_name' do
        assert do
          EnvBranch.new.branch_name == branch_name
        end
      end
    end

    sub_test_case 'Git plugin' do
      branch_name = 'your-branch'
      setup do
        ENV['GIT_BRANCH'] = branch_name
      end

      teardown do
        ENV.delete 'GIT_BRANCH'
      end

      test '#branch?' do
        assert do
          EnvBranch.new.branch? == true
        end
      end
      test '#branch_name' do
        assert do
          EnvBranch.new.branch_name == branch_name
        end
      end
    end
  end
end
