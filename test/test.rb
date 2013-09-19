require 'rubygems'
require 'dialog'

include Dialog

# Test MixedForm
steps = MixedForm.new do |m|
  m.text "Authentication"
  m.field "User", 1, 1, "", 1, 10, 40, 38, 0
  m.password "Password", 2, 1, "", 2, 10, 40, 38
end
steps.show!
 
# Test menu
steps = Menu.new(0,70) do |m|
  # m.backtitle "Bootable Backup"
  # m.title "Configure steps"
  m.text "Bla bla"
  m.item_help
  m.defaultno
  m.choice "/dev/hda1", "Backup partition /dev/hda1 using partimage", "Help text"
  m.choice "/dev/hda2", "Backup partition /dev/hda2 using dd", "More help text"
  m.ok { |d,m| puts "Hey, you pressed ok and selected #{m}" }
  m.cancel { |d,m| puts "Oh no! You canceled this wonderful dialog! Choice was #{m}" }
  m.extra("Maybe") { |d,m| puts "Hm, now that's extra-ordinary. Selected #{m}" }
  m.help { |d,m| puts "Help! I need somebody, Help! For #{m}" }
end
steps.show!

# Test yesno
yn = Yesno.new do |t|
  t.text "Do you like the new ruby dialog gem?"
  t.ok { puts "Hey, you pressed ok" }
  t.cancel { |d| puts "Oh no! You canceled this wonderful dialog!" }
  t.extra { puts "Hm, now that's extra-ordinary" }
  t.help { puts "Help! I need somebody, Help!" }
end
yn.show!

# Test timebox
tb = Timebox.new(0, 0) do |t|
  t.text "What time is it?"
  t.time Time.now + 5*60
end
tb.show!

# Test textbox
aFile = File.new("foo.txt", "w")
99.downto(1) do |v|
  aFile.puts "#{v} bottles of beer on the wall, #{v} bottles of beer, ..."
end
aFile.flush
aFile.close

textbox = Textbox.new(30, 50) do |t|
  t.text "Please read the following aloud"
  t.file aFile
end
textbox.show!

File.unlink(aFile.path)


# Test tailboxbg
aFile = File.new("foo.txt", "w")

tailbox = Tailboxbg.new(30, 60) do |t|
  t.text "And now for some rubbish from our parent..."
  t.file aFile
end
tailbox.show

99.downto(1) do |v|
  aFile.puts "#{v} bottles of beer on the wall, #{v} bottles of beer, ..."
  sleep 0.01
  aFile.flush
end

tailbox.wait
aFile.close
File.unlink(aFile.path)


# Test tailbox
aFile = File.new("foo.txt", "w")

tailbox = Tailbox.new(30, 60) do |t|
  t.text "And now for some rubbish from our parent..."
  t.file aFile
end
tailbox.show

99.downto(1) do |v|
  aFile.puts "#{v} bottles of beer on the wall, #{v} bottles of beer, ..."
  sleep 0.01
  aFile.flush
end

tailbox.wait
aFile.close
File.unlink(aFile.path)


# Test radiolist
rl = Radiolist.new do |m|
  m.text "Speak friend and enter"
  m.choice "/dev/hda1", "Backup partition /dev/hda1 using partimage", :on
  m.choice "/dev/hda2", "Backup partition /dev/hda2 using dd"
  m.choice "/dev/hda3", "Backup partition /dev/hda3 using dd", :off
end
rl.show!

# Test passwordbox
pwbox = Passwordbox.new do |b|
  b.text "Speak friend and enter"
end
pwbox.show!

# Test msgbox
box = Msgbox.new(50,50) do |m|
  m.text "Sir, a message for you!"
end
box.show!

# Test menu
steps = Menu.new do |m|
  # m.backtitle "Bootable Backup"
  # m.title "Configure steps"
  m.text "Bla bla"
  m.choice "/dev/hda1", "Backup partition /dev/hda1 using partimage"
  m.choice "/dev/hda2", "Backup partition /dev/hda2 using dd" 
end
steps.show!

# Test inputmenu
steps = Inputmenu.new(0, 75) do |m|
  m.text "Bla bla bla"
  m.menu_height 20
  m.choice "/dev/hda1", "Backup partition /dev/hda1 using partimage"
  m.choice "/dev/hda2", "Backup partition /dev/hda2 using dd" 
end
steps.show!

# Test inputbox
ibox = Inputbox.new do |b|
  b.text "Your input please"
  b.value "Default input"
end
ibox.show!

# Test gauge
gauge = Gauge.new do |g|
  g.text "Please wait... magic in progress"
  g.complete 0.1
end
gauge.show

10.step(100, 10) do |v|
  gauge.complete v
  sleep 0.05
end
gauge.wait

# Test file selector
sel = FSelect.new do |f|
  f.text "Choose a file"
  f.file "./bla.txt"
end
sel.show!

# Test Form
frm = Form.new do |f|
  f.text "Bla Bla"
  f.field "Fruit", 1, 1, "Strawberry", 1, 12
  f.field "Veggie", 2, 1, "Eggplant", 2, 12, 30, 50
end
frm.show!

# Test Checklist
chklist = Checklist.new do |m|
  # m.backtitle "Bootable Backup"
  # m.title "Configure steps"
  m.text "Bla bla"
  m.choice "/dev/hda1", "Backup partition /dev/hda1 using partimage", :on
  m.choice "/dev/hda2", "Backup partition /dev/hda2 using dd"
  m.choice "/dev/hda3", "Backup partition /dev/hda3 using dd", :off
end
chklist.show!

# Test calendar
cal = Calendar.new
cal.date Date.today - 5
cal.show!

# Test infobox
ibox = Infobox.new do |b|
  b.text "That's all folks!"
end
ibox.show!
