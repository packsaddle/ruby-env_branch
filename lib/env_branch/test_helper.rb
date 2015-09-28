module EnvBranch
  module TestHelper
    module_function

    def stash_env_branch
      @original_travis_branch = ENV['TRAVIS_BRANCH']
      ENV.delete 'TRAVIS_BRANCH'
    end

    def restore_env_branch
      ENV['TRAVIS_BRANCH'] = @original_travis_branch
    end
  end
end
