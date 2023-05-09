# Help with commands for me

## Splits and tabs

* get a new nvim tab by
    * `:tabnew %`
    * swap between them by using `gt`

* splits 
    * `:vsplit` or `vs`
    * `:split`  or `sp` 
    * `Ctrl+w` window things

## Other
* Change things inside of parentheses
    * `ci(` : change inner (
    * `yi"` : yank inner "

* Move inline fast:
    * `f<char>` : moves until next char
    * `F<char>` : moves until previous char
    * `t<char>` : moves one before

    * Things to not forget :
    * `yy` : yanks all the line
    * `D`  : deletes until the end

## intermediate : 
*   Select then "=" to auto indent
*   `:nohl` to remove highlightings
*   select thing then `#` to find other occurence
*   set waypoint `m<char>` then jump with `'<char>`
*   recenter with `zz`
*   re-execute last command with `.`

## registers
*   `:reg` :  to show registers
*   `"<char>` :  to access that register eg `"1p` to paste it `"1y` yank into it
*   `"+` : contains the clipboard
*   `q<char>` :  record macro, `q` again to stop it (it is then accessible as a reg)

## Search_replace
* `%s/string_to_replace/replacement_string/g` : the whole file
* `s/string_to_replace/replacement_string/g`  : the selected portion file


