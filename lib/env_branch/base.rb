module EnvBranch
  # Branch information object from environment variable
  class Base
    attr_reader :branch_name
    # @!attribute [r] branch_name
    #   @return [String, nil] branch name or nil

    # Build branch information object from environment variables
    #
    # @overload initialize
    #   @example without user defined block
    #     env_branch = EnvBranch::Base.new
    #
    #   @return [Base] Branch information object
    #
    # @overload initialize(&block)
    #   @example with user defined block
    #     env_branch =
    #       EnvBranch::Base.new do
    #         if ENV['USER_DEFINED_BRANCH'] &&
    #           !ENV['USER_DEFINED_BRANCH'].empty?
    #           ENV['USER_DEFINED_BRANCH']
    #         end
    #       end
    #
    #   @yield user defined block
    #   @return [Base] Branch information object
    def initialize(&block)
      @branch_name =
        if block_given?
          block.call || fetch_branch_name
        else
          fetch_branch_name
        end
    end

    # Fetch branch name from environment variables
    #
    # travis-ci.org:
    #   ENV['TRAVIS_BRANCH']
    # circleci.com:
    #   ENV['CIRCLE_BRANCH']
    #
    # @return [String, nil] branch name or nil
    #
    # @see TestHelper.stash_env_branch
    # @see TestHelper.restore_env_branch
    #
    # @see http://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables
    #   Environment Variables - Travis CI
    # @see https://circleci.com/docs/environment-variables#build-details
    #   Environment variables - CircleCI
    def fetch_branch_name
      if ENV['TRAVIS_BRANCH'] && !ENV['TRAVIS_BRANCH'].empty?
        ENV['TRAVIS_BRANCH']
      elsif ENV['CIRCLE_BRANCH'] && !ENV['CIRCLE_BRANCH'].empty?
        ENV['CIRCLE_BRANCH']
      end
    end

    # @return [Boolean] true if this has branch name
    def branch?
      !branch_name.nil?
    end
  end
end
