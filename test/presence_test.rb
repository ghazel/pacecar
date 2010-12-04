require 'test_helper'

class PresenceTest < Test::Unit::TestCase

  context "A class which has included Pacecar" do
    setup do
      @class = User
    end
    context "with presence methods" do
      should "set the correct expected values for a _present column method" do
        assert @class.respond_to?(:first_name_present)
        expected = ["\"users\".first_name is not null"]
        assert_equal expected, @class.first_name_present.where_values
      end
      should "set the correct expected values for a _missing column method" do
        assert @class.respond_to?(:first_name_missing)
        expected = ["\"users\".first_name is null"]
        assert_equal expected, @class.first_name_missing.where_values
      end
      should "not setup methods for boolean columns" do
        assert ! @class.respond_to?(:admin_missing)
        assert ! @class.respond_to?(:admin_present)
      end
    end
  end

end
