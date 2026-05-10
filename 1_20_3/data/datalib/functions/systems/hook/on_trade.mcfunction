# datalib:systems/hook/on_trade
# Advancement reward: runs when villager_trade triggers.
# @s = takas yapan oyuncu

advancement revoke @s only datalib:systems/hook/trade
scoreboard players add @s macro.hook_traded 1
