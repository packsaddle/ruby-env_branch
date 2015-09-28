require 'env_branch/base'
require 'env_branch/version'

module EnvBranch
  def self.new(&block)
    Base.new(&block)
  end
end
