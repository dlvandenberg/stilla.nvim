local Util = require("stilla.util")
local M = {}

---@type stilla.HighlightsFn
function M.get(c, opts)
  return {
    -- UI / LAYOUT ──────────────────────────────────────────────────────────────────────
    Comment = { fg = c.comment, style = opts.styles.comment }, -- any comment
    ColorColumn = { bg = c.black }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.bg_highlight }, -- placeholder characters substituted for concealed text
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = "Cursor", -- charactor under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = "Cursor", -- like Cursor, but used when in IME mode
    CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor
    CursorColumn = "Cursor", -- Screen-column at the cursor
    Directory = { fg = c.moonstone }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.border }, -- the column separating vertically split windows
    WinSeparator = { fg = c.border, bold = true }, -- window separator
    Folded = { fg = c.fold, bg = c.bg_highlight }, -- line used for closed folds
    FoldColumn = { bg = opts.transparent and c.none or c.bg_sidebar, fg = c.comment }, -- 'foldcolmun'
    SignColumn = { bg = opts.transparent and c.none or c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.sub, fg = c.fg }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.fg_gutter_highlight, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    LineNrAbove = "LineNr",
    LineNrBelow = "LineNr",
    MatchParen = { fg = c.attention, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.builtin, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.attention }, -- Area for messages and cmdline
    MoreMsg = { fg = c.moonstone }, -- |more-prompt|
    NonText = { fg = c.fg_gutter }, -- '@' at the end of the window
    Normal = { fg = c.fg, bg = opts.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = opts.transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_gutter, bg = c.bg_sidebar }, -- normal text in sidebar
    NormalFloat = { fg = c.fg, bg = c.bg_float }, -- normal text in floating windows
    FloatBorder = { fg = c.border, bg = c.bg_float }, -- Border
    FloatTitle = { fg = c.attention, bg = c.bg_float }, -- title in floating windows
    Pmenu = { bg = c.bg_float, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = Util.blend_bg(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = Util.blend_bg(c.bg_float, 0.95) }, -- Popup menu: scrollbar.
    Question = { fg = c.moonstone }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.attention, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = "IncSearch",
    -- SpecialKey = { fg = c.surface_2 }, -- Unprintable characters: text displayed differently from what it really is.
    SpellBad = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.black, bg = c.bg_highlight }, -- status line of not-current windows
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.mountbatten }, -- tab pages line, active tabe page label
    Title = { fg = c.language, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual, bold = true }, -- Visual mode selection
    VisualNOS = "Visual", -- Visual mode selection when vim is "Not owning the selection",
    WarningMsg = { fg = c.warning }, -- warning messages
    -- Whitespace = { fg = c.surface_1 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion
    WinBar = "StatusLine", -- window status bar
    WinBarNC = "StatusLineNC", -- window status bar in inactive windows

    -- SYNTAX ──────────────────────────────────────────────────────────────────────
    Bold = { bold = true, fg = c.fg }, -- any text that is bold
    Character = { fg = c.constant }, --  a character constant: 'c', '\n'
    Constant = { fg = c.constant }, -- (preferred) any constant
    Debug = { fg = c.attention }, -- debugging statements
    Delimiter = { fg = c.delimiter }, -- character that needs attention
    Error = { fg = c.error }, -- any erroneous construct
    Function = { fg = c.function_decl, style = opts.styles.functions }, -- function name (also: methods for classes)
    Identifier = { fg = c.language, style = opts.styles.variables }, -- (preferred) any variable name
    Italic = { italic = true, fg = c.fg }, -- any text that is italic
    Keyword = { fg = c.language, style = opts.styles.keywords }, -- any other keyword
    Operator = { fg = c.language }, -- "sizeof", "+", "*", etc.
    -- PreProc = { fg = c.pink }, -- generic Preprocessor
    Special = { fg = c.delimiter }, -- any special symbol
    Statement = { fg = c.language }, -- any statement
    String = { fg = c.string }, -- a string constant
    Todo = { bg = Util.blend_bg(c.attention, 0.5), fg = c.bg }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Type = { fg = c.fg }, -- int, long, char, etc.
    Underlined = { underline = true }, -- text that stands out, HTML links
    Conditional = "Statement",
    Repeat = "Statement",

    -- OTHER ──────────────────────────────────────────────────────────────────────
    debugBreakpoint = { bg = Util.blend_bg(c.info, 0.1), fg = c.info }, -- debugging statements
    debugPC = { bg = c.bg_sidebar }, -- highlight current line
    dosIniLabel = "@property",
    -- helpCommand = { bg = c.black, fg = c.moonstone },
    -- htmlH1 = { fg = c.ash, bold = true },
    -- htmlH2 = { fg = c.khaki, bold = true },
    -- qfFileName = { fg = c.moonstone },
    -- qfLineNr = { fg = c.citron },
    -- mkdCodeDelimiter = { bg = c.bg, fg = c.fg },
    -- mkdCodeStart = { fg = c.timberwolf, bold = true },
    -- mkdCodeEnd = { fg = c.timberwolf, bold = true },
    zshVariableDef = { fg = c.local_var },
    zshDeref = { fg = c.constant },
    netrwMarkFile = { fg = c.constant, bold = true },

    -- Diagnostics ──────────────────────────────────────────────────────────────────────
    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticUnnecessary = { fg = Util.blend_bg(c.hint, 0.7) },
    DiagnosticVirtualTextError = { bg = Util.blend_bg(c.error, 0.1), fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = Util.blend_bg(c.warning, 0.1), fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = Util.blend_bg(c.info, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = Util.blend_bg(c.hint, 0.1), fg = c.hint }, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics

    -- Health ──────────────────────────────────────────────────────────────────────
    healthError = { fg = c.error },
    healthSuccess = { fg = c.success },
    healthWarning = { fg = c.warning },

    -- LSP (native) ──────────────────────────────────────────────────────────────────────
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.4), bold = true },
    LspCodeLens = { fg = c.comment },
    --   LspInlayHint = { bg = Util.blend_bg(c.pink, 0.1), fg = c.surface_2 },
    LspInfoBorder = { fg = c.border, bg = c.bg_float },
  }
end

return M
