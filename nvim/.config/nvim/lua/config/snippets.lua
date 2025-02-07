vim.snippet("javascript", {
	{
		trigger = "clog",
		description = "Console log snippet",
		body = {
			"console.log(${1})${0}",
		},
	},
	{
		trigger = "arf",
		description = "Arrow function snippet",
		body = {
			"const ${1:name} = (${2}) => {",
			"  ${3}",
			"}",
		},
	},
	{
		trigger = "instail",
		description = "Tailwind installation commands",
		body = {
			"npm install -D tailwindcss postcss autoprefixer",
			"npx tailwindcss init -p",
		},
	},
})

vim.snippet("typescript", {
	{
		trigger = "use",
		description = "useState in TypeScript",
		body = {
			"const [{${1:state}}, set${1:/capitalize}] = useState(${2:initValue})${0}",
		},
	},
	{
		trigger = "com",
		description = "JSX comment snippet",
		body = {
			"{/* ${1} */}",
		},
	},
})

vim.snippet("css", {
	{
		trigger = "tailwind-boilerplate",
		description = "Tailwind boilerplate snippet",
		body = {
			"@tailwind base;",
			"@tailwind utilities;",
			"@tailwind components;",
		},
	},
})

vim.snippet("html", {
	{
		trigger = "axios",
		description = "Axios CDN snippet",
		body = {
			'<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.7.7/axios.min.js"></script>',
		},
	},
})

vim.snippet("cpp", {
	{
		trigger = "main",
		description = "Main function snippet for C++",
		body = {
			"#include <iostream>",
			"using namespace std;",
			"",
			"int main() {",
			"  ${1}",
			"  return 0;",
			"}",
		},
	},
})
