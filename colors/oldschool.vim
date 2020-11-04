" Setup {{{
hi clear
if exists("syntax_on")
  syntax reset
endif
set background=light
let g:colors_name="oldschool"
" }}}
" Colors {{{
let s:col            = {}
let s:col.none       = ['NONE', 'NONE']
let s:col.background = ['#E2DBC8', 0]
let s:col.darker_bg = ['#D8CCB4', 0]
" let s:col.black_bg = ['#D0BD97', 0]
let s:col.black_bg = ['#C0A886', 0]
let s:col.blacker_bg = ['#a08866', 0]

let s:col.brown = ['#936039', 0]
let s:col.yellow = ['#F6AF2F', 0]
let s:col.blue = ['#014cc0', 0]
let s:col.green = ['#006500', 0]
let s:col.red = ['#ba0000', 0]
let s:col.black = ['#000000', 0]
let s:col.violet = ['#332e75', 0]
let s:col.orange = ['#cD5300', 0]
let s:col.gray = ['#72777d', 0]
let s:col.brown_fg = ['#442b18', 0]

let s:col.blue_bg = ['#AFEEEE',0]
let s:col.green_bg = ['#56E156',0]
let s:col.yellow_bg = ['#FFED4C',0]
let s:col.orange_bg = ['#FF863C',0]
let s:col.red_bg = ['#FF6262',0]
" }}}
" Highlighting Function from https://github.com/sjl/badwolf {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:col, a:fg)
            let histring .= 'guifg=' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:col, a:1)
            let histring .= 'guibg=' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:col, a:3)
        let histring .= 'guisp=' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}
" Highlights {{{
call s:HL('InfoMsg',         'black', 'blue_bg')
call s:HL('Normal',          'black', 'background')
call s:HL('NormalFloat',     'black', 'black_bg')
call s:HL('NonText',         'brown_fg',    'background')
call s:HL('EndOfBuffer',     'brown_fg', 'background')
call s:HL('LineNr',          'brown_fg',    'black_bg')
call s:HL('FoldColumn',      'black_bg', 'gray')
call s:HL('Folded',          'gray',  'black_bg')
call s:HL('MatchParen',      'red',    'none',       'bold')
call s:HL('SignColumn',      'black_bg',  'black_bg')
call s:HL('Comment',         'gray',    'none')
call s:HL('Conceal',         'red',      'none')
call s:HL('Constant',        'violet',   'none')
call s:HL('Error',           'red',      'none',       'none')
call s:HL('Identifier',      'brown',   'none',       'none')
call s:HL('Ignore',          'gray',    'none')
call s:HL('PreProc',         'green',    'none')
call s:HL('Special',         'orange',    'none')
call s:HL('Statement',       'black',      'none',       'bold')
call s:HL('Todo',            'blue', 'none', 'bold,underline')
call s:HL('Type',            'blue',       'none',       'none')
call s:HL('Underlined',      'brown',   'none')
call s:HL('Pmenu',           'brown_fg', 'black_bg')
call s:HL('PmenuSbar',       'black_bg', 'black_bg')
call s:HL('PmenuSel',        'black', 'black_bg', 'bold')
call s:HL('PmenuThumb',      'brown' , 'black_bg')
call s:HL('ErrorMsg',        'black',      'red_bg',       'none')
call s:HL('ModeMsg',         'orange',    'none')
call s:HL('MoreMsg',         'brown',   'none')
call s:HL('Question',        'black', 'none')
call s:HL('WarningMsg',      'black',      'yellow_bg')
call s:HL('TabLine',         'black', 'darker_bg',   'none')
call s:HL('TabLineFill',     'black', 'darker_bg',   'none')
call s:HL('TabLineSel',      'black', 'black_bg', 'bold')
call s:HL('Cursor',          'none',       'black')
call s:HL('CursorColumn',    'none',       'darker_bg')
call s:HL('CursorLineNr',    'orange',    'black_bg')
call s:HL('CursorLine',      'none',       'darker_bg',   'none')
call s:HL('StatusLine',      'black_bg', 'brown_fg')
call s:HL('StatusLineNC',    'darker_bg',     'gray')
call s:HL('Visual',          'none',       'black_bg')
call s:HL('VisualNOS',       'black', 'background')
call s:HL('VertSplit',       'black_bg',  'black_bg')
call s:HL('WildMenu',        'black', 'background')
call s:HL('Function',        'brown',   'none',       'none')
call s:HL('SpecialKey',      'orange',    'none')
call s:HL('Title',           'green',      'none',       'bold')
call s:HL('DiffAdd',         'black',     'green_bg')
call s:HL('DiffChange',      'black',     'yellow_bg')
call s:HL('DiffDelete',      'black',     'red_bg', 'none')
call s:HL('DiffText',        'brown',   'none')
call s:HL('Directory',       'blue',      'none')
call s:HL('debugPC',         'red',      'none')
call s:HL('debugBreakpoint', 'red',      'none')
call s:HL('ColorColumn',     'none',       'darker_bg')
call s:HL('Delimiter',       'none',       'none')
call s:HL('Operator',        'black',   'none',       'none')
call s:HL('htmlTagName',     'black',      'none',       'bold')
call s:HL('htmlTag',         'black', 'none')
call s:HL('htmlArg',         'brown',   'none')

