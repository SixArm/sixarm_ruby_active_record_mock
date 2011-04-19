# -*- coding: utf-8 -*-
=begin rdoc
Please see README.rdoc
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
