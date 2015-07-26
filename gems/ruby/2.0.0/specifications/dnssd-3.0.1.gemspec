# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dnssd"
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Hodel", "Aaron Patterson", "Phil Hagelberg", "Chad Fowler", "Charles Mills", "Rich Kilmer"]
  s.date = "2015-04-03"
  s.description = "DNS Service Discovery (aka Bonjour, MDNS) API for Ruby.  Implements browsing,\nresolving, registration and domain enumeration.  Supports avahi's DNSSD\ncompatibility layer for avahi 0.6.25 or newer."
  s.email = ["drbrain@segment.net", "aaron.patterson@gmail.com", "phil@hagelb.org", "chad@chadfowler.com", "", ""]
  s.extensions = ["ext/dnssd/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "ext/dnssd/extconf.rb"]
  s.homepage = "https://github.com/tenderlove/dnssd"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.0.14"
  s.summary = "DNS Service Discovery (aka Bonjour, MDNS) API for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 5.5"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.7"])
      s.add_development_dependency(%q<hoe>, ["~> 3.13"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.5"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
      s.add_dependency(%q<hoe>, ["~> 3.13"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.5"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.7"])
    s.add_dependency(%q<hoe>, ["~> 3.13"])
  end
end
