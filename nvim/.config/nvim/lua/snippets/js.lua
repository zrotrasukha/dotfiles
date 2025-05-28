local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("lwda", {
    t({ "import React from 'react';", "", "const " }),
    i(1, "ComponentName"),
    t({ " = () => {", "  return (", "    <div>" }),
    i(2, "Hello World"),
    t({ "</div>", "  );", "};", "", "export default " }),
    i(1),
    t(";"),
  }),
}
