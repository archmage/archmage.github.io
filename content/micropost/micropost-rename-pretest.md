+++
date = "2019-09-16T17:17:33+10:00"

+++
I wrote a bash script that automatically renames micropost files according to their date of creation. This is an unfortunate necessity to allow microposts to have their URLs reflect their post time, due to Hugo enforcing a filename-to-default-URL behaviour.

I've hooked it up to my site deployment pipeline; to test it I'm going to set this micropost's filename to some gibberish. If it shows up live on my site with a proper URL, the script will have worked!