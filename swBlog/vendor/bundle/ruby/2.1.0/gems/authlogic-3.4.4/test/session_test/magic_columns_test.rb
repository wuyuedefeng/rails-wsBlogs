require 'test_helper'

module SessionTest
  module MagicColumnsTest
    class ConfigTest < ActiveSupport::TestCase
      def test_last_request_at_threshold_config
        UserSession.last_request_at_threshold = 2.minutes
        assert_equal 2.minutes, UserSession.last_request_at_threshold

        UserSession.last_request_at_threshold 0
        assert_equal 0, UserSession.last_request_at_threshold
      end
    end

    class InstanceMethodsTest < ActiveSupport::TestCase
      def test_after_persisting_set_last_request_at
        ben = users(:ben)
        assert !UserSession.create(ben).new_session?

        set_cookie_for(ben)
        old_last_request_at = ben.last_request_at
        assert UserSession.find
        ben.reload
        assert ben.last_request_at != old_last_request_at
      end

      def test_valid_increase_failed_login_count
        ben = users(:ben)
        old_failed_login_count = ben.failed_login_count
        assert UserSession.create(:login => ben.login, :password => "wrong").new_session?
        ben.reload
        assert_equal old_failed_login_count + 1, ben.failed_login_count
      end

      def test_before_save_update_info
        aaron = users(:aaron)

        # increase failed login count
        assert UserSession.create(:login => aaron.login, :password => "wrong").new_session?
        aaron.reload

        # grab old values
        old_login_count = aaron.login_count
        old_failed_login_count = aaron.failed_login_count
        old_last_login_at = aaron.last_login_at
        old_current_login_at = aaron.current_login_at
        old_last_login_ip = aaron.last_login_ip
        old_current_login_ip = aaron.current_login_ip

        assert UserSession.create(:login => aaron.login, :password => "aaronrocks").valid?

        aaron.reload
        assert_equal old_login_count + 1, aaron.login_count
        assert_equal 0, aaron.failed_login_count
        assert_equal old_current_login_at, aaron.last_login_at
        assert aaron.current_login_at != old_current_login_at
        assert_equal old_current_login_ip, aaron.last_login_ip
        assert_equal "1.1.1.1", aaron.current_login_ip
      end
    end
  end
end
