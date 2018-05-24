#!/bin/bash
playlistFolder="/storage/playlists"
romsFolder="/storage/roms"

if [[ $1 -eq "-h" ]]
then
	echo "Automatically generates Lakka Playlists"
	echo ""
	echo -e "\tThis script is designed to build playlists"
	echo -e "\tthat will reflect what's on your roms folder"
	echo ""
	echo -e "\tIF YOU'RE NOT RUNNING IT ON LAKKA IT WONT WORK"
	echo -e "\tLakka autodetects cores for games on playlists"
	echo -e "\tregular Retroarch, however, doesn't do that, as far as i know"
	echo ""
	echo "Options:"
	echo -e "\t\-h\tDisplays this"
	exit 1
fi

cd $romsFolder
for console in *
do
	echo Building $console playlist
	echo -e "\t in $playlistFolder/$console.lpl"
	
	# Delete previous file
	rm "$playlistFolder/$console.lpl" 2>&1 > /dev/null
	touch "$playlistFolder/$console.lpl"
	
	# Go to ROMs folder
	cd "$romsFolder/$console"

	# For each rom at "ground" level, add an entry to the playlist
	for game in *.*
	do
		echo $romsFolder/$console/$game >> "$playlistFolder/$console.lpl" # Add ROM path
		echo ${game%.*} >> "$playlistFolder/$console.lpl" # Add game title (Filename without extension)
		echo DETECT >> "$playlistFolder/$console.lpl" # Automatic Core
		echo DETECT >> "$playlistFolder/$console.lpl" # Automatic Core name
		echo DETECT >> "$playlistFolder/$console.lpl" # Automatic CRC
		echo $console.lpl >> "$playlistFolder/$console.lpl" # Put the playlist filename there because its needed for whatever reason
	done
done