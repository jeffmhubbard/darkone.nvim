local c = require("darkone.colors")
local cfg = vim.g.darkone_config
local util = require("darkone.util")

local M = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
	for group_name, group_settings in pairs(highlights) do
		vim.api.nvim_command(
			string.format(
				"highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
				group_name,
				group_settings.fg or "none",
				group_settings.bg or "none",
				group_settings.sp or "none",
				group_settings.fmt or "none"
			)
		)
	end
end

local colors = {
	Fg = { fg = c.fg },
	Grey = { fg = c.grey },
	DarkGrey = { fg = c.dark_grey },
	Red = { fg = c.red },
	Cyan = { fg = c.cyan },
	Yellow = { fg = c.yellow },
	DarkYellow = { fg = c.dark_yellow },
	Green = { fg = c.green },
	Blue = { fg = c.blue },
	Magenta = { fg = c.magenta },
}
hl.common = {
	Normal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
	Terminal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
	EndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0 },
	FoldColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
	Folded = { fg = c.fg, bg = cfg.transparent and c.none or c.bg1 },
	SignColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
	ToolbarLine = { fg = c.fg },
	Cursor = { fmt = "reverse" },
	vCursor = { fmt = "reverse" },
	iCursor = { fmt = "reverse" },
	lCursor = { fmt = "reverse" },
	CursorIM = { fmt = "reverse" },
	CursorColumn = { bg = c.bg1 },
	CursorLine = { bg = c.bg1 },
	ColorColumn = { bg = c.bg1 },
	CursorLineNr = { fg = c.fg },
	LineNr = { fg = c.dark_grey },
	Conceal = { fg = c.dark_grey, bg = c.bg1 },
	Added = colors.Green,
	Removed = colors.Red,
	Changed = colors.Blue,
	DiffAdd = { fg = c.none, bg = c.diff_add },
	DiffChange = { fg = c.none, bg = c.diff_change },
	DiffDelete = { fg = c.none, bg = c.diff_delete },
	DiffText = { fg = c.none, bg = c.diff_text },
	DiffAdded = colors.Green,
	DiffChanged = colors.Blue,
	DiffRemoved = colors.Red,
	DiffDeleted = colors.Red,
	DiffFile = colors.Cyan,
	DiffIndexLine = colors.DarkGrey,
	Directory = { fg = c.blue },
	ErrorMsg = { fg = c.red, fmt = "bold" },
	WarningMsg = { fg = c.yellow, fmt = "bold" },
	MoreMsg = { fg = c.blue, fmt = "bold" },
	CurSearch = { fg = c.bg0, bg = c.dark_yellow },
	IncSearch = { fg = c.bg0, bg = c.dark_yellow },
	Search = { fg = c.bg0, bg = c.bg_yellow },
	Substitute = { fg = c.bg0, bg = c.green },
	MatchParen = { fg = c.none, bg = c.dark_grey },
	NonText = { fg = c.dark_grey },
	Whitespace = { fg = c.dark_grey },
	SpecialKey = { fg = c.dark_grey },
	Pmenu = { fg = c.fg, bg = c.bg1 },
	PmenuSbar = { fg = c.none, bg = c.bg1 },
	PmenuSel = { fg = c.bg0, bg = c.bg_blue },
	WildMenu = { fg = c.bg0, bg = c.blue },
	PmenuThumb = { fg = c.none, bg = c.dark_grey },
	Question = { fg = c.yellow },
	SpellBad = { fg = c.none, fmt = "undercurl", sp = c.red },
	SpellCap = { fg = c.none, fmt = "undercurl", sp = c.yellow },
	SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.blue },
	SpellRare = { fg = c.none, fmt = "undercurl", sp = c.magenta },
	StatusLine = { fg = c.fg, bg = c.bg2 },
	StatusLineTerm = { fg = c.fg, bg = c.bg2 },
	StatusLineNC = { fg = c.dark_grey, bg = c.bg1 },
	StatusLineTermNC = { fg = c.dark_grey, bg = c.bg1 },
	TabLine = { fg = c.fg, bg = c.bg1 },
	TabLineFill = { fg = c.dark_grey, bg = c.bg1 },
	TabLineSel = { fg = c.bg0, bg = c.fg },
	WinSeparator = { fg = c.bg3 },
	Visual = { bg = c.bg3 },
	VisualNOS = { fg = c.none, bg = c.bg2, fmt = "underline" },
	QuickFixLine = { fg = c.blue, fmt = "underline" },
	Debug = { fg = c.yellow },
	debugPC = { fg = c.bg0, bg = c.green },
	debugBreakpoint = { fg = c.bg0, bg = c.red },
	ToolbarButton = { fg = c.bg0, bg = c.bg_blue },
	FloatBorder = { fg = c.dark_grey, bg = c.bg1 },
	NormalFloat = { fg = c.fg, bg = c.bg1 },
}

