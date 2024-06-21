term="alacritty"

killterm(){
    local seconds="$1"
    sleep $seconds
    pkill "$term" 
}