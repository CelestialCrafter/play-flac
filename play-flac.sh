cleanup() {
    # kill all processes whose parent is this process
    pkill -P $$
}

for sig in INT QUIT HUP TERM; do
  trap "
    cleanup
    trap - $sig EXIT
    kill -s $sig "'"$$"' "$sig"
done
trap cleanup EXIT

if [ ! -d "$XDG_MUSIC_DIR" ]; then
	echo '$XDG_MUSIC_DIR does not exist as a directory'
	exit 1
fi

function play() {
	SONG=$(gum file "$XDG_MUSIC_DIR")
	if [ "$SONG" = "user aborted" ]; then
		exit
	fi
	flac -s -d -c "$SONG" | aplay & cava
}

play
