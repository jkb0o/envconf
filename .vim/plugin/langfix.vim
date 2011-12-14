" set characters you want to fix in insert mode
let g:langmap_fix_chars = "qwertyuop[]asdfghjkl;'zxcvbnm,./"

function! DoLangMapFix()

    " get current langmap
    redir => l:lmstr 
    set langmap
    redir END

    " create original maplist and locale maplist
    let l:lmstr = substitute(l:lmstr, "\n", "","g")
    let l:lmstr = substitute(lmstr, "  langmap=", "", "")
    let l:langsets = split(lmstr, ',')
    let l:corig = []
    let l:clocal = []
    for langset in l:langsets
        let [ l:local, l:orig ] = split(langset, ';')
        for char in split(orig, '\zs')
            let l:corig += [char]
        endfor
        for char in split(local, '\zs')
            let l:clocal += [char]
        endfor
    endfor

    " create list of current imaps
    let l:index = 0
    redir => l:imapss
    silent imap
    redir END
    let l:imaps = split(l:imapss, '\n')
    while index < len(l:imaps)
        let l:imaps[l:index] = substitute(l:imaps[l:index], '\n', '', 'g')
        let l:imaps[l:index] = substitute(l:imaps[l:index], '^i  ', '', '')
        let l:index += 1
    endwhile
    let l:index = 0

    " fix locale characters
    for char in l:corig

        " fix only chars we want
        if match(g:langmap_fix_chars, char) > -1

            " check is imap for char avaible
            let l:foundmap = ''
            for fmap in l:imaps
                if match(fmap, '^<C-' . toupper(char) . '>', '') > -1
                    let l:foundmap = fmap
                    break
                endif
            endfor

            " won't fix
            if len(l:foundmap) == 0
                let l:index += 1
                cont
            endif

            " here we are
            let l:lchar = l:clocal[l:index]
            let l:mapping = substitute(l:foundmap, '^<C-.>', '<C-' . l:lchar . '>', '')
            let l:cmd = 'imap ' . l:mapping
            silent exec l:cmd
            echo l:cmd
        endif
        let l:index += 1
    endfor
endfunction

silent call DoLangMapFix()
