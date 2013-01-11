call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("syntax")
  syntax on
endif

filetype on
filetype plugin on

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	filetype plugin indent on
endif

set background=dark
set autoindent
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set cindent 
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set showmatch
set linebreak
set whichwrap=b,s,<,>,[,]
set number
set history=50 
set showcmd
set showmode
set incsearch
set hlsearch

set foldmethod=syntax
set foldlevel=100
set foldcolumn=5

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> 

imap <F3> <C-X><C-O>
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_SelectFirstItem = 2 
let OmniCpp_NamespaceSearch = 2 
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_GlobalScopeSearch=1 
let OmniCpp_DisplayMode=1 
let OmniCpp_ShowScopeInAbbr=1 
let OmniCpp_ShowAccess=1

let Tlist_Ctags_Cmd='ctags'
let Tlist_Use_Right_Window=1 
let Tlist_Show_One_File=0 
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Process_File_Always=1 
let Tlist_Inc_Winwidth=0

map <F6> :make clean<CR><CR><CR>
map <F7> :make<CR><CR><CR> :copen<CR><CR>
map <F8> :cp<CR>
map <F9> :cn<CR>
imap <F6> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR>:copen<CR><CR>
imap <F8> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>

if has("cscope")
	set csprg=/usr/bin/cscope        
	set csto=0                        
	set cst                           
	set cscopequickfix=s-,c-,d-,i-,t-,e-   
	set nocsverb
	if filereadable("cscope.out")    
		cs add cscope.out
	elseif $CSCOPE_DB != ""            
		cs add $CSCOPE_DB
	endif
	set csverb
endif
			
map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR> 
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>


map <F5> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
