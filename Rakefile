require 'rubygems'
require 'rake/rdoctask.rb'
require 'rake/gempackagetask.rb'

PKG_NAME='dialog'
PKG_VERSION='0.1.2'
RDOC_FILES = ["README"]
PKG_FILES = Dir.glob("lib/**/*.rb") + RDOC_FILES

spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.summary = "Library for building ncurses-based dialogs by interfacing with dialog(1)."
  s.name = PKG_NAME
  s.authors = ["Martin Landers <elk@treibgut.net>"]
  s.email = "elk@treibgut.net"
  s.homepage = "http://dialog.rubyforge.org/"
  s.rubyforge_project = PKG_NAME
  s.version = PKG_VERSION
  s.requirements << 'none'
  s.require_path = 'lib'
  s.files = PKG_FILES
  s.has_rdoc = true
  s.extra_rdoc_files = RDOC_FILES
  s.description = <<EOF
Dialog is a ruby gem for interfacing with the dialog(1) program.
It does away with the manual command-line fiddling, allowing ruby
programs operating in a commandline-environment to comfortably obtain
user input. Ncurses dialogs the easy way!
EOF
end

Rake::RDocTask.new do |rd|
  rd.main = "README"
  rd.rdoc_dir = "doc"
  rd.rdoc_files = PKG_FILES
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar_bz2 = true
  pkg.need_tar_gz = true
  pkg.package_files.include("README", "lib/**/*.rb")
end

desc "Remove build artifacts"
task :clean => [:clobber_package, :clobber_rdoc]

task :default => [:package]
