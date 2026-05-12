# datalib:systems/dev_settings/display/internal/give_book_macro
# Macro function — injects dev_settings_pages into the written book component.
# Arg: dev_settings_pages (string — serialized written_book_content pages SNBT)

$item replace entity @s weapon.mainhand with minecraft:written_book[minecraft:written_book_content={author:"",title:"",pages:[$(dev_settings_pages)]},minecraft:custom_data={datalib_dev_settings:1b},minecraft:item_name='{"text":"Dev Settings","italic":false,"color":"light_purple"}',minecraft:lore=['{"text":"dataLib","italic":false,"color":"#00AAAA"}']]
