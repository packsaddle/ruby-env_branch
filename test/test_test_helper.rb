require_relative 'helper'

# CAUTION: DO NOT ADD encrypted value!
#          test/test_test_helper.rb asserts ENV.
#          And this will show ENV accidentally in CI log.

module EnvBranch
  class TestTestHelperInclude < Test::Unit::TestCase
    include ::EnvBranch::TestHelper

    def self.startup
      @actual_original_travis_branch = ENV['TRAVIS_BRANCH']
      ENV.delete 'TRAVIS_BRANCH'
    end

    def self.shutdown
      ENV['TRAVIS_BRANCH'] = @actual_original_travis_branch
    end

    sub_test_case 'stash and restore' do
      expected = 'example1'
      setup do
        ENV['TRAVIS_BRANCH'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_BRANCH'
      end
      test 'stash and restore env_branch' do
        stash_env_branch
        restore_env_branch
        assert do
          ENV['TRAVIS_BRANCH'] == expected
        end
      end
    end

    sub_test_case 'stash' do
      expected = 'example2'
      setup do
        ENV['TRAVIS_BRANCH'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_BRANCH'
      end
      test 'stash env_branch' do
        stash_env_branch
        assert do
          ENV['TRAVIS_BRANCH'].nil?
        end
      end
    end

    sub_test_case 'restore' do
      expected = 'example3'
      setup do
        ENV['TRAVIS_BRANCH'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_BRANCH'
      end
      test 'restore env_branch' do
        restore_env_branch
        assert do
          ENV['TRAVIS_BRANCH'].nil?
        end
      end
    end
  end

  class TestTestHelperModule < Test::Unit::TestCase
    def self.startup
      @actual_original_travis_branch = ENV['TRAVIS_BRANCH']
      ENV.delete 'TRAVIS_BRANCH'
    end

    def self.shutdown
      ENV['TRAVIS_BRANCH'] = @actual_original_travis_branch
    end

    sub_test_case 'stash and restore' do
      expected = 'example1'
      setup do
        ENV['TRAVIS_BRANCH'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_BRANCH'
      end
      test 'stash and restore env_branch' do
        ::EnvBranch::TestHelper.stash_env_branch
        ::EnvBranch::TestHelper.restore_env_branch
        assert do
          ENV['TRAVIS_BRANCH'] == expected
        end
      end
    end

    sub_test_case 'stash' do
      expected = 'example2'
      setup do
        ENV['TRAVIS_BRANCH'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_BRANCH'
      end
      test 'stash env_branch' do
        ::EnvBranch::TestHelper.stash_env_branch
        assert do
          ENV['TRAVIS_BRANCH'].nil?
        end
      end
    end

    sub_test_case 'restore' do
      expected = 'example3'
      setup do
        ENV['TRAVIS_BRANCH'] = expected
      end
      teardown do
        ENV.delete 'TRAVIS_BRANCH'
      end
      test 'restore env_branch' do
        ::EnvBranch::TestHelper.restore_env_branch
        assert do
          ENV['TRAVIS_BRANCH'].nil?
        end
      end
    end
  end
end
