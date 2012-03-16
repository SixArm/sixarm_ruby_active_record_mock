# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'sixarm_ruby_active_record_mock'
require 'simplecov'
SimpleCov.start

class Testing < Test::Unit::TestCase

 def test_instantiation
  mock1 = ActiveRecordMock.new
  mock2 = ActiveRecordMock.new
  assert_not_same(mock1,mock2,"mock1,mock2")
 end

 def test_attribute_assignment
  mock = ActiveRecordMock.new
  key='foo'
  val='bar'
  mock.write_attribute(key,val)
  out=mock.read_attribute(key)
  assert_equal(val,out,"mock key:#{key} val:#{val} out:#{out}")
 end

 def test_attribute_independence
  mock = ActiveRecordMock.new
  key1='foo'
  val1='bar'
  key2='hello'
  val2='world'
  mock.write_attribute(key1,val1)
  mock.write_attribute(key2,val2)
  out1=mock.read_attribute(key1)
  out2=mock.read_attribute(key2)
  assert_equal(val1,out1,"mock key1:#{key1} val1:#{val1} out:#{out1}")
  assert_equal(val2,out2,"mock key2:#{key2} val2:#{val2} out:#{out2}")
  assert_not_equal(key1,key2,"key1,key2")
  assert_not_equal(val1,val2,"val1,val2")
  assert_not_equal(out1,out2,"out1,out2")
 end

 def test_initialize_attributes
   mock = ActiveRecordMock.new(:foo => 'bar', :goo => 'car', :hoo => 'dar')
   x = mock.read_attribute(:foo); assert_equal(x,'bar',"x:#{x},bar")
   x = mock.read_attribute(:goo); assert_equal(x,'car',"x:#{x},car")
   x = mock.read_attribute(:hoo); assert_equal(x,'dar',"x:#{x},dar")
 end

 def test_attribute_via_initializer
   mock = ActiveRecordMock.new(:foo => 'bar')
   assert_equal("bar", mock.foo, 'mock.foo should equal "bar"')
 end

 def test_attribute_via_assignment
   mock = ActiveRecordMock.new()
   mock.foo='bar'
   assert_equal("bar", mock.foo, 'mock.foo should equal "bar"')
 end

 def test_attribute_before_type_cast
   mock = ActiveRecordMock.new(:foo => 'bar')
   assert_equal("bar", mock.foo_before_type_cast, 'mock.foo_before_type_cast should equal "bar"')
 end   

 def test_find

   anne = ActiveRecordMock.new(:id=>1, :name=>'Anne')
   beth = ActiveRecordMock.new(:id=>2, :name=>'Beth')
   cate = ActiveRecordMock.new(:id=>3, :name=>'Cate')

   x=anne.read_attribute(:name); assert_equal(x,'Anne',"x:#{x},anne")
   x=beth.read_attribute(:name); assert_equal(x,'Beth',"x:#{x},beth")
   x=cate.read_attribute(:name); assert_equal(x,'Cate',"x:#{x},cate")

   # Set the mock finder
   all = [anne,beth,cate]
   ActiveRecordMock.find=all

   # Retrieve all
   x = ActiveRecordMock.find(:all)
   assert_equal(x,all,"find :all x:#{x}")

   # Retrieve via #find
   x = ActiveRecordMock.find(1); assert_equal(x,anne,"find(1) x:#{x},anne")
   x = ActiveRecordMock.find(2); assert_equal(x,beth,"find(2) x:#{x},beth")
   x = ActiveRecordMock.find(3); assert_equal(x,cate,"find(3) x:#{x},cate")

   # Retrieve via #find_by_id
   x = ActiveRecordMock.find_by_id(1); assert_equal(x,anne,"find(1) x:#{x},anne")
   x = ActiveRecordMock.find_by_id(2); assert_equal(x,beth,"find(2) x:#{x},beth")
   x = ActiveRecordMock.find_by_id(3); assert_equal(x,cate,"find(3) x:#{x},cate")

   # Retrieve by #find(nil) => ArgumentError
   assert_raise(ArgumentError) do
     x = ActiveRecordMock.find(nil);
   end

   # Retrieve by #find_by_id(nil) => nil
   x = ActiveRecordMock.find_by_id(nil); assert_nil(x,"find(nil) should be nil")

 end
 
end
