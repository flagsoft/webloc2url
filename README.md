# webloc2url
Converts webloc (Mac) to url (Windows) files

Do you have a lot of .webloc files needed to be converted to .url files?
Then webloc2url.sh is for you!

* .webloc is known to work on Mac only, but not on Windows.
* .url is known to work on Mac as on Windows PC.

After converting, just double click on the .url files to open URL in web browser.

Should be mulitasking multithreading multiuser save.

## Example Usage
```
cd ./top_path_to_webloc_dir/
bash ./webloc2url.sh
```

## Example Run
```
michi@OSX ~/DATA/Prj/webloc2url $ bash ./webloc2url.sh 

webloc2url.sh Copyright (C) 2015 by mzm
This program comes with ABSOLUTELY NO WARRANTY; for details see file LICENSE.
This is free software, and you are welcome to redistribute it
under certain conditions; see file LICENSE for details.

Found webloc: ./testing/website-link-mac.webloc
 - Link is: http://www.google.com
 - Create Windows url file

all done.
michi@OSX ~/DATA/Prj/webloc2url $ 
```

File ./testing/website-link-mac.webloc has been convertet to ./testing/website-link-mac.url.

## UI - User Interface
https://github.com/anonymousaga made a UI with AppleScript. Not testet by myself.
"I made a GUI for your app using applescript. I built it as an alternative in-an-out converter instead of finding and creating. I wanted to make sure you received credit for the real work of my app - the converting. Here is the app: https://github.com/anonymousaga/webloc-to-url-mac-app/"

