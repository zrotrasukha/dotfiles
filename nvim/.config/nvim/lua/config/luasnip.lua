local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Key mappings for expanding and jumping within snippets
vim.keymap.set({ "i", "s" }, "<A-n>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-S-n>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Lua snippets
ls.add_snippets("lua", {
  s("clog", {
    t('console.log("hello world") '),
  }),
})

-- C++ snippets
ls.add_snippets("cpp", {
  s("main", {
    t({
      "#include <iostream>",
      "using namespace std;",
      "",
      "int main() {",
      "\t",
    }),
    i(1), -- Insert node 1: where the cursor will start typing inside main()
    t({
      "",
      "}",
    }),
  }),
  s("vectorMain", {
    t({
      "#include <iostream>",
      "#include <vector>",
      "using namespace std;",
      "",
      "int main() {",
      "\t",
    }),
    i(1), -- Insert node 1: where the cursor will start typing inside main()
    t({
      "",
      "}",
    }),
    i(2), -- Insert node 2: where the cursor will start typing after main()
  }),
})

-- JavaScript snippets
ls.add_snippets("javascript", {
  s("tailwind-content", {
    t({
      "content: [",
      '    "./index.html",',
      '    "./src/**/*.{js,ts,jsx,tsx}",',
      "],",
    }),
  }),
  s("arrow", {
    t("const "),
    i(1, "name"),
    t(" = ("),
    i(2),
    t(") => {"),
    t({ "", "\t" }),
    i(3), -- Indented body of the arrow function
    t({ "", "}" }), -- Closing brace
  }),
  s("clog", {
    t("console.log("),
    i(1), -- Insert node 1: cursor position for the log content
    t(")"),
    i(2), -- Insert node 2: cursor position after the log statement
  }),
  s("instail", {
    t({
      "npm install -D tailwindcss postcss autoprefixer",
      "npx tailwindcss init -p",
    }),
  }),
  s("curljson", {
    t("curl -X "),
    i(1, "GET "),
    i(2, "url "),
    t(" -H 'Content-Type: application/json'"),
    t(" -d '{"),
    i(3, "data"),
    t("}'"),
  }),
  s("curlHeader", {
    t("curl -X GET "),
    i(1, "url"),
    t("-H "),
    i(2, "header"),
  }),
})

-- JavaScriptReact snippets
ls.add_snippets("javascriptreact", {
  s("clog", {
    t("console.log("),
    i(1), -- Insert node 1: cursor position for the log content
    t(")"),
    i(2), -- Insert node 2: cursor position after the log statement
  }),
  s("instail", {
    t({
      "npm install -D tailwindcss postcss autoprefixer",
      "npx tailwindcss init -p",
    }),
  }),
})
