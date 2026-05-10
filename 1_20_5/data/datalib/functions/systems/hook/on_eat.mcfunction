# datalib:systems/hook/on_eat
# Binds a function or command to the "eat" event.
#
# INPUT (storage datalib:input):
#   func → function to run when a player eats
#   cmd  → command to run when a player eats (used if func is absent)
data modify storage datalib:input event set value "eat"
function datalib:systems/hook/bind
