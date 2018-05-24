#!/bin/bash
playlistFolder="/storage/playlists/"
romsFolder="/storage/roms/"

cd $romsFolder
for console in *
do
	echo Building $console playlist
	echo -e "\t in $playlistFolder$console.lpl"
	
	# Delete previous file
	rm $playlistFolder$console.lpl
	
	# Go to ROMs folder
	cd $romsFolder$console

	# For each rom at "ground" level, add an entry to the playlist
	for game in *.*
	do
		echo $romsFolder$console/$game >> $playlistFolder$console.lpl # Add ROM path
		echo ${game%.*} >> $playlistFolder$console.lpl # Add game title (Filename without extension)
		echo DETECT >> $playlistFolder$console.lpl # Automatic
		echo DETECT >> $playlistFolder$console.lpl # Automatic
		echo "0|crc" >> $playlistFolder$console.lpl # BS CRC
		echo $console.lpl >> $playlistFolder$console.lpl # Put the playlist filename there because its needed for whatever reason
	done
done