call s:HL('IncSearch',  'black', 'yellow', 'bold')
call s:HL('Search',     'black', 'yellow', 'bold')
call s:HL('Substitute', 'black', 'yellow', 'bold')
call s:HL('SpellBad',   'red',   'none',       'bold,underline')
call s:HL('SpellCap',   'red',   'none',       'bold,underline')
call s:HL('SpellLocal', 'red', 'none',       'bold,underline')
call s:HL('SpellRare',  'red', 'none',       'bold,underline')
call s:HL('htmlBold',  'black', 'none',       'bold')
call s:HL('htmlItalic',  'black', 'none',       'italic')

hi link String                   Constant
hi link Terminal                 Normal
hi link Number                   Constant
hi link CursorIM                 Cursor
hi link Boolean                  Constant
hi link Character                Constant
hi link Conditional              Statement
hi link Debug                    Special
hi link Define                   PreProc
hi link Exception                Statement
hi link Float                    Number
hi link HelpCommand              Statement
hi link HelpExample              Statement
hi link Include                  PreProc
hi link Keyword                  Statement
hi link Label                    Statement
hi link Macro                    PreProc
hi link Number                   Constant
hi link PreCondit                PreProc
hi link Repeat                   Statement
hi link SpecialChar              Special
hi link SpecialComment           Special
hi link StorageClass             Statement
hi link Structure                Statement
hi link Tag                      Special
hi link Terminal                 Normal
hi link Typedef                  Statement
hi link htmlEndTag               htmlTagName
hi link htmlLink                 Function
hi link htmlSpecialTagName       htmlTagName
hi link htmlTag                  htmlTagName
hi link xmlTag                   Statement
hi link xmlTagName               Statement
hi link xmlEndTag                Statement
hi link asciidocQuotedEmphasized Preproc
hi link diffBDiffer              WarningMsg
hi link diffCommon               WarningMsg
hi link diffDiffer               WarningMsg
hi link diffIdentical            WarningMsg
hi link diffIsA                  WarningMsg
hi link diffNoEOL                WarningMsg
hi link diffOnly                 WarningMsg
hi link diffRemoved              DiffDelete
hi link diffAdded                DiffAdd
hi link QuickFixLine             Search
hi link ConId                    Type

hi link vimUserFunc              Function

" Neovim Language Server {{{
hi link LspDiagnosticsError                   Pmenu
hi link LspDiagnosticsErrorSign               ErrorMsg
hi link LspDiagnosticsErrorSignFloating       PMenu
hi link LspDiagnosticsWarning                 PMenu
hi link LspDiagnosticsWarningSign             WarningMsg
hi link LspDiagnosticsWarningSignFloating     PMenu
hi link LspDiagnosticsHint                    PMenu
hi link LspDiagnosticsHintSign                InfoMsg
hi link LspDiagnosticsHintSignFloating        PMenu
hi link LspDiagnosticsInformation             PMenu
hi link LspDiagnosticsInformationSign         InfoMsg
hi link LspDiagnosticsInformationSignFloating PMenu
" }}}

" Fzf
if get(g:, 'sitruuna_fzf', 1) == 1
  let g:fzf_colors =
        \ { 'fg':    ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Type', 'Type'],
        \ 'fg+':     ['fg', 'Normal'],
        \ 'bg+':     ['bg', 'Normal'],
        \ 'hl+':     ['fg', 'Type'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'DiffAdded'],
        \ 'pointer': ['fg', 'Function'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }
endif

if has('nvim')
  let g:terminal_color_0 = s:col.black[0]
  let g:terminal_color_8 = s:col.gray[0]

  let g:terminal_color_1 = s:col.red[0]
  let g:terminal_color_9 = s:col.red[0]

  let g:terminal_color_2 = s:col.green[0]
  let g:terminal_color_10 = s:col.green[0]

  let g:terminal_color_3 = s:col.yellow[0]
  let g:terminal_color_11 = s:col.yellow[0]

  let g:terminal_color_4 = s:col.blue[0]
  let g:terminal_color_12 = s:col.blue[0]

  let g:terminal_color_5 = s:col.violet[0]
  let g:terminal_color_13 = s:col.violet[0]

  let g:terminal_color_6 = s:col.blue_bg[0]
  let g:terminal_color_14 = s:col.blue_bg[0]

  let g:terminal_color_7 = s:col.darker_bg[0]
  let g:terminal_color_15 = s:col.black_bg[0]
endif
" }}}
