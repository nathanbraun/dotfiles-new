iqa!
e hosts/fl
lua vim.lsp.diagnostic.goto_next()
checkhealth
PlugUpdate
ChadDeps
CHADdeps
CHADo
CHADOpen
CHADop
q!call neuron#edit_zettel_select()
kq
xacall neuron#edit_zettel_backlink()call neuron#edit_zettel_select()
xacall neuron#edit_zettel_backlink()
xacall neuron#edit_zettel_backlink()call neuron#edit_zettel_new('')
xcall neuron#edit_zettel_select()
COQnow
COQhelp
iCOQhelp custom_sources](https://github.com/ms-jpq/coq_nvim/tree/coq/docs/CUSTOM_SOURCES.md)
Ack! Users/nathanbraun/fantasymath/fantasybook/ltcwff.md
'<,'>/,/, /
'<,'>s/,/, /g
'<,'>s/"/'/g
inoh
e srm_208_1.py
RBListToggle
e /Users/nathanbraun/fantasymath/ltcwff-site/src/Layout.elm
e elm.json
e /Users/nathanbraun/learning/elm/eAck! Users/nathanbraun/.dotfiles/link/.config_.
local log = require 'vim.lsp.log'
local vim = vim

-- Ref (in Japanese): https://daisuzu.hatenablog.com/entry/2019/12/06/005543
-- Ref: https://qrunch.net/@igrep/entries/K6sUDofcmvtnRqzk
function tagfunc_nvim_lsp(pattern, flags, info)
 local result = {}
 local isSearchingFromNormalMode = flags == "c"

 local method
 local params
 if isSearchingFromNormalMode then
   -- Jump to the definition of the symbol under the cursor
   -- when called by CTRL-]
   method = 'textDocument/definition'
   params = util.make_position_params()
 else
   -- NOTE: Currently I'm not sure how this clause is tested
   --       because `:tag` command doesn't seem to use `tagfunc`.

   -- Search with `pattern` when called by ex command (e.g. `:tag`)
   method = 'workspace/symbol'

   -- Delete "\<" from `pattern` when prepended.
   -- Perhaps the server doesn't support regex in vim!
   params = {}
   if string.find(flags, 'i') then
     params.query = string.sub(pattern, '^\\<', '')
   else
     params.query = pattern
   end
 end
 local client_id_to_results, err = lsp.buf_request_sync(0, method, params, 800)
 if err then
   print('Error when calling tagfunc: ' .. err)
   return result
 end

 for _client_id, results in pairs(client_id_to_results) do
   for i, lsp_result in ipairs(results.result) do
     local name
     local location
     if isSearchingFromNormalMode then
       name = pattern
       location = lsp_result
     else
       name = lsp_result.name
       location = lsp_result.location
     end
     local location_for_tagfunc = {
       name = name,
       filename = vim.uri_to_fname(location.uri),
       cmd = tostring(location.range.start.line + 1)
     }
     table.insert(result, location_for_tagfunc)
 end
 end
 return result
end
