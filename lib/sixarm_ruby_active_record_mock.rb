# -*- encoding: utf-8 -*-
=begin rdoc

= SixArm Ruby Gem » ActiveRecord Mock

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: Your choice of BSD, MIT, LGPL, or CreativeCommons Non-commercial Share Alike

ActiveRecord mock object for testing our Ruby On Rails gems.

This provides some of the ActiveRecord method signatures we use.

This provides:
  - read_attribute(key)
  - write_attribute(key,val)
  - find(id)
  - find(:all)

Example:
  mock = ActiveRecordMock.new
  mock.write_attribute('foo','bar')
  mock.read_attribute('foo') => 'bar'

Example of initialize with attributes:
  mock = ActiveRecordMock.new(:foo => 'bar', :goo => 'car', :hoo => 'dar')
  mock.read_attribute(:foo') => 'bar'
  mock.read_attribute(:goo') => 'car'
  mock.read_attribute(:hoo') => 'dar'

Example of creating mock users:
  anne = ActiveRecordMock.new(:id => 123, :name => 'Anne')
  beth = ActiveRecordMock.new(:id => 456, :name => 'Beth')
  cate = ActiveRecordMock.new(:id => 789, :name => 'Cate')

Example of mock finder creation:
  ActiveRecordMock.find=[anne,beth,cate]

Example of mock finder retrieval of records by id:
  ActiveRecordMock.find(123) => anne
  ActiveRecordMock.find(456) => beth
  ActiveRecordMock.find(789) => cate

Example of mock finder retrieval of all records:
  ActiveRecordMock.find(:all) => [anne,beth,cate]

=end


class ActiveRecordMock

 @@find=[]

 def initialize(ops={})
  @attributes=ops
  @@find << self
 end

 def read_attribute(k)
  @attributes[k]
 end

 def write_attribute(k,v)
  @attributes[k]=v
 end

 def self.find(id,*ops)
  case id
  when :all 
   @@find
  else
   @@find.each{|x| if x.read_attribute(:id)==id then return x end } or nil
  end
 end

 def self.find=(records)
  @@find=records
 end

end
