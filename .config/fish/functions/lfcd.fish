function lfcd
    set __lfcd_tmp (mktemp)
    lf -last-dir-path="$__lfcd_tmp" "$argv"
    if test -f $__lfcd_tmp
        set __lfcd_dir (cat $__lfcd_tmp)
        rm -f $__lfcd_tmp
        if test -d $__lfcd_dir
            if test $__lfcd_dir != (pwd)
                cd $__lfcd_dir
                fish_vi_key_bindings
                commandline -f repaint

                # running fzf within lf messes up the prompt, this is
                # enough to get fish to redraw it properly
                echo -n ''
            end
        end
    end
end
