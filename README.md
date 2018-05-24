# Lakka Playlist Generator
### Generate playlists for every folder on your ROMs folder

Script designed with the intent to have playlists reflect what's on the ROMs folder

Generate a playlist for each folder on your ROMs folder, ignoring No-intro, romsets, etc.


This script is intended to be run at system startup or each time you add roms to your Lakka box with no user interaction (besides initial installation)

**THIS DOESN'T WORK ON RETROARCH**
Lakka autodetects which core to use for games on playlists
Regular Retroarch, however, doesn't seem to do that, as far as i tested

**NOTE:** This hasn't been tested with zipped ROMs

#### Installation

- Copy this script anywhere on your Lakka system

- Edit the script variables ```playlistFolder``` and ```romsFolder``` to match your folders

	- The default ones should work, since they are the default ones on Lakka

#### How to use

- On your ROMs folder, there should be a folder for each playlist you want to generate

	My recommendation is having one folder per console
	Each folder should have the name of the system, following the naming convention for the theme icons
	You can find these names on ```/usr/share/retroarch-assets/xmb/monochrome/png``` )
	This way, each playlist will have its corresponding icon

- Run the script and let it do it's magic, after a short wait, you should have your new playlists generated