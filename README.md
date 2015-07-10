# Ruby » <br> ActiveRecord mock object for testing Rails

* Doc: <http://sixarm.com/sixarm_ruby_active_record_mock/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_active_record_mock>
* Repo: <http://github.com/sixarm/sixarm_ruby_active_record_mock>
<!--HEADER-SHUT-->


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


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_active_record_mock", ">= 1.4.8, < 2"

To install using the command line, run this:

    gem install sixarm_ruby_active_record_mock -v ">= 1.4.8, < 2"

To install using the command with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_active_record_mock -v ">= 1.4.8, < 2" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_active_record_mock"

<!--INSTALL-SHUT-->


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
