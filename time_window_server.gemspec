require_relative "lib/time_window_server/version"

Gem::Specification.new do |spec|
  spec.name        = "time_window_server"
  spec.version     = TimeWindowServer::VERSION
  spec.authors     = [ "Neeraj Negi" ]
  spec.email       = [ "neeraj33negi@gmail.com" ]
  spec.homepage    = "https://github.com/neeraj33negi/time_window_server"
  spec.summary     = " Summary of TimeWindowServer."
  spec.description = "Description of TimeWindowServer."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://github.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/neeraj33negi/time_window_server"
  spec.metadata["changelog_uri"] = "https://github.com/neeraj33negi/time_window_server/changelog.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2.1"
end
