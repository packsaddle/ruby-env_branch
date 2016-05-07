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
    def initialize
      @branch_name =
        if block_given?
          yield || fetch_branch_name
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
    # GitHub pull request builder plugin (for Jenkins):
    #   ENV['ghprbSourceBranch']
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
    # @see https://wiki.jenkins-ci.org/display/JENKINS/GitHub+pull+request+builder+plugin#GitHubpullrequestbuilderplugin-EnvironmentVariables
    #   Environment Variables
    def fetch_branch_name
      if ENV['TRAVIS_BRANCH'] && !ENV['TRAVIS_BRANCH'].empty?
        ENV['TRAVIS_BRANCH']
      elsif ENV['CIRCLE_BRANCH'] && !ENV['CIRCLE_BRANCH'].empty?
        ENV['CIRCLE_BRANCH']
      elsif ENV['ghprbSourceBranch'] && !ENV['ghprbSourceBranch'].empty?
        ENV['ghprbSourceBranch']
      end
    end

    # @return [Boolean] true if this has branch name
    def branch?
      !branch_name.nil?
    end
  end
end
