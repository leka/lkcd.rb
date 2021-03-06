# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','lkcd','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'lkcd'
  s.version = Lkcd::VERSION
  s.author = 'Ladislas de Toldi'
  s.email = 'ladislas@leka.io'
  s.homepage = 'https://ladislas.detoldi.me'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A simple cli to manage lessons and curriculums'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','lkcd.rdoc']
  s.rdoc_options << '--title' << 'lkcd' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'lkcd'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.17.1')
end
