function powoff --wraps='systemctl poweroff' --description 'alias powoff=systemctl poweroff'
  systemctl poweroff $argv
        
end
