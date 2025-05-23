#!/bin/bash

WALLPAPER_DIRECTORY=$HOME/.wallpapers
WALLPAPER_LIST=$(find "$WALLPAPER_DIRECTORY"/* -type f | sort)
WALLPAPER_LIST=($WALLPAPER_LIST)
CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded)
WALLPAPER=""

INDEX=0
for i in "${WALLPAPER_LIST[@]}"
do
    if [ "$i" == "$CURRENT_WALLPAPER" ] ; then
        INDEX=$(($INDEX+$1))
        WALLPAPER=${WALLPAPER_LIST[$INDEX]}
        break;
    fi
    ((INDEX++))
done

# If a wallpaper is found
if [[ $WALLPAPER != "" ]] ; then
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
    hyprctl hyprpaper unload unused
fi

# alternative command to randomize wallpapers
# WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)
