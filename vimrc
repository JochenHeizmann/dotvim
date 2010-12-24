syntax on        " Syntaxhighlightning einschalten

filetype plugin indent on
set guifont=Monaco:h14 

set number       " Zeilennummerierung
" Suche NICHT case-senitiv, ausser ein Grossbuchstabe steht im Suchmuster
set ignorecase
set smartcase
set expandtab
set wrapscan     " Beim Suchen ueber Dateiende hinausgehen
set hlsearch     " Highlight Suchresultate
set incsearch    " Inkrementelle Suche
set ruler        " Koordinaten in der Statuszeile anzeigen
set nocompatible " Keine alten Bugs emulieren

set foldenable   " Folding verwenden
set foldmethod=indent " Folding beim Einruecken
set foldlevel=100     " Manuell folden

set nowrap       " Zeilen nicht umbrechen

set shiftwidth=4 " Tabs auf 2
set shiftround   " Auf nächsten Tab einrücken

" Automatisches Einruecken
set autoindent
set smartindent

set title        " Titel in Terminals
set visualbell   " Gepiepse ausschalten
set nobackup     " Keine Backupdateien

set pastetoggle=<F9> " Mit F9 vor dem Einschalten kann gepastet werden

let Tlist_Ctags_Cmd='ctags'
let tlist_haxe_settings='haxe;f:functions;v:variables;c:classes;i:interfaces;e:enums;t:typedefs'
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1

" let g:haxe_build_hxml="/Users/jochenheizmann/Projekte/mvctest/myapp.hxml"
let g:haxe_build_hxml="/Users/jochenheizmann/Projekte/Masterplan/make.hxml"
set makeprg=~/Projekte/Masterplan/make.sh

map <F2> :FufFile<CR>
map <F3> :NERDTree<CR>
map <F12> :edit ~/.vimrc<CR>
map <F5> :w!<CR>:make<CR>:copen<CR><C-w>6-<CR>
imap <F5> <ESC>:w!<CR>:make<CR>:copen<CR><C-w>6-<CR>
map <F1> :TlistAddFiles **/*.hx<CR>
" Autocompletion, IntelliSense, ...

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType rb,ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType sql set omnifunc=sqlcomplete#Complete
autocmd Filetype * set omnifunc=syntaxcomplete#Complete

" Commenter
map ,/ :s/^/\/\//<CR>
map ,, :s/^\/\///<CR>
" TList
map <Tab> :Tlist<CR>
"
" Bubble single lines
nmap <S-K> ddkP
nmap <S-J> ddp
" Bubble multiple lines
vmap <S-K> xkP`[V`]
vmap <S-J> xp`[V`]

map <C-a> 0
map <C-e> g$
imap <C-a> <Esc>0i
imap <C-e> <Esc>g$i

nmap <S-Tab> <C-w>w

" Farben Tageszeitabhaengig
set background=light
let hr=strftime('%H')
if 0 <= hr && hr <= 5
    colorscheme evening
    set background=dark
elseif 6 <= hr && hr <= 7
    colorscheme morning
elseif 8 <= hr && hr <= 21
    colorscheme ron
else
    colorscheme evening
    set background=dark
endif

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

fun! ActivateAddons()
    set runtimepath+=~/.vim/vim-addons/vim-addon-manager
    try
        call scriptmanager#Activate(['FuzzyFinder', 'vim-haxe', 'The_NERD_tree', 'taglist', 'MRU', 'snipMate', 'tComment', 'xmledit'])
    catch /.*/
        echoe v:exception
        :co
    endtry
endf
call ActivateAddons()
