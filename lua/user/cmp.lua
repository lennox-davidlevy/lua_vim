local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local lspkind_comparator = function(conf)
	local lsp_types = require("cmp.types").lsp
	return function(entry1, entry2)
		if entry1.source.name ~= "nvim_lsp" then
			if entry2.source.name == "nvim_lsp" then
				return false
			else
				return nil
			end
		end
		local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
		local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

		local priority1 = conf.kind_priority[kind1] or 0
		local priority2 = conf.kind_priority[kind2] or 0
		if priority1 == priority2 then
			return nil
		end
		return priority2 < priority1
	end
end

local label_comparator = function(entry1, entry2)
	return entry1.completion_item.label < entry2.completion_item.label
end

local kind_icons = {
	Text = "txt",
	Method = "mtd",
	Function = "fun",
	Constructor = "con",
	Field = "fld",
	Variable = "var",
	Class = "cls",
	Interface = "int",
	Module = "mod",
	Property = "prp",
	Unit = "unt",
	Value = "val",
	Enum = "enm",
	Keyword = "kwd",
	Snippet = "snp",
	Color = "col",
	File = "fil",
	Reference = "ref",
	Folder = "fol",
	EnumMember = "Enm",
	Constant = "con",
	Struct = "stt",
	Event = "evt",
	Operator = "opr",
	TypeParameter = "tpr",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	sorting = {
		priority_weight = 1.0,
		comparators = {
			cmp.config.compare.locality,
			cmp.config.compare.recently_used,
			cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
			cmp.config.compare.offset,
			cmp.config.compare.order,
			-- cmp.config.compare.kind,

			lspkind_comparator({
				kind_priority = {
					Field = 11,
					Property = 11,
					Constant = 10,
					Enum = 0,
					EnumMember = 0,
					Event = 10,
					Function = 10,
					Method = 10,
					Operator = 10,
					Reference = 10,
					Struct = 10,
					Variable = 9,
					File = 8,
					Folder = 8,
					Class = 5,
					Color = 5,
					Module = 5,
					Keyword = 2,
					Constructor = 1,
					Interface = 1,
					Snippet = 0,
					Text = 1,
					TypeParameter = 1,
					Unit = 1,
					Value = 1,
				},
			}),
			label_comparator,
		},
	},
	enabled = function()
		-- disable completion if the cursor is `Comment` syntax group.
		-- return not require("cmp.config.context").in_syntax_group("Comment")
		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "prompt" then
			return false
		end
		if
			require("cmp.config.context").in_treesitter_capture("comment") == true
			or require("cmp.config.context").in_syntax_group("Comment")
		then
			return false
		end
		return true
	end,
	performance = {
		debounce = 350,
		throttle = 150,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		-- fields = { "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp", max_item_count = 30, keyword_length = 3 },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
