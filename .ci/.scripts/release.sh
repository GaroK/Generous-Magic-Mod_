#!/usr/bin/env bash

# function for correct encodings
get_encoding() {
    case "$1" in
        # cp1250
        "cs") echo "cp1250" ;;
        "hu") echo "cp1250" ;;
        "pl") echo "cp1250" ;;
        "ro") echo "cp1250" ;;

        # cp1251
        "uk") echo "cp1251" ;;
        "ru" | "ru_russobit" | "ru_snowball") echo "cp1251" ;;

        # cp1252
        "de") echo "cp1252" ;;
        "en") echo "cp1252" ;;
        "es") echo "cp1252" ;;
        "fr") echo "cp1252" ;;
        "it") echo "cp1252" ;;

        # cp1254
        "tr") echo "cp1254" ;;

        # utf8
        "zh_hant" | "zh_Hant") echo "utf8" ;;
        "zh_hans" | "zh_Hans") echo "utf8" ;;
        "cy") echo "utf8" ;;

        # Default case if no match is found
        *) echo "Unknown encoding" ;;
    esac
}

VER=$(date +'%d.%m.%Y')

echo "Substituting Gothic 2 GMM..."

mkdir -p release/{langs,release}
cp -R .ci/.release/* release/release

.ci/.scripts/dacode subs -i cp1252 -c "Data/Scripts" -b "g2loc/.translations" -t ".translations" -d "release/langs" -l cs,de,en,fr,it,pl,ro,ru

echo "Compiling Gothic 2 GMM..."

# Loop over the directories in the specified directory
# and compile the language specific DAT files
for dir in release/langs/*; do
    if [ -d "$dir" ]; then
        LANG=$(basename "$dir")
        ENC=$(get_encoding "$LANG")
        echo "Compiling Gothic 2 GMM $LANG with $ENC"

        .ci/.scripts/dacode \
                compile -c "$dir" \
                -i $ENC \
                -g g2a \
                -e .ci/externals.d \
                -p gothic,menu \
                --no-type-checking \
                --no-control-flow-checks
    fi
done

for dir in release/langs/*; do
    if [ -d "$dir" ]; then

        mkdir -p "$dir/_work/Data/Scripts"
        mv "$dir"/_compiled "$dir"/_work/Data/Scripts/_compiled
        mv "$dir"/Content   "$dir"/_work/Data/Scripts/Content
        mv "$dir"/System    "$dir"/_work/Data/Scripts/System

        mkdir -p "$dir/Autorun"
        cp .ci/resources/zParserExtender.dll "$dir/Autorun"

        LANG=$(basename "$dir")
        ENC=$(get_encoding "$LANG")
        echo "Packing mod files for language $LANG"

        .ci/.scripts/vdfs -b "$dir" -c "Gothic 2 GMM ($LANG)" -o release/release/Data/modvdf/GMM_$LANG.mod .ci/.scripts/gmm.yml

        cp .ci/.scripts/GMM.ini release/release/System/GMM_$LANG.ini
        sed -i "s/{lang}/$LANG/g; s/{ver}/$VER/g; s/{enc}/$ENC/g" release/release/System/GMM_$LANG.ini
    fi

done

cd release/release

zip -rq "GMM.zip" Data System
