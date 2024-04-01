# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/projects/leethacks/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "leet_editor"

# Split window into panes.
split_h 20
#split_h 50

# Run commands.
run_cmd "nvim"

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 0
