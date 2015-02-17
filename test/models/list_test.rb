require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test 'normalize_friendly_id' do
    list = List.new(title: 'Really Awesome List')
    assert_equal 'Really-Awesome-List', list.normalize_friendly_id(list.title)
    list = List.new(title: 'Ruby on Rails')
    assert_equal 'Ruby-on-Rails', list.normalize_friendly_id(list.title)
    list = List.new(title: 'Google+')
    assert_equal 'Google-plus', list.normalize_friendly_id(list.title)
  end
end
