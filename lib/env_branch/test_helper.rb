module EnvBranch
  # Test helper for branch with environment variables
  module TestHelper
    module_function

    # Stash original environment variables for branch.
    # And delete for testing.
    #
    # @example with test-unit
    #   require 'env_branch/test_helper'
    #
    #   class TestExample < Test::Unit::TestCase
    #     extend ::EnvBranch::TestHelper
    #
    #     def self.startup
    #       stash_env_branch
    #     end
    #   end
    #
    # @return [void]
    #
    # @see Base#fetch_branch_name
    def stash_env_branch
      @original_travis_branch = ENV['TRAVIS_BRANCH']
      @original_circle_branch = ENV['CIRCLE_BRANCH']
      @original_github_pull_request_builder_plugin_branch = ENV['ghprbSourceBranch']
      ENV.delete 'TRAVIS_BRANCH'
      ENV.delete 'CIRCLE_BRANCH'
      ENV.delete 'ghprbSourceBranch'
    end

    # Restore original environment variables for branch.
    #
    # @example with test-unit
    #   require 'env_branch/test_helper'
    #
    #   class TestExample < Test::Unit::TestCase
    #     extend ::EnvBranch::TestHelper
    #
    #     def self.shutdown
    #       restore_env_branch
    #     end
    #   end
    #
    # @return [void]
    #
    # @see Base#fetch_branch_name
    def restore_env_branch
      original_travis_branch = (defined?(@original_travis_branch) && @original_travis_branch) || nil
      original_circle_branch = (defined?(@original_circle_branch) && @original_circle_branch) || nil
      original_github_pull_request_builder_plugin_branch = (defined?(@original_github_pull_request_builder_plugin_branch) && @original_github_pull_request_builder_plugin_branch) || nil
      ENV['TRAVIS_BRANCH'] = original_travis_branch if original_travis_branch
      ENV['CIRCLE_BRANCH'] = original_circle_branch if original_circle_branch
      ENV['ghprbSourceBranch'] = original_github_pull_request_builder_plugin_branch if original_github_pull_request_builder_plugin_branch
    end
  end
end
