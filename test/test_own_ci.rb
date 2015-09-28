require_relative 'helper'

module EnvBranch
  class TestOwnCi < Test::Unit::TestCase
    sub_test_case 'not branch' do
      sub_test_case 'without block' do
        test '#branch?' do
          assert do
            EnvBranch.new.branch? == false
          end
        end
        test '#branch_name' do
          assert do
            EnvBranch.new.branch_name.nil?
          end
        end
      end
    end
  end
end
