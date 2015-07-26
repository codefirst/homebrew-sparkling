# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "colorize"
  s.version = "0.7.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Micha\u{142} Kalbarczyk"]
  s.date = "2015-04-19"
  s.description = "Ruby String class extension. Adds methods to set text color, background color and, text effects on ruby console and command line output, using ANSI escape sequences."
  s.email = "fazibear@gmail.com"
  s.homepage = "http://github.com/fazibear/colorize"
  s.licenses = ["GPL-2"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Add color methods to String class"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, ["~> 0.4"])
    else
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<minitest>, ["~> 5.0"])
      s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0.4"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<minitest>, ["~> 5.0"])
    s.add_dependency(%q<codeclimate-test-reporter>, ["~> 0.4"])
  end
end
