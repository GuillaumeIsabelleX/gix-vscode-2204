dockertag=jgwill/gix:gix-vscode-2204

#chg back to that user
#dkchguser=vscode
dkchguser=jgi
dkusehomedir=true

containername=vscodebuild2204
dkhostname=$containername

#dkrunmode="bg" #default fg
#dkrestart="--restart" #default
#dkrestarttype="unless-stopped" #default

dkport=4000:4000

#dkvolume="myvolname220413:/app" #create or use existing one
dkvolume="$containername:/app" #create with containername name

#dkecho=true #just echo the docker run

#dkcommand=bash #command to execute (default is the one in the dockerfile)

#dkextra="MY EXTRA ARGS"

#dkmounthome=true

#xmount=/tmp:/a/tmp
#xmount2=/var:/a/var

