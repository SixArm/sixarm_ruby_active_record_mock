# SixArm.com » Ruby » <br> ActiveRecord mock object for testing Rails

* Doc: <http://sixarm.com/sixarm_ruby_active_record_mock/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_active_record_mock>
* Repo: <http://github.com/sixarm/sixarm_ruby_active_record_mock>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

A simple mock object that provides the ActiveRecord method
signatures read_attribute(key) and write_attribute(key,val),
and simple record finder signatures find(id) and find(:all).

This provides some of the ActiveRecord method signatures we use:

  * read_attribute(key)
  * write_attribute(key,val)
  * find(id)
  * find(:all)

For docs go to <http://sixarm.com/sixarm_ruby_active_record_mock/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_active_record_mock

Bundler:

    gem "sixarm_ruby_active_record_mock", "~>1.4.6"

Require:

    require "sixarm_ruby_active_record_mock"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_active_record_mock --test --trust-policy HighSecurity


## Examples

Basic:

    require "sixarm_ruby_active_record_mock"
    mock = ActiveRecordMock.new
    mock.write_attribute('foo','bar')
    mock.read_attribute('foo') => 'bar'

Initialize with attributes:

    mock = ActiveRecordMock.new(:foo => 'bar', :goo => 'car', :hoo => 'dar')
    mock.read_attribute(:foo') => 'bar'
    mock.read_attribute(:goo') => 'car'
    mock.read_attribute(:hoo') => 'dar'

Creating mock users:

    anne = ActiveRecordMock.new(:id => 123, :name => 'Anne')
    beth = ActiveRecordMock.new(:id => 456, :name => 'Beth')
    cate = ActiveRecordMock.new(:id => 789, :name => 'Cate')

Mock finder creation:

    ActiveRecordMock.find=[anne,beth,cate]

Mock finder retrieval of records by id:

    ActiveRecordMock.find(123) => anne
    ActiveRecordMock.find(456) => beth
    ActiveRecordMock.find(789) => cate

Mock finder retrieval of all records:

    ActiveRecordMock.find(:all) => [anne,beth,cate]


## Changes

* 2012-03-14 1.4.6 Update docs, tests
* 2011-05-01 1.4.6 Add find_by_id
* 2011-04-25 1.4.4 Add find by nil
* 2011-04-19 1.4.2 Add <attribute>_before_type_cast
* 2011-04-19 1.4.0 Add attributes via method_missing
* 2011-04-18 1.3.2 Add find(nil) to return nil
* 2011-04-17 1.3.0 Update for Ruby 1.9.2 and Rails 3.0.5
## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2013 Joel Parker Henderson
