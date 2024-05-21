if [ ! -d "$XDG_MUSIC_DIR" ]; then
	echo '$XDG_MUSIC_DIR does not exist as a directory'
	exit 1
fi

function play() {
	SONG=$(gum file "$XDG_MUSIC_DIR")
	flac -s -d -c "$SONG" | aplay
}

play
