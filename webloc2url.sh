#!/bin/bash
##
## webloc2url.sh - Converts webloc (Mac) to url (Windows) files.
##
## Copyright (c) 2015 by mzm
##
## License:
##   GPL
##
## Description:
##   Converts .webloc Mac files in current folder and all subfolders to .url
##   files for Windows.
##
## Usage:
##   cd ./top_path_to_webloc_dir/
##   bash ./webloc2url.sh
##
## Details:
##
## Input: "link.webloc" (Mac):
## ---------------------------------------------------------------------------------------
## <?xml version="1.0" encoding="UTF-8"?>
## <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
## <plist version="1.0">
## <dict>
## 	<key>URL</key>
## 	<string>http://www.google.com</string>
## </dict>
## </plist>
## ---------------------------------------------------------------------------------------
##
## Output "link.url" (Windows):
## ---------------------------------------------------------------------------------------
## [InternetShortcut]
## URL=http://www.google.com
## ---------------------------------------------------------------------------------------
##
## Misc:
##
## URL aus .webloc-Datei auslesen
## Getestet mit: Mac OS X 10.4.8 und AppleScript 1.10.7
## Wenn man den URL aus einer .webloc-Datei (wird erstellt wenn man aus Safari den URL 
## zum Beispiel auf den Schreibtisch zieht) auslesen möchte, dann kann man dies wie folgt tun:
##
## set the_file to choose file
## try
##     tell application "Finder"
##         set the_location to location of file the_file
##         display dialog the_location buttons {"OK"} default button 1
##     end tell
## end try
##

echo ""
echo "webloc2url.sh Copyright (C) 2015 by mzm"
echo "This program comes with ABSOLUTELY NO WARRANTY; for details see file LICENSE."
echo "This is free software, and you are welcome to redistribute it"
echo "under certain conditions; see file LICENSE for details."
echo ""

TEMP_LIST="webloc2url-list.txt.$$.tmp"

find . "(" -name "*.webloc" ")" > $TEMP_LIST

while read p; do

	echo "Found webloc: $p"
                                                   ## $p: ./some/dir/link.webloc
	DIR=$(dirname "${p}")                          ##     ./some/dir
	FILENAME=$(basename "${p}")                    ##     link.webloc
	FILENAME_BASE=$(basename "$FILENAME" .webloc)  ##     link

	TEMP_FILE=$DIR/temp_link.url.$$.tmp            ## ./some/dir/temp_link.url.2342343.tmp

	FILEPATH_url="${DIR}/${FILENAME_BASE}.url"     ## ./some/dir/link.url

	## remove any "._XY" files - AppleDouble encoded Macintosh file
	## see: http://en.wikipedia.org/wiki/AppleSingle_and_AppleDouble_formats
	dot_clean -m $DIR

	LINK=`plutil -convert xml1 -o - "$p" | grep "string" | sed "s/<string>//" | sed "s/<\/string>//" | sed "s/	//"`
	## NOTE: last sed contains a TAB caracter
	echo " - Link is: $LINK"

	#FILEPATH_url_q=$(printf %q "$FILEPATH_url")
	#echo "** FILEPATH_url_q: $FILEPATH_url_q"

	echo " - Create Windows url file"

	echo "[InternetShortcut]" > ${TEMP_FILE}
	echo "URL=$LINK" >> ${TEMP_FILE}

	#echo "${TEMP_FILE} -> ${FILEPATH_url}"
	mv ${TEMP_FILE} "${FILEPATH_url}"

	echo ""

done < $TEMP_LIST

rm -f $TEMP_LIST

echo "all done."

## EOF.
