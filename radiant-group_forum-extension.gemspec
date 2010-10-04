# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{radiant-group_forum-extension}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["spanner"]
  s.date = %q{2010-10-04}
  s.description = %q{A bit of glue to add group-based access control to the radiant forum.}
  s.email = %q{will@spanner.org}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "VERSION",
     "app/views/admin/forums/_forum_group.html.haml",
     "config/routes.rb",
     "db/migrate/001_forums_groups.rb",
     "db/migrate/20091008101339_simple_ownership.rb",
     "group_forum_extension.rb",
     "lib/forums_controller_extensions.rb",
     "lib/group_forum_tags.rb",
     "lib/grouped_forum.rb",
     "lib/grouped_post.rb",
     "lib/grouped_topic.rb",
     "lib/posts_controller_extensions.rb",
     "lib/tasks/group_forum_extension_tasks.rake",
     "lib/topics_controller_extensions.rb",
     "pkg/radiant-group_forum-extension-0.4.0.gem",
     "radiant-group_forum-extension.gemspec",
     "spec/datasets/group_forum_forums_dataset.rb",
     "spec/datasets/group_forum_groups_dataset.rb",
     "spec/datasets/group_forum_readers_dataset.rb",
     "spec/datasets/group_forum_sites_dataset.rb",
     "spec/models/forum_spec.rb",
     "spec/models/group_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/spanner/radiant-group_forum-extension}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Add group-awareness to the radiant forum extension}
  s.test_files = [
    "spec/datasets/group_forum_forums_dataset.rb",
     "spec/datasets/group_forum_groups_dataset.rb",
     "spec/datasets/group_forum_readers_dataset.rb",
     "spec/datasets/group_forum_sites_dataset.rb",
     "spec/models/forum_spec.rb",
     "spec/models/group_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<radiant>, [">= 0.9.0"])
      s.add_runtime_dependency(%q<radiant-forum-extension>, [">= 0"])
      s.add_runtime_dependency(%q<radiant-reader_group-extension>, [">= 0"])
    else
      s.add_dependency(%q<radiant>, [">= 0.9.0"])
      s.add_dependency(%q<radiant-forum-extension>, [">= 0"])
      s.add_dependency(%q<radiant-reader_group-extension>, [">= 0"])
    end
  else
    s.add_dependency(%q<radiant>, [">= 0.9.0"])
    s.add_dependency(%q<radiant-forum-extension>, [">= 0"])
    s.add_dependency(%q<radiant-reader_group-extension>, [">= 0"])
  end
end

