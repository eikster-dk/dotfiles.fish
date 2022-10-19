local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
		snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
  window = {
		documentation = cmp.config.window.bordered(),
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	completion = {
		keyword_length = 3,
	},
  mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
  formatting = {
    fields = { "kind", "abbr", "menu"},
  },
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{
			name = "luasnip",
			keyword_length = 2,
			priority = 50,
		},
	}, {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "emoji" },
		{ name = "calc" },
	}),
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Select,
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
})
