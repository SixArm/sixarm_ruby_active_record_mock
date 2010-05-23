Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_active_record_mock"
  s.summary           = "SixArm Ruby Gem: ActiveRecord mock object for methods read_attribute and write_attribute"
  s.version           = "1.2.8"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['README.rdoc','LICENSE.txt','lib/sixarm_ruby_active_record_mock.rb']
  s.test_files        = ['test/sixarm_ruby_active_record_mock_test.rb']

end
