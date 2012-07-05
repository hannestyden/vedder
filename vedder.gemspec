# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'vedder/version'

Gem::Specification.new do |s|
  s.name     = 'vedder'
  s.version  = Vedder::Version::SEMANTIC
  s.authors  = [ 'Hannes Tydén' ]
  s.email    = [ 'hannes@soundcloud.com' ]
  s.homepage = 'http://github.com/hannestyden/vedder'
  s.summary  = 'Ruby wrapper for the `api.met.no` weather web service.'

  s.description = <<-DESCRIPTION
    Ruby wrapper for the `api.met.no` weather web service.
  DESCRIPTION

  # Required for validation.
  s.rubyforge_project = 'vedder'

  s.files      = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.executables = `git ls-files -- bin/*`.
    split("\n").map { |f| File.basename(f) }

  s.require_paths = [ 'lib' ]

  dependencies = []

  developement_dependencies =
    [
      [ 'rake',     '~> 0.8.7' ],
      [ 'minitest', '~> 2.11'  ],
    ]

  runtime_dependencies = []

  (dependencies + developement_dependencies).each do |dependency|
    s.add_development_dependency *dependency
  end

  (dependencies + runtime_dependencies).each do |dependency|
    s.add_runtime_dependency *dependency
  end
end
