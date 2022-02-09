# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_documents'
  s.version     = '4.0.1.3'
  s.summary     = 'Add documents assets to products'
  s.description = 'Currently supports PDF and ZIP files'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Tania Rubio'
  s.email     = 'taniarubiov@gmail.com'
  
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 4'
  s.add_dependency 'activestorage', '~> 6'
  s.add_dependency 'spree_backend', '~> 4'
  s.add_dependency 'file_validators', '~> 3'

  s.add_development_dependency 'spree_dev_tools'
end