hl.syntax = {
	String = { fg = c.green, fmt = cfg.code_style.strings },
	Character = colors.DarkYellow,
	Number = colors.DarkYellow,
	Float = colors.DarkYellow,
	Boolean = colors.DarkYellow,
	Type = colors.Yellow,
	Structure = colors.Yellow,
	StorageClass = colors.Yellow,
	Identifier = { fg = c.red, fmt = cfg.code_style.variables },
	Constant = colors.Cyan,
	PreProc = colors.Magenta,
	PreCondit = colors.Magenta,
	Include = colors.Magenta,
	Keyword = { fg = c.magenta, fmt = cfg.code_style.keywords },
	Define = colors.Magenta,
	Typedef = colors.Yellow,
	Exception = colors.Magenta,
	Conditional = { fg = c.magenta, fmt = cfg.code_style.keywords },
	Repeat = { fg = c.magenta, fmt = cfg.code_style.keywords },
	Statement = colors.Magenta,
	Macro = colors.Red,
	Error = colors.Magenta,
	Label = colors.Magenta,
	Special = colors.Red,
	SpecialChar = colors.Red,
	Function = { fg = c.blue, fmt = cfg.code_style.functions },
	Operator = colors.Magenta,
	Title = colors.Cyan,
	Tag = colors.Green,
	Delimiter = colors.Grey,
	Comment = { fg = c.dark_grey, fmt = cfg.code_style.comments },
	SpecialComment = { fg = c.dark_grey, fmt = cfg.code_style.comments },
	Todo = { fg = c.red, fmt = cfg.code_style.comments },
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
	hl.treesitter = {
		-- nvim-treesitter@0.9.2 and after
		["@annotation"] = colors.Fg,
		["@attribute"] = colors.Cyan,
		["@attribute.typescript"] = colors.Blue,
		["@boolean"] = colors.DarkYellow,
		["@character"] = colors.DarkYellow,
		["@comment"] = { fg = c.dark_grey, fmt = cfg.code_style.comments },
		["@comment.todo"] = { fg = c.red, fmt = cfg.code_style.comments },
		["@comment.todo.unchecked"] = { fg = c.red, fmt = cfg.code_style.comments },
		["@comment.todo.checked"] = { fg = c.green, fmt = cfg.code_style.comments },
		["@constant"] = { fg = c.dark_yellow, fmt = cfg.code_style.constants },
		["@constant.builtin"] = { fg = c.dark_yellow, fmt = cfg.code_style.constants },
		["@constant.macro"] = { fg = c.dark_yellow, fmt = cfg.code_style.constants },
		["@constructor"] = { fg = c.yellow, fmt = "bold" },
		["@diff.add"] = hl.common.DiffAdded,
		["@diff.delete"] = hl.common.DiffDeleted,
		["@diff.plus"] = hl.common.DiffAdded,
		["@diff.minus"] = hl.common.DiffDeleted,
		["@diff.delta"] = hl.common.DiffChanged,
		["@error"] = colors.Fg,
		["@function"] = { fg = c.blue, fmt = cfg.code_style.functions },
		["@function.builtin"] = { fg = c.cyan, fmt = cfg.code_style.functions },
		["@function.macro"] = { fg = c.cyan, fmt = cfg.code_style.functions },
		["@function.method"] = { fg = c.blue, fmt = cfg.code_style.functions },
		["@keyword"] = { fg = c.magenta, fmt = cfg.code_style.keywords },
		["@keyword.conditional"] = { fg = c.magenta, fmt = cfg.code_style.keywords },
		["@keyword.directive"] = colors.Magenta,
		["@keyword.exception"] = colors.Magenta,
		["@keyword.function"] = { fg = c.magenta, fmt = cfg.code_style.functions },
		["@keyword.import"] = colors.Magenta,
		["@keyword.operator"] = { fg = c.magenta, fmt = cfg.code_style.keywords },
		["@keyword.repeat"] = { fg = c.magenta, fmt = cfg.code_style.keywords },
		["@label"] = colors.Red,
		["@markup.emphasis"] = { fg = c.fg, fmt = "italic" },
		["@markup.environment"] = colors.Fg,
		["@markup.environment.name"] = colors.Fg,
		["@markup.heading"] = { fg = c.dark_yellow, fmt = "bold" },
		["@markup.link"] = colors.Blue,
		["@markup.link.url"] = { fg = c.cyan, fmt = "underline" },
		["@markup.list"] = colors.Red,
		["@markup.math"] = colors.Fg,
		["@markup.raw"] = colors.Green,
		["@markup.strike"] = { fg = c.fg, fmt = "strikethrough" },
		["@markup.strong"] = { fg = c.fg, fmt = "bold" },
		["@markup.underline"] = { fg = c.fg, fmt = "underline" },
		["@module"] = colors.Yellow,
		["@none"] = colors.Fg,
		["@number"] = colors.DarkYellow,
		["@number.float"] = colors.DarkYellow,
		["@operator"] = colors.Fg,
		["@parameter.reference"] = colors.Fg,
		["@property"] = colors.Cyan,
		["@punctuation.delimiter"] = colors.Grey,
		["@punctuation.bracket"] = colors.Grey,
		["@string"] = { fg = c.green, fmt = cfg.code_style.strings },
		["@string.regexp"] = { fg = c.dark_yellow, fmt = cfg.code_style.strings },
		["@string.escape"] = { fg = c.red, fmt = cfg.code_style.strings },
		["@string.special.symbol"] = colors.Cyan,
		["@tag"] = colors.Magenta,
		["@tag.attribute"] = colors.Yellow,
		["@tag.delimiter"] = colors.Magenta,
		["@text"] = colors.Fg,
		["@note"] = colors.Fg,
		["@warning"] = colors.Fg,
		["@danger"] = colors.Fg,
		["@type"] = colors.Yellow,
		["@type.builtin"] = colors.DarkYellow,
		["@variable"] = { fg = c.fg, fmt = cfg.code_style.variables },
		["@variable.builtin"] = { fg = c.red, fmt = cfg.code_style.variables },
		["@variable.member"] = colors.Cyan,
		["@variable.parameter"] = colors.Red,
		["@markup.heading.1.markdown"] = { fg = c.red, fmt = "bold" },
		["@markup.heading.2.markdown"] = { fg = c.magenta, fmt = "bold" },
		["@markup.heading.3.markdown"] = { fg = c.dark_yellow, fmt = "bold" },
		["@markup.heading.4.markdown"] = { fg = c.red, fmt = "bold" },
		["@markup.heading.5.markdown"] = { fg = c.magenta, fmt = "bold" },
		["@markup.heading.6.markdown"] = { fg = c.dark_yellow, fmt = "bold" },
		["@markup.heading.1.marker.markdown"] = { fg = c.red, fmt = "bold" },
		["@markup.heading.2.marker.markdown"] = { fg = c.magenta, fmt = "bold" },
		["@markup.heading.3.marker.markdown"] = { fg = c.dark_yellow, fmt = "bold" },
		["@markup.heading.4.marker.markdown"] = { fg = c.red, fmt = "bold" },
		["@markup.heading.5.marker.markdown"] = { fg = c.magenta, fmt = "bold" },
		["@markup.heading.6.marker.markdown"] = { fg = c.dark_yellow, fmt = "bold" },

		-- Old configuration for nvim-treesiter@0.9.1 and below
		["@conditional"] = { fg = c.magenta, fmt = cfg.code_style.keywords },
		["@exception"] = colors.Magenta,
		["@field"] = colors.Cyan,
		["@float"] = colors.DarkYellow,
		["@include"] = colors.Magenta,
		["@method"] = { fg = c.blue, fmt = cfg.code_style.functions },
		["@namespace"] = colors.Yellow,
		["@parameter"] = colors.Red,
		["@preproc"] = colors.Magenta,
		["@punctuation.special"] = colors.Red,
		["@repeat"] = { fg = c.magenta, fmt = cfg.code_style.keywords },
		["@string.regex"] = { fg = c.dark_yellow, fmt = cfg.code_style.strings },
		["@text.strong"] = { fg = c.fg, fmt = "bold" },
		["@text.emphasis"] = { fg = c.fg, fmt = "italic" },
		["@text.underline"] = { fg = c.fg, fmt = "underline" },
		["@text.strike"] = { fg = c.fg, fmt = "strikethrough" },
		["@text.title"] = { fg = c.dark_yellow, fmt = "bold" },
		["@text.literal"] = colors.Green,
		["@text.uri"] = { fg = c.cyan, fmt = "underline" },
		["@text.todo"] = { fg = c.red, fmt = cfg.code_style.comments },
		["@text.todo.unchecked"] = { fg = c.red, fmt = cfg.code_style.comments },
		["@text.todo.checked"] = { fg = c.green, fmt = cfg.code_style.comments },
		["@text.math"] = colors.Fg,
		["@text.reference"] = colors.Blue,
		["@text.environment"] = colors.Fg,
		["@text.environment.name"] = colors.Fg,
		["@text.diff.add"] = colors.Green,
		["@text.diff.delete"] = colors.Red,
	}
	if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
		hl.lsp = {
			["@lsp.type.comment"] = hl.treesitter["@comment"],
			["@lsp.type.enum"] = hl.treesitter["@type"],
			["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
			["@lsp.type.interface"] = hl.treesitter["@type"],
			["@lsp.type.typeParameter"] = hl.treesitter["@type"],
			["@lsp.type.keyword"] = hl.treesitter["@keyword"],
			["@lsp.type.namespace"] = hl.treesitter["@module"],
			["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
			["@lsp.type.property"] = hl.treesitter["@property"],
			["@lsp.type.variable"] = hl.treesitter["@variable"],
			["@lsp.type.macro"] = hl.treesitter["@function.macro"],
			["@lsp.type.method"] = hl.treesitter["@function.method"],
			["@lsp.type.number"] = hl.treesitter["@number"],
			["@lsp.type.generic"] = hl.treesitter["@text"],
			["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
			["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
			["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
			["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
			["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
			["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
			["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
			["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
		}
	end
else
	hl.treesitter = {
		TSAnnotation = colors.Fg,
		TSAttribute = colors.Cyan,
		TSBoolean = colors.DarkYellow,
		TSCharacter = colors.DarkYellow,
		TSComment = { fg = c.dark_grey, fmt = cfg.code_style.comments },
		TSConditional = { fg = c.magenta, fmt = cfg.code_style.keywords },
		TSConstant = colors.DarkYellow,
		TSConstBuiltin = colors.DarkYellow,
		TSConstMacro = colors.DarkYellow,
		TSConstructor = { fg = c.yellow, fmt = "bold" },
		TSError = colors.Fg,
		TSException = colors.Magenta,
		TSField = colors.Cyan,
		TSFloat = colors.DarkYellow,
		TSFunction = { fg = c.blue, fmt = cfg.code_style.functions },
		TSFuncBuiltin = { fg = c.cyan, fmt = cfg.code_style.functions },
		TSFuncMacro = { fg = c.cyan, fmt = cfg.code_style.functions },
		TSInclude = colors.Magenta,
		TSKeyword = { fg = c.magenta, fmt = cfg.code_style.keywords },
		TSKeywordFunction = { fg = c.magenta, fmt = cfg.code_style.functions },
		TSKeywordOperator = { fg = c.magenta, fmt = cfg.code_style.keywords },
		TSLabel = colors.Red,
		TSMethod = { fg = c.blue, fmt = cfg.code_style.functions },
		TSNamespace = colors.Yellow,
		TSNone = colors.Fg,
		TSNumber = colors.DarkYellow,
		TSOperator = colors.Fg,
		TSParameter = colors.Red,
		TSParameterReference = colors.Fg,
		TSProperty = colors.Cyan,
		TSPunctDelimiter = colors.Grey,
		TSPunctBracket = colors.Grey,
		TSPunctSpecial = colors.Red,
		TSRepeat = { fg = c.magenta, fmt = cfg.code_style.keywords },
		TSString = { fg = c.green, fmt = cfg.code_style.strings },
		TSStringRegex = { fg = c.dark_yellow, fmt = cfg.code_style.strings },
		TSStringEscape = { fg = c.red, fmt = cfg.code_style.strings },
		TSSymbol = colors.Cyan,
		TSTag = colors.Magenta,
		TSTagDelimiter = colors.Magenta,
		TSText = colors.Fg,
		TSStrong = { fg = c.fg, fmt = "bold" },
		TSEmphasis = { fg = c.fg, fmt = "italic" },
		TSUnderline = { fg = c.fg, fmt = "underline" },
		TSStrike = { fg = c.fg, fmt = "strikethrough" },
		TSTitle = { fg = c.dark_yellow, fmt = "bold" },
		TSLiteral = colors.Green,
		TSURI = { fg = c.cyan, fmt = "underline" },
		TSMath = colors.Fg,
		TSTextReference = colors.Blue,
		TSEnvironment = colors.Fg,
		TSEnvironmentName = colors.Fg,
		TSNote = colors.Fg,
		TSWarning = colors.Fg,
		TSDanger = colors.Fg,
		TSType = colors.Yellow,
		TSTypeBuiltin = colors.DarkYellow,
		TSVariable = { fg = c.fg, fmt = cfg.code_style.variables },
		TSVariableBuiltin = { fg = c.red, fmt = cfg.code_style.variables },
	}
end

local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_magenta or c.magenta
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
	LspCxxHlGroupEnumConstant = colors.DarkYellow,
	LspCxxHlGroupMemberVariable = colors.DarkYellow,
	LspCxxHlGroupNamespace = colors.Blue,
	LspCxxHlSkippedRegion = colors.DarkGrey,
	LspCxxHlSkippedRegionBeginEnd = colors.Red,

	DiagnosticError = { fg = c.red },
	DiagnosticHint = { fg = c.magenta },
	DiagnosticInfo = { fg = c.cyan },
	DiagnosticWarn = { fg = c.yellow },

	DiagnosticVirtualTextError = {
		bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none,
		fg = diagnostics_error_color,
	},
	DiagnosticVirtualTextWarn = {
		bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none,
		fg = diagnostics_warn_color,
	},
	DiagnosticVirtualTextInfo = {
		bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none,
		fg = diagnostics_info_color,
	},
	DiagnosticVirtualTextHint = {
		bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none,
		fg = diagnostics_hint_color,
	},

	DiagnosticUnderlineError = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red },
	DiagnosticUnderlineHint = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.magenta },
	DiagnosticUnderlineInfo = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue },
	DiagnosticUnderlineWarn = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow },

	LspReferenceText = { bg = c.bg2 },
	LspReferenceWrite = { bg = c.bg2 },
	LspReferenceRead = { bg = c.bg2 },

	LspCodeLens = { fg = c.dark_grey, fmt = cfg.code_style.comments },
	LspCodeLensSeparator = { fg = c.dark_grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
	ALEErrorSign = hl.plugins.lsp.DiagnosticError,
	ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
	ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
	BufferCurrent = { fmt = "bold" },
	BufferCurrentMod = { fg = c.dark_yellow, fmt = "bold,italic" },
	BufferCurrentSign = { fg = c.magenta },
	BufferInactiveMod = { fg = c.grey, bg = c.bg1, fmt = "italic" },
	BufferVisible = { fg = c.grey, bg = c.bg0 },
	BufferVisibleMod = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
	BufferVisibleIndex = { fg = c.grey, bg = c.bg0 },
	BufferVisibleSign = { fg = c.grey, bg = c.bg0 },
	BufferVisibleTarget = { fg = c.grey, bg = c.bg0 },
}

hl.plugins.cmp = {
	CmpItemAbbr = colors.Fg,
	CmpItemAbbrDeprecated = { fg = c.grey, fmt = "strikethrough" },
	CmpItemAbbrMatch = colors.Cyan,
	CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
	CmpItemMenu = colors.Grey,
	CmpItemKind = { fg = c.magenta, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
	CocErrorSign = hl.plugins.lsp.DiagnosticError,
	CocHintSign = hl.plugins.lsp.DiagnosticHint,
	CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
	CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
	WhichKey = colors.Red,
	WhichKeyDesc = colors.Blue,
	WhichKeyGroup = colors.DarkYellow,
	WhichKeySeparator = colors.Green,
}

hl.plugins.gitgutter = {
	GitGutterAdd = { fg = c.green },
	GitGutterChange = { fg = c.blue },
	GitGutterDelete = { fg = c.red },
}

hl.plugins.hop = {
	HopNextKey = { fg = c.red, fmt = "bold" },
	HopNextKey1 = { fg = c.cyan, fmt = "bold" },
	HopNextKey2 = { fg = util.darken(c.blue, 0.7) },
	HopUnmatched = colors.DarkGrey,
}

-- comment
hl.plugins.diffview = {
	DiffviewFilePanelTitle = { fg = c.blue, fmt = "bold" },
	DiffviewFilePanelCounter = { fg = c.magenta, fmt = "bold" },
	DiffviewFilePanelFileName = colors.Fg,
	DiffviewNormal = hl.common.Normal,
	DiffviewCursorLine = hl.common.CursorLine,
	DiffviewVertSplit = hl.common.VertSplit,
	DiffviewSignColumn = hl.common.SignColumn,
	DiffviewStatusLine = hl.common.StatusLine,
	DiffviewStatusLineNC = hl.common.StatusLineNC,
	DiffviewEndOfBuffer = hl.common.EndOfBuffer,
	DiffviewFilePanelRootPath = colors.DarkGrey,
	DiffviewFilePanelPath = colors.DarkGrey,
	DiffviewFilePanelInsertions = colors.Green,
	DiffviewFilePanelDeletions = colors.Red,
	DiffviewStatusAdded = colors.Green,
	DiffviewStatusUntracked = colors.Blue,
	DiffviewStatusModified = colors.Blue,
	DiffviewStatusRenamed = colors.Blue,
	DiffviewStatusCopied = colors.Blue,
	DiffviewStatusTypeChange = colors.Blue,
	DiffviewStatusUnmerged = colors.Blue,
	DiffviewStatusUnknown = colors.Red,
	DiffviewStatusDeleted = colors.Red,
	DiffviewStatusBroken = colors.Red,
}

hl.plugins.gitsigns = {
	GitSignsAdd = colors.Green,
	GitSignsAddLn = colors.Green,
	GitSignsAddNr = colors.Green,
	GitSignsChange = colors.Blue,
	GitSignsChangeLn = colors.Blue,
	GitSignsChangeNr = colors.Blue,
	GitSignsDelete = colors.Red,
	GitSignsDeleteLn = colors.Red,
	GitSignsDeleteNr = colors.Red,
}

hl.plugins.neo_tree = {
	NeoTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
	NeoTreeNormalNC = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
	NeoTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
	NeoTreeWinSeparator = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
	NeoTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
	NeoTreeRootName = { fg = c.dark_yellow, fmt = "bold" },
	NeoTreeGitAdded = colors.Green,
	NeoTreeGitDeleted = colors.Red,
	NeoTreeGitModified = colors.Yellow,
	NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
	NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
	NeoTreeIndentMarker = colors.DarkGrey,
	NeoTreeSymbolicLinkTarget = colors.Magenta,
}

hl.plugins.neotest = {
	NeotestAdapterName = { fg = c.magenta, fmt = "bold" },
	NeotestDir = colors.Cyan,
	NeotestExpandMarker = colors.DarkGrey,
	NeotestFailed = colors.Red,
	NeotestFile = colors.Cyan,
	NeotestFocused = { fmt = "bold,italic" },
	NeotestIndent = colors.DarkGrey,
	NeotestMarked = { fg = c.dark_yellow, fmt = "bold" },
	NeotestNamespace = colors.Blue,
	NeotestPassed = colors.Green,
	NeotestRunning = colors.Yellow,
	NeotestWinSelect = { fg = c.cyan, fmt = "bold" },
	NeotestSkipped = colors.Grey,
	NeotestTarget = colors.Magenta,
	NeotestTest = colors.Fg,
	NeotestUnknown = colors.Grey,
}

hl.plugins.nvim_tree = {
	NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
	NvimTreeVertSplit = { fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
	NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
	NvimTreeRootFolder = { fg = c.dark_yellow, fmt = "bold" },
	NvimTreeGitDirty = colors.Yellow,
	NvimTreeGitNew = colors.Green,
	NvimTreeGitDeleted = colors.Red,
	NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
	NvimTreeIndentMarker = colors.Fg,
	NvimTreeImageFile = { fg = c.dark_magenta },
	NvimTreeSymlink = colors.Magenta,
	NvimTreeFolderName = colors.Blue,
}
hl.plugins.telescope = {
	TelescopeBorder = colors.Red,
	TelescopePromptBorder = colors.Cyan,
	TelescopeResultsBorder = colors.Cyan,
	TelescopePreviewBorder = colors.Cyan,
	TelescopeMatching = { fg = c.dark_yellow, fmt = "bold" },
	TelescopePromptPrefix = colors.Green,
	TelescopeSelection = { bg = c.bg2 },
	TelescopeSelectionCaret = colors.Yellow,
}

hl.plugins.dashboard = {
	DashboardShortCut = colors.Blue,
	DashboardHeader = colors.Yellow,
	DashboardCenter = colors.Cyan,
	DashboardFooter = { fg = c.dark_red, fmt = "italic" },
}

hl.plugins.outline = {
	FocusedSymbol = { fg = c.magenta, bg = c.bg2, fmt = "bold" },
	AerialLine = { fg = c.magenta, bg = c.bg2, fmt = "bold" },
}

hl.plugins.navic = {
	NavicText = { fg = c.fg },
	NavicSeparator = { fg = c.grey },
}

hl.plugins.ts_rainbow = {
	rainbowcol1 = colors.Grey,
	rainbowcol2 = colors.Yellow,
	rainbowcol3 = colors.Blue,
	rainbowcol4 = colors.DarkYellow,
	rainbowcol5 = colors.Magenta,
	rainbowcol6 = colors.Green,
	rainbowcol7 = colors.Red,
}

hl.plugins.ts_rainbow2 = {
	TSRainbowRed = colors.Red,
	TSRainbowYellow = colors.Yellow,
	TSRainbowBlue = colors.Blue,
	TSRainbowOrange = colors.DarkYellow,
	TSRainbowGreen = colors.Green,
	TSRainbowViolet = colors.Magenta,
	TSRainbowCyan = colors.Cyan,
}

hl.plugins.rainbow_delimiters = {
	RainbowDelimiterRed = colors.Red,
	RainbowDelimiterYellow = colors.Yellow,
	RainbowDelimiterBlue = colors.Blue,
	RainbowDelimiterOrange = colors.DarkYellow,
	RainbowDelimiterGreen = colors.Green,
	RainbowDelimiterViolet = colors.Magenta,
	RainbowDelimiterCyan = colors.Cyan,
}

hl.plugins.indent_blankline = {
	IndentBlanklineIndent1 = colors.Blue,
	IndentBlanklineIndent2 = colors.Green,
	IndentBlanklineIndent3 = colors.Cyan,
	IndentBlanklineIndent4 = colors.Grey,
	IndentBlanklineIndent5 = colors.Magenta,
	IndentBlanklineIndent6 = colors.Red,
	IndentBlanklineChar = { fg = c.bg1, fmt = "nocombine" },
	IndentBlanklineContextChar = { fg = c.dark_grey, fmt = "nocombine" },
	IndentBlanklineContextStart = { sp = c.dark_grey, fmt = "underline" },
	IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

	-- Ibl v3
	IblIndent = { fg = c.bg1, fmt = "nocombine" },
	IblWhitespace = { fg = c.dark_grey, fmt = "nocombine" },
	IblScope = { fg = c.dark_grey, fmt = "nocombine" },
}

hl.plugins.mini = {
	MiniAnimateCursor = { fmt = "reverse,nocombine" },
	MiniAnimateNormalFloat = hl.common.NormalFloat,

	MiniClueBorder = hl.common.FloatBorder,
	MiniClueDescGroup = hl.plugins.lsp.DiagnosticWarn,
	MiniClueDescSingle = hl.common.NormalFloat,
	MiniClueNextKey = hl.plugins.lsp.DiagnosticHint,
	MiniClueNextKeyWithPostkeys = hl.plugins.lsp.DiagnosticError,
	MiniClueSeparator = hl.plugins.lsp.DiagnosticInfo,
	MiniClueTitle = colors.Cyan,

	MiniCompletionActiveParameter = { fmt = "underline" },

	MiniCursorword = { fmt = "underline" },
	MiniCursorwordCurrent = { fmt = "underline" },

	MiniDepsChangeAdded = hl.common.Added,
	MiniDepsChangeRemoved = hl.common.Removed,
	MiniDepsHint = hl.plugins.lsp.DiagnosticHint,
	MiniDepsInfo = hl.plugins.lsp.DiagnosticInfo,
	MiniDepsMsgBreaking = hl.plugins.lsp.DiagnosticWarn,
	MiniDepsPlaceholder = hl.syntax.Comment,
	MiniDepsTitle = hl.syntax.Title,
	MiniDepsTitleError = hl.common.DiffDelete,
	MiniDepsTitleSame = hl.common.DiffText,
	MiniDepsTitleUpdate = hl.common.DiffAdd,

	MiniDiffSignAdd = colors.Green,
	MiniDiffSignChange = colors.Blue,
	MiniDiffSignDelete = colors.Red,
	MiniDiffOverAdd = hl.common.DiffAdd,
	MiniDiffOverChange = hl.common.DiffText,
	MiniDiffOverContext = hl.common.DiffChange,
	MiniDiffOverDelete = hl.common.DiffDelete,

	MiniFilesBorder = hl.common.FloatBorder,
	MiniFilesBorderModified = hl.plugins.lsp.DiagnosticWarn,
	MiniFilesCursorLine = { bg = c.bg2 },
	MiniFilesDirectory = hl.common.Directory,
	MiniFilesFile = { fg = c.fg },
	MiniFilesNormal = hl.common.NormalFloat,
	MiniFilesTitle = colors.Cyan,
	MiniFilesTitleFocused = { fg = c.cyan, fmt = "bold" },

	MiniHipatternsFixme = { fg = c.bg0, bg = c.red, fmt = "bold" },
	MiniHipatternsHack = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
	MiniHipatternsNote = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
	MiniHipatternsTodo = { fg = c.bg0, bg = c.magenta, fmt = "bold" },

	MiniIconsAzure = { fg = c.bg_blue },
	MiniIconsBlue = { fg = c.blue },
	MiniIconsCyan = { fg = c.cyan },
	MiniIconsGreen = { fg = c.green },
	MiniIconsGrey = { fg = c.fg },
	MiniIconsOrange = { fg = c.dark_yellow },
	MiniIconsMagenta = { fg = c.magenta },
	MiniIconsRed = { fg = c.red },
	MiniIconsYellow = { fg = c.yellow },

	MiniIndentscopeSymbol = { fg = c.dark_grey },
	MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

	MiniJump = { fg = c.magenta, fmt = "underline", sp = c.magenta },

	MiniJump2dDim = { fg = c.dark_grey, fmt = "nocombine" },
	MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },
	MiniJump2dSpotAhead = { fg = c.cyan, bg = c.bg0, fmt = "nocombine" },
	MiniJump2dSpotUnique = { fg = c.yellow, fmt = "bold,nocombine" },

	MiniMapNormal = hl.common.NormalFloat,
	MiniMapSymbolCount = hl.syntax.Special,
	MiniMapSymbolLine = hl.syntax.Title,
	MiniMapSymbolView = hl.syntax.Delimiter,

	MiniNotifyBorder = hl.common.FloatBorder,
	MiniNotifyNormal = hl.common.NormalFloat,
	MiniNotifyTitle = colors.Cyan,

	MiniOperatorsExchangeFrom = hl.common.IncSearch,

	MiniPickBorder = hl.common.FloatBorder,
	MiniPickBorderBusy = hl.plugins.lsp.DiagnosticWarn,
	MiniPickBorderText = { fg = c.cyan, fmt = "bold" },
	MiniPickIconDirectory = hl.common.Directory,
	MiniPickIconFile = hl.common.NormalFloat,
	MiniPickHeader = hl.plugins.lsp.DiagnosticHint,
	MiniPickMatchCurrent = { bg = c.bg2 },
	MiniPickMatchMarked = { bg = c.diff_text },
	MiniPickMatchRanges = hl.plugins.lsp.DiagnosticHint,
	MiniPickNormal = hl.common.NormalFloat,
	MiniPickPreviewLine = { bg = c.bg2 },
	MiniPickPreviewRegion = hl.common.IncSearch,
	MiniPickPrompt = hl.plugins.lsp.DiagnosticInfo,

	MiniStarterCurrent = { fmt = "nocombine" },
	MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
	MiniStarterHeader = colors.Yellow,
	MiniStarterInactive = { fg = c.dark_grey, fmt = cfg.code_style.comments },
	MiniStarterItem = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
	MiniStarterItemBullet = { fg = c.dark_grey },
	MiniStarterItemPrefix = { fg = c.yellow },
	MiniStarterSection = colors.Grey,
	MiniStarterQuery = { fg = c.cyan },

	MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg2 },
	MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg2 },
	MiniStatuslineFilename = { fg = c.dark_grey, bg = c.bg1 },
	MiniStatuslineInactive = { fg = c.dark_grey, bg = c.bg0 },
	MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, fmt = "bold" },
	MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, fmt = "bold" },
	MiniStatuslineModeNormal = { fg = c.bg0, bg = c.green, fmt = "bold" },
	MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyan, fmt = "bold" },
	MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, fmt = "bold" },
	MiniStatuslineModeVisual = { fg = c.bg0, bg = c.magenta, fmt = "bold" },

	MiniSurround = { fg = c.bg0, bg = c.dark_yellow },

	MiniTablineCurrent = { fmt = "bold" },
	MiniTablineFill = { fg = c.dark_grey, bg = c.bg1 },
	MiniTablineHidden = { fg = c.fg, bg = c.bg1 },
	MiniTablineModifiedCurrent = { fg = c.dark_yellow, fmt = "bold,italic" },
	MiniTablineModifiedHidden = { fg = c.grey, bg = c.bg1, fmt = "italic" },
	MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, fmt = "italic" },
	MiniTablineTabpagesection = { fg = c.bg0, bg = c.bg_yellow },
	MiniTablineVisible = { fg = c.grey, bg = c.bg0 },

	MiniTestEmphasis = { fmt = "bold" },
	MiniTestFail = { fg = c.red, fmt = "bold" },
	MiniTestPass = { fg = c.green, fmt = "bold" },

	MiniTrailspace = { bg = c.red },
}

hl.plugins.illuminate = {
	illuminatedWord = { bg = c.bg2, fmt = "bold" },
	illuminatedCurWord = { bg = c.bg2, fmt = "bold" },
	IlluminatedWordText = { bg = c.bg2, fmt = "bold" },
	IlluminatedWordRead = { bg = c.bg2, fmt = "bold" },
	IlluminatedWordWrite = { bg = c.bg2, fmt = "bold" },
}

hl.langs.c = {
	cInclude = colors.Blue,
	cStorageClass = colors.Magenta,
	cTypedef = colors.Magenta,
	cDefine = colors.Cyan,
	cTSInclude = colors.Blue,
	cTSConstant = colors.Cyan,
	cTSConstMacro = colors.Magenta,
	cTSOperator = colors.Magenta,
}

hl.langs.cpp = {
	cppStatement = { fg = c.magenta, fmt = "bold" },
	cppTSInclude = colors.Blue,
	cppTSConstant = colors.Cyan,
	cppTSConstMacro = colors.Magenta,
	cppTSOperator = colors.Magenta,
}

hl.langs.markdown = {
	markdownBlockquote = colors.DarkGrey,
	markdownBold = { fg = c.none, fmt = "bold" },
	markdownBoldDelimiter = colors.DarkGrey,
	markdownCode = colors.Green,
	markdownCodeBlock = colors.Green,
	markdownCodeDelimiter = colors.Yellow,
	markdownH1 = { fg = c.red, fmt = "bold" },
	markdownH2 = { fg = c.magenta, fmt = "bold" },
	markdownH3 = { fg = c.dark_yellow, fmt = "bold" },
	markdownH4 = { fg = c.red, fmt = "bold" },
	markdownH5 = { fg = c.magenta, fmt = "bold" },
	markdownH6 = { fg = c.dark_yellow, fmt = "bold" },
	markdownHeadingDelimiter = colors.DarkGrey,
	markdownHeadingRule = colors.DarkGrey,
	markdownId = colors.Yellow,
	markdownIdDeclaration = colors.Red,
	markdownItalic = { fg = c.none, fmt = "italic" },
	markdownItalicDelimiter = { fg = c.dark_grey, fmt = "italic" },
	markdownLinkDelimiter = colors.DarkGrey,
	markdownLinkText = colors.Red,
	markdownLinkTextDelimiter = colors.DarkGrey,
	markdownListMarker = colors.Red,
	markdownOrderedListMarker = colors.Red,
	markdownRule = colors.Magenta,
	markdownUrl = { fg = c.blue, fmt = "underline" },
	markdownUrlDelimiter = colors.DarkGrey,
	markdownUrlTitleDelimiter = colors.Green,
}

hl.langs.php = {
	phpFunctions = { fg = c.fg, fmt = cfg.code_style.functions },
	phpMethods = colors.Cyan,
	phpStructure = colors.Magenta,
	phpOperator = colors.Magenta,
	phpMemberSelector = colors.Fg,
	phpVarSelector = { fg = c.dark_yellow, fmt = cfg.code_style.variables },
	phpIdentifier = { fg = c.dark_yellow, fmt = cfg.code_style.variables },
	phpBoolean = colors.Cyan,
	phpNumber = colors.DarkYellow,
	phpHereDoc = colors.Green,
	phpNowDoc = colors.Green,
	phpSCKeyword = { fg = c.magenta, fmt = cfg.code_style.keywords },
	phpFCKeyword = { fg = c.magenta, fmt = cfg.code_style.keywords },
	phpRegion = colors.Blue,
}

hl.langs.scala = {
	scalaNameDefinition = colors.Fg,
	scalaInterpolationBoundary = colors.Magenta,
	scalaInterpolation = colors.Magenta,
	scalaTypeOperator = colors.Red,
	scalaOperator = colors.Red,
	scalaKeywordModifier = { fg = c.red, fmt = cfg.code_style.keywords },
}

hl.langs.tex = {
	latexTSInclude = colors.Blue,
	latexTSFuncMacro = { fg = c.fg, fmt = cfg.code_style.functions },
	latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
	latexTSEnvironmentName = colors.Yellow,
	texCmdEnv = colors.Cyan,
	texEnvArgName = colors.Yellow,
	latexTSTitle = colors.Green,
	latexTSType = colors.Blue,
	latexTSMath = colors.DarkYellow,
	texMathZoneX = colors.DarkYellow,
	texMathZoneXX = colors.DarkYellow,
	texMathDelimZone = colors.Grey,
	texMathDelim = colors.Magenta,
	texMathOper = colors.Red,
	texCmd = colors.Magenta,
	texCmdPart = colors.Blue,
	texCmdPackage = colors.Blue,
	texPgfType = colors.Yellow,
}

hl.langs.vim = {
	vimOption = colors.Red,
	vimSetEqual = colors.Yellow,
	vimMap = colors.Magenta,
	vimMapModKey = colors.DarkYellow,
	vimNotation = colors.Red,
	vimMapLhs = colors.Fg,
	vimMapRhs = colors.Blue,
	vimVar = { fg = c.fg, fmt = cfg.code_style.variables },
	vimCommentTitle = { fg = c.grey, fmt = cfg.code_style.comments },
}

local lsp_kind_icons_color = {
	Default = c.magenta,
	Array = c.yellow,
	Boolean = c.dark_yellow,
	Class = c.yellow,
	Color = c.green,
	Constant = c.dark_yellow,
	Constructor = c.blue,
	Enum = c.magenta,
	EnumMember = c.yellow,
	Event = c.yellow,
	Field = c.magenta,
	File = c.blue,
	Folder = c.dark_yellow,
	Function = c.blue,
	Interface = c.green,
	Key = c.cyan,
	Keyword = c.cyan,
	Method = c.blue,
	Module = c.dark_yellow,
	Namespace = c.red,
	Null = c.dark_grey,
	Number = c.dark_yellow,
	Object = c.red,
	Operator = c.red,
	Package = c.yellow,
	Property = c.cyan,
	Reference = c.dark_yellow,
	Snippet = c.red,
	String = c.green,
	Struct = c.magenta,
	Text = c.grey,
	TypeParameter = c.red,
	Unit = c.green,
	Value = c.dark_yellow,
	Variable = c.magenta,
}

function M.setup()
	-- define cmp and aerial kind highlights with lsp_kind_icons_color
	for kind, color in pairs(lsp_kind_icons_color) do
		hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
		hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
		hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
	end

	vim_highlights(hl.common)
	vim_highlights(hl.syntax)
	vim_highlights(hl.treesitter)
	if hl.lsp then
		vim_highlights(hl.lsp)
	end
	for _, group in pairs(hl.langs) do
		vim_highlights(group)
	end
	for _, group in pairs(hl.plugins) do
		vim_highlights(group)
	end

	-- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
	local function replace_color(prefix, color_name)
		if not color_name then
			return ""
		end
		if color_name:sub(1, 1) == "$" then
			local name = color_name:sub(2, -1)
			color_name = c[name]
			if not color_name then
				vim.schedule(function()
					vim.notify(
						'darkone.nvim: unknown color "' .. name .. '"',
						vim.log.levels.ERROR,
						{ title = "darkone.nvim" }
					)
				end)
				return ""
			end
		end
		return prefix .. "=" .. color_name
	end

	for group_name, group_settings in pairs(vim.g.darkone_config.highlights) do
		vim.api.nvim_command(
			string.format(
				"highlight %s %s %s %s %s",
				group_name,
				replace_color("guifg", group_settings.fg),
				replace_color("guibg", group_settings.bg),
				replace_color("guisp", group_settings.sp),
				replace_color("gui", group_settings.fmt)
			)
		)
	end
end

return M
