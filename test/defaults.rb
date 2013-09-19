require 'dialog'

include Dialog

Dialog::default_options do |d|
  d.backtitle "Camelot!"
end

Yesno.new do |yn|
  yn.text "What is your favourite colour?"
  yn.yes "Blue"
  yn.no "Yellow"
end.show!


template = DialogOptions.new do |d|
  d.backtitle "Camelot Template!"
end

Yesno.new(0,0,template) do |yn|
  yn.text "What is your favourite colour?"
  yn.yes "Blue"
  yn.no "Yellow"
end.show!
