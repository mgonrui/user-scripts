if type "xrandr"; then
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload bar &
done
else
  polybar --reload bar &
fi