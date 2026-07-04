set fish_greeting ''



# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# opencode
fish_add_path /home/chris/.opencode/bin
set -x LIBVIRT_DEFAULT_URI qemu:///system

alias ff="fastfetch"
