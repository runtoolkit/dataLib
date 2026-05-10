# datalib:systems/hook/on_fish_caught
# Binds a function or command to the "fish_caught" event.
#
# INPUT (storage datalib:input):
#   func → function to run when a player catches a fish
#   cmd  → command to run (used if func is absent)
data modify storage datalib:input event set value "fish_caught"
function datalib:systems/hook/bind
