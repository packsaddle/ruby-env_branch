require 'env_branch/base'
require 'env_branch/version'

# Build branch information from environment variables
module EnvBranch
  # Build branch information object from environment variables
  #
  # @overload self.new
  #   @example without user defined block
  #     env_branch = EnvBranch.new
  #
  #   @return [Base] Branch information object
  #
  # @overload self.new(&block)
  #   @example with user defined block
  #     env_branch =
  #       EnvBranch.new do
  #         if ENV['USER_DEFINED_BRANCH'] &&
  #           !ENV['USER_DEFINED_BRANCH'].empty?
  #           ENV['USER_DEFINED_BRANCH']
  #         end
  #       end
  #
  #   @yield user defined block
  #   @return [Base] Branch information object
  def self.new(&block)
    Base.new(&block)
  end
end
