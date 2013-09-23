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
