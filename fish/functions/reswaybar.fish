function reswaybar --wraps='killall -SIGUSR2 waybar' --description 'alias reswaybar=killall -SIGUSR2 waybar'
  killall -SIGUSR2 waybar $argv
        
end
