#!/usr/bin/env rake
begin
  require 'bundler'
  Bundler::GemHelper.install_tasks
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Jasminerice'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'open-uri'

files = [
  ['vendor/assets/javascripts','https://raw.github.com/thedeeno/jasmine/tag_filters/lib/jasmine-core/jasmine-html.js'],
  ['vendor/assets/javascripts', 'https://raw.github.com/thedeeno/jasmine/tag_filters/lib/jasmine-core/jasmine.js'],
  ['vendor/assets/stylesheets', 'https://raw.github.com/thedeeno/jasmine/tag_filters/lib/jasmine-core/jasmine.css']
]
desc "vendor latest jasmine"
task "vendor_jasmine" do
  files.each do |value|

    url = value[1]
    file_name = File.basename(url)
    file_path = File.join(value[0], file_name)

    puts "downloading #{url}..."
    begin
      open(file_path, 'wb') do |file|
        file << open(url).read
      end
      puts "saved to #{file_path}"
    rescue OpenURI::HTTPError => ex
      puts ex
    end
  end
end
