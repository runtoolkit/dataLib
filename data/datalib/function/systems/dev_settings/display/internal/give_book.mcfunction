# datalib:systems/dev_settings/display/internal/give_book
# Injects the pre-built page SNBT from storage into a written_book
# and places it directly in the player's mainhand via item replace.
# Expects: datalib:temp dev_settings_pages (string — serialized JSON array)

function datalib:systems/dev_settings/display/internal/give_book_macro with storage datalib:temp {}
