module EnvBranch
  class Base
    attr_reader :branch_name

    def initialize
      @branch_name = fetch_branch_name
    end

    # travis-ci.org:
    #   ENV['TRAVIS_BRANCH']
    # circleci.com:
    #   ENV['CIRCLE_BRANCH']
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

    def branch?
      !branch_name.nil?
    end
  end
end
