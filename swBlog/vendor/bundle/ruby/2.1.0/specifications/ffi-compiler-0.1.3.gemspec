# -*- encoding: utf-8 -*-
# stub: ffi-compiler 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "ffi-compiler"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Wayne Meissner"]
  s.date = "2013-04-19"
  s.description = "Ruby FFI library"
  s.email = "wmeissner@gmail.com"
  s.homepage = "http://wiki.github.com/ffi/ffi"
  s.licenses = ["Apache 2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.4.2"
  s.summary = "Ruby FFI Rakefile generator"

  s.installed_by_version = "2.4.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<ffi>, [">= 1.0.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rubygems-tasks>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<ffi>, [">= 1.0.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rubygems-tasks>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<ffi>, [">= 1.0.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rubygems-tasks>, [">= 0"])
  end
end
