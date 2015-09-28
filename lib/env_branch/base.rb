module EnvBranch
  class Base
    attr_reader :branch_name

    def initialize
      @branch_name = nil
    end

    def branch?
      !branch_name.nil?
    end
  end
end
