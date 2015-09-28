module EnvBranch
  class Base
    attr_reader :branch_name

    def initialize
      @branch_name = fetch_branch_name
    end

    def fetch_branch_name
      if ENV['TRAVIS_BRANCH'] && !ENV['TRAVIS_BRANCH'].empty?
        ENV['TRAVIS_BRANCH']
      end
    end

    def branch?
      !branch_name.nil?
    end
  end
end
