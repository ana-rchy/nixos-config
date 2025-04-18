--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require 'lush'
local hsl = lush.hsl
local hsluv = lush.hsluv

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Normal { bg = hsluv(352.6, 100, 1.8), fg = hsluv(360, 90, 87) },

    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn    { }, -- Columns set with 'colorcolumn'
    Conceal {}, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { bg = hsluv(4, 100, 54), fg = Normal.bg }, -- Character under the cursor
    CurSearch { bg = Normal.bg.lighten(17).desaturate(20) }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { bg = Normal.bg.lighten(3) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = hsluv(263, 100, 70) }, -- Directory names (and other special names in listings)
    DiffAdd { fg = hsluv(140, 100, 80) }, -- Diff mode: Added line |diff.txt|
    DiffChange { fg = hsluv(87, 92, 97) }, -- Diff mode: Changed line |diff.txt|
    DiffText { fg = DiffChange.fg }, -- Diff mode: Changed text within a changed line |diff.txt|
    DiffDelete { fg = Cursor.bg.darken(5) }, -- Diff mode: Deleted line |diff.txt|
    Added { fg = DiffAdd.fg },
    Changed { fg = DiffChange.fg },
    Removed { fg = DiffDelete.fg },
    GitSignsStagedAdd { fg = Added.fg.lighten(50) },
    GitSignsStagedChange { fg = Changed.fg.lighten(20) },
    GitSignsStagedDelete { fg = Removed.fg.lighten(20) },
    -- EndOfBuffer {}, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg { fg = hsluv(10, 90, 50) }, -- Error messages on the command line
    VertSplit { bg = Normal.bg.lighten(45) }, -- Column separating vertically split windows
    Folded {}, -- Line used for closed folds
    FoldColumn {}, -- 'foldcolumn'
    SignColumn { bg = Normal.bg }, -- Column where |signs| are displayed
    IncSearch { bg = CurSearch.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr { fg = Normal.bg.lighten(25).desaturate(30) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr { fg = DiffText.fg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { fg = CursorLineNr.fg.lighten(25) }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { bg = Normal.bg }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen { bg = CurSearch.bg.lighten(30), fg = CursorLineNr.fg }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg { fg = Normal.fg }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { fg = DiffAdd.fg }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    ---- Normal         { bg = hsluv(360, 50, 10), fg = hsluv(60, 100, 90) }, -- Normal text
    NormalFloat { bg = Normal.bg, fg = Normal.fg }, -- Normal text in floating windows.
    FloatTitle { fg = CursorLineNr.fg }, -- Title of floating windows.
    FloatBorder { bg = NormalFloat.bg, fg = FloatTitle.fg.lighten(20) }, -- Border of floating windows.
    NormalNC { fg = NormalFloat.fg.darken(20).desaturate(20) }, -- normal text in non-current windows
    Pmenu { bg = Normal.bg.saturate(5).lighten(15) }, -- Popup menu: Normal item.
    PmenuSel { bg = Pmenu.bg.lighten(53), fg = Pmenu.bg.darken(50) }, -- Popup menu: Selected item. also normal mode
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    PmenuSbar { bg = hsluv(263, 80, 20) }, -- Popup menu: Scrollbar.
    PmenuThumb { bg = Directory.fg.darken(20) }, -- Popup menu: Thumb of the scrollbar.
    Question { fg = MsgArea.fg.darken(10) }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { bg = Normal.bg.desaturate(10).lighten(55), fg = Normal.bg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey { fg = hsluv(4, 190, 56) }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLineNC { bg = Normal.bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- StatusLine { bg = StatusLineNC.bg.lighten(30), fg = StatusLineNC.fg.lighten(10) }, -- Status line of current window
    -- TabLine        { }, -- Tab pages line, not active tab page label
    -- TabLineFill    { }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title { fg = Directory.fg }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { bg = Normal.bg.saturate(15).lighten(20) }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = CursorLineNr.fg.lighten(16) }, -- Warning messages
    Whitespace { fg = Normal.bg.lighten(2) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { fg = Normal.bg.lighten(10) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    IblScope { fg = Whitespace.fg },

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment { fg = Normal.bg.desaturate(40).lighten(35) }, -- Any comment

    Constant { fg = hsluv(238, 90, 70) }, -- (*) Any constant
    String { fg = Constant.fg.lighten(50) }, --   A string constant: "this is a string"
    Character { fg = String.fg.lighten(40) }, --   A character constant: 'c', '\n'
    -- Number         { }, --   A number constant: 234, 0xff
    Boolean { fg = hsluv(150, 100, 72) }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier { fg = Directory.fg.lighten(50) }, -- (*) Any variable name
    Function { fg = Identifier.fg.darken(32) }, --   Function name (also: methods for classes)

    Statement { fg = hsluv(150, 100, 85) }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Operator       { }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    Exception { fg = hsluv(4, 190, 56) }, --   try, catch, throw

    PreProc { fg = hsluv(20, 100, 63) }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type { fg = hsluv(86, 100, 98) }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special { fg = Constant.fg.desaturate(10) }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter { fg = Character.fg }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined { fg = Function.fg.lighten(30), gui = 'underline' }, -- Text that stands out, HTML links
    Ignore { fg = Comment.fg.darken(10) }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error { bg = Exception.fg.darken(5), fg = Normal.bg }, -- Any erroneous construct
    Todo { bg = Type.fg.darken(6), fg = Normal.bg }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { fg = Exception.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { fg = WarningMsg.fg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { fg = Identifier.fg.darken(35) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { fg = DiagnosticInfo.fg.lighten(40) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk { fg = Statement.fg.lighten(30) }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { sp = DiagnosticError.fg.lighten(5), gui = 'underline' } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { sp = DiagnosticWarn.fg.lighten(10), gui = 'underline' } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { sp = DiagnosticInfo.fg.lighten(20), gui = 'underline' } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { sp = DiagnosticHint.fg.lighten(30), gui = 'underline' } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { sp = DiagnosticOk.fg.lighten(10), gui = 'underline' } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { fg = Constant.fg.lighten(25) }, -- Special
    -- sym"@constant.macro"    { fg = sym"@constant.builtin".fg }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    sym"@string.escape"     { fg = Character.fg }, -- SpecialChar
    sym"@string.special"    { fg = Character.fg }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    sym"@function.builtin"  { fg = Function.fg.lighten(30) }, -- Special
    -- sym"@function.macro"    { fg = sym"@function.builtin".fg }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
    


    MiniJump2dSpot { bg = CurSearch.bg, fg = Normal.fg, gui = "bold,nocombine" },

    BufferCurrent { fg = hsl(60, 100, 67) },
    BufferCurrentSign { fg = BufferCurrent.fg },
    BufferCurrentSignRight { fg = BufferCurrentSign.fg },
    BufferCurrentMod { fg = BufferCurrent.fg },
    BufferCurrentModBtn { fg = BufferCurrentMod.fg },

    BufferInactive { fg = Comment.fg.lighten(5) },
    BufferInactiveSign { fg = BufferInactive.fg.darken(35) },
    BufferInactiveSignRight { fg = BufferInactiveSign.fg },
    BufferInactiveMod { fg = BufferInactive.fg },
    BufferInactiveModBtn { fg = BufferInactive.fg.lighten(25) },
  }
end)




vim.opt.background = 'dark'
vim.g.colors_name = 'oneshot-theme'

package.loaded['oneshot-theme'] = nil
require('lush')(theme)
