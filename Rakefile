# frozen_string_literal: true

require "rake/extensiontask"
require "rake/testtask"
require "rake/clean"

if RUBY_ENGINE != 'jruby'
  require "ruby_memcheck"

  RubyMemcheck.config(binary_name: "yarp")
end

task compile: :make

if RUBY_ENGINE == 'jruby'
  require 'rake/javaextensiontask'
  target = 'java'

  Rake::JavaExtensionTask.new(:compile) do |ext|
    ext.ext_dir = 'java'
    ext.lib_dir = "lib/yarp"
    ext.source_version = '1.8'
    ext.target_version = '1.8'
    ext.gem_spec = Gem::Specification.load("yarp.gemspec")
  end

else
  target = ''
  
  Rake::ExtensionTask.new(:compile) do |ext|
    ext.name = "yarp"
    ext.ext_dir = "ext/yarp"
    ext.lib_dir = "lib/yarp"
    ext.gem_spec = Gem::Specification.load("yarp.gemspec")
  end
end
  
test_config = lambda do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

Rake::TestTask.new(test: :compile, &test_config)

if RUBY_ENGINE != 'jruby'
  namespace :test do
    RubyMemcheck::TestTask.new(valgrind: :compile, &test_config)
  end
end

task default: :test

TEMPLATES = [
  "ext/yarp/node.c",
  "lib/yarp/node.rb",
  "lib/yarp/serialize.rb",
  "java/org/yarp/Loader.java",
  "java/org/yarp/Nodes.java",
  "java/org/yarp/AbstractNodeVisitor.java",
  "src/ast.h",
  "src/node.c",
  "src/node.h",
  "src/prettyprint.c",
  "src/serialize.c",
  "src/token_type.c",
]

desc "Generate all ERB template based files"
task templates: TEMPLATES

task make: :templates do
  sh "make", target
end

task generate_compilation_database: [:clobber, :templates] do
  sh "which bear" do |ok, _|
    abort("Installing bear is required to generate the compilation database") unless ok
  end

  sh "bear -- make"
end

# So `rake clobber` will delete generated files
CLOBBER.concat(TEMPLATES)

dylib_extension = RbConfig::CONFIG["host_os"].match?(/darwin/) ? "dylib" : "so"
CLOBBER << "build/librubyparser.#{dylib_extension}"
CLOBBER << "lib/yarp.#{dylib_extension}"

TEMPLATES.each do |filepath|
  desc "Template #{filepath}"
  file filepath => ["bin/templates/#{filepath}.erb", "config.yml"] do |t|
    require_relative "bin/template"
    template(t.name, locals)
  end
end

desc "Lex ruby/spec files and compare with lex_compat"
task lex: :compile do
  $:.unshift(File.expand_path("lib", __dir__))
  require "yarp"
  require "ripper"
  require "timeout"

  passing = 0
  failing = 0

  colorize = ->(code, string) { "\033[#{code}m#{string}\033[0m" }
  fail_filepath = ->(filepath) {
    warn(filepath) if ENV["VERBOSE"]
    print colorize.call(31, "E")
    failing += 1
  }

  filepaths =
    if ENV["FILEPATHS"]
      Dir[ENV["FILEPATHS"]]
    else
      Dir["vendor/spec/**/*.rb"]
    end

  filepaths.each.with_index(1) do |filepath, index|
    print "#{filepath} " if ENV["CI"]
    source = File.read(filepath)

    begin
      Timeout.timeout(1) do
        lexed = YARP.lex_compat(source)

        if lexed.errors.empty? && YARP.lex_ripper(source) == lexed.value
          print colorize.call(32, ".")
          passing += 1
        else
          fail_filepath.call(filepath)
        end

        puts if ENV["CI"]
      rescue
        fail_filepath.call(filepath)
      end
    rescue Timeout::Error
      fail_filepath.call(filepath)
    end
  end

  puts <<~RESULTS


    PASSING=#{passing}
    FAILING=#{failing}
    PERCENT=#{(passing.to_f / (passing + failing) * 100).round(2)}%
  RESULTS
end
