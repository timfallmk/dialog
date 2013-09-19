require 'rubygems'
require 'dialog'

include Dialog

# Everybody's favourite Monty Python question in Yes/No style
yn = Yesno.new do |yn|
  yn.text "What is your favourite colour?"
  yn.yes "Blue"
  yn.no "Yellow"
end
yn.show!

if yn.yes?
  puts "Go on. Off you go."
else
  puts "auuuuuuuugh."
  exit
end


# As a menu
menu = Menu.new do |m|
  m.text "What... is your favourite colour?"
  m.choice "blue", "Blue"
  m.choice "yellow", "Yellow"
end
menu.show!

if menu.yes? && menu.output == "blue"
  puts "Go on. Off you go."
else
  puts "auuuuuuuugh."
  exit
end


# And as a menu using blocks as handlers
menu = Menu.new do |m|
  m.text "What... is your favourite colour?"
  m.choice "blue", "Blue"
  m.choice "yellow", "Yellow"
  m.no { |d,o| puts "auuuuuuuugh." }
  m.yes do |d,o|
    if o == "blue"
      puts "Go on. Off you go."
    else
      puts "auuuuuuuugh."
      exit
    end
  end
end
menu.show!
