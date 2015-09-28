require_relative 'helper'

module EnvBranch
  class TestOwnCi < Test::Unit::TestCase
    extend TestHelper

    def self.startup
      stash_env_branch
    end

    def self.shutdown
      restore_env_branch
    end

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
      sub_test_case 'with block' do
        test '#branch?' do
          assert do
            EnvBranch.new do
              if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                ENV['USER_DEFINED_BRANCH']
              end
            end.branch? == false
          end
        end
        test '#branch_name' do
          assert do
            EnvBranch.new do
              if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                ENV['USER_DEFINED_BRANCH']
              end
            end.branch_name.nil?
          end
        end
      end
    end

    sub_test_case 'own ci' do
      branch_name = 'your-branch'
      setup do
        ENV['USER_DEFINED_BRANCH'] = branch_name
      end
      teardown do
        ENV.delete 'USER_DEFINED_BRANCH'
      end

      sub_test_case 'with block' do
        test '#branch?' do
          assert do
            EnvBranch.new do
              if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                ENV['USER_DEFINED_BRANCH']
              end
            end.branch? == true
          end
        end
        test '#branch_name' do
          assert do
            EnvBranch.new do
              if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                ENV['USER_DEFINED_BRANCH']
              end
            end.branch_name == branch_name
          end
        end
      end

      sub_test_case 'superior user definition' do
        env_branch = 'env-branch'
        setup do
          ENV['TRAVIS_BRANCH'] = env_branch
        end
        teardown do
          ENV.delete 'TRAVIS_BRANCH'
        end
        test '#branch?' do
          assert do
            EnvBranch.new do
              if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                ENV['USER_DEFINED_BRANCH']
              end
            end.branch? == true
          end
        end
        test '#branch_name' do
          assert do
            EnvBranch.new do
              if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                ENV['USER_DEFINED_BRANCH']
              end
            end.branch_name == branch_name
          end
        end
      end

      sub_test_case 'complex case with travis-ci' do
        branch_name = 'your-branch'
        setup do
          ENV['TRAVIS_BRANCH'] = branch_name
        end

        teardown do
          ENV.delete 'TRAVIS_BRANCH'
        end

        sub_test_case 'with block' do
          test '#branch?' do
            assert do
              EnvBranch.new do
                if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                  ENV['USER_DEFINED_BRANCH']
                end
              end.branch? == true
            end
          end
          test '#pull_request_id' do
            assert do
              EnvBranch.new do
                if ENV['USER_DEFINED_BRANCH'] && !ENV['USER_DEFINED_BRANCH'].empty?
                  ENV['USER_DEFINED_BRANCH']
                end
              end.branch_name == branch_name
            end
          end
        end
      end
    end
  end
end
