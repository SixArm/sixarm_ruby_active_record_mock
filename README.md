# SixArm.com » Ruby » <br> ActiveRecord mock object for testing Rails

* Docs: <http://sixarm.com/sixarm_ruby_active_record_mock/doc>
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


## Quickstart

Install:

    gem install sixarm_ruby_active_record_mock

Bundler:

    gem "sixarm_ruby_active_record_mock", "=1.4.6"

Require:

    require "sixarm_ruby_active_record_mock"


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

