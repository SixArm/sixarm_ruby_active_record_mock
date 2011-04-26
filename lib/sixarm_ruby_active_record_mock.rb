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
   when nil
     raise ArgumentError.new
   when :all
     return @@find
   else
     @@find.each{|x| if x.read_attribute(:id)==id then return x end }
     return nil
   end
 end

 def self.find=(records)
   @@find=records
 end

 def method_missing(m, *args, &block)
   if m=~/=$/
     write_attribute(m.to_s.sub(/=$/,'').to_sym, *args)
   else
     if m=~/_before_type_cast$/
       read_attribute($`.to_sym)
     else
       read_attribute(m)
     end
   end
 end

end
