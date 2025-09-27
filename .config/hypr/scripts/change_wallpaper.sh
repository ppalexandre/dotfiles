#!/bin/bash

WALLPAPER=""
WALLPAPER_DIRECTORY=$HOME/.wallpapers
WALLPAPER_LIST=$(find "$WALLPAPER_DIRECTORY"/* -type f | sort)
WALLPAPER_LIST=($WALLPAPER_LIST)
CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded)

if [ "$CURRENT_WALLPAPER" ==  "no wallpapers loaded" ] ; then
    WALLPAPER=${WALLPAPER_LIST[0]}
else
    CURRENT_WALLPAPER=$(readlink -f $CURRENT_WALLPAPER)

    INDEX=0
    WALLPAPER_LIST_LENGTH=${#WALLPAPER_LIST[@]}
    for i in "${WALLPAPER_LIST[@]}"
    do
        if [ "$i" == "$CURRENT_WALLPAPER" ] ; then
            INDEX=$(($INDEX+$1))
            if (( $INDEX >= $WALLPAPER_LIST_LENGTH )) ; then
                INDEX=0
            fi
            WALLPAPER=${WALLPAPER_LIST[$INDEX]}
            break;
        fi
        ((INDEX++))
    done
fi


# If a wallpaper is found
if [[ $WALLPAPER != "" ]] ; then
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
    hyprctl hyprpaper unload unused
    rm $HOME/.config/hypr/scripts/last_wallpaper
    ln -s $WALLPAPER $HOME/.config/hypr/scripts/last_wallpaper
fi

# alternative command to randomize wallpapers
# WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)
