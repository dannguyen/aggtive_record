# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "aggtive_record"
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Nguyen"]
  s.date = "2014-03-10"
  s.description = "This is not even remotely finished or even started on. Please don't download."
  s.email = "dansonguyen@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "aggtive_record.gemspec",
    "lib/aggtive_record.rb",
    "lib/aggtive_record/adapter.rb",
    "lib/aggtive_record/adapter/mysql.rb",
    "lib/aggtive_record/aggable.rb",
    "lib/aggtive_record/egg_scopes.rb",
    "lib/aggtive_record/egg_scopes/collation.rb",
    "lib/aggtive_record/egg_scopes/collation/count_by.rb",
    "lib/aggtive_record/egg_scopes/collation/rate_per.rb",
    "lib/aggtive_record/egg_scopes/time_bucket.rb",
    "lib/aggtive_record/egg_scopes/time_span.rb",
    "lib/aggtive_record/memo.rb",
    "lib/aggtive_record/time.rb",
    "spec/functional/basic_object_run_spec.rb",
    "spec/functional/collation_spec.rb",
    "spec/lib/aggable_spec.rb",
    "spec/lib/count_by_spec.rb",
    "spec/lib/rate_spec.rb",
    "spec/lib/time_bucket_spec.rb",
    "spec/lib/time_span_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/dannguyen/aggtive_record"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "A convoluted way to describe aggregations of ActiveRecords over a datetime attribute"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<groupdate>, ["~> 1.0.5"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.2.17"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, ["~> 1.0.1"])
      s.add_development_dependency(%q<mysql2>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, ["~> 3.2.14"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
    else
      s.add_dependency(%q<groupdate>, ["~> 1.0.5"])
      s.add_dependency(%q<activesupport>, ["~> 3.2.17"])
      s.add_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, ["~> 1.0.1"])
      s.add_dependency(%q<mysql2>, [">= 0"])
      s.add_dependency(%q<activerecord>, ["~> 3.2.14"])
      s.add_dependency(%q<timecop>, [">= 0"])
    end
  else
    s.add_dependency(%q<groupdate>, ["~> 1.0.5"])
    s.add_dependency(%q<activesupport>, ["~> 3.2.17"])
    s.add_dependency(%q<rspec>, ["~> 2.14.1"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, ["~> 1.0.1"])
    s.add_dependency(%q<mysql2>, [">= 0"])
    s.add_dependency(%q<activerecord>, ["~> 3.2.14"])
    s.add_dependency(%q<timecop>, [">= 0"])
  end
end

