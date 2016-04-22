# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "translate"
  s.version = '0.9.0'

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Marklund", "Milan Novota", "Roman Shterenzon", "David Lozano", "Bernat Foj Capell"]
  s.description = %q{This plugin provides a web interface for translating Rails I18n texts
    (requires Rails 3.0 or higher) from one locale to another.}
  s.email = "bernat@bfc.cat"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = [
    "README"
  ]
  s.homepage = "https://github.com/bfcapell/translate"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Web interface to translate Rails I18n YML files"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ya2yaml>, ["~> 0.30"])
    else
      s.add_dependency(%q<ya2yaml>, ["~> 0.30"])
    end
  else
    s.add_dependency(%q<ya2yaml>, ["~> 0.30"])
  end

end

