#! /bin/bash
##  Backup script for Gentoo Linux
##  Author: BrianW
##  Date: 2004.10.26.
##  Adapted from backupHome.sh by fdavid
##  Further adapted by nianderson

##  This is a script to create a custom stage 4 tarball (System and boot backup)
##  I use this script to make a snapshot of my system. Meant to be done weekly in my case

##  Please check the options and adjust to your specifics.

echo -=- Starting the Backup Script...
echo -=-

##  Mounting the boot partition
echo -=- Mounting boot partition, then sleeping for 5 seconds...
mount /boot
sleep 5
echo -=- Done!
echo -=-

echo -=- Setting the variables...

##  The location of the stage 4 tarball.
##  Be sure to include a trailing /
stage4Location=/

##  The name of the stage 4 tarball.
archive=$stage4Location$(hostname)-$(date +%F_%H-%M)-stage4.tar.gz

##  Directories/files that will be exluded from the stage 4 tarball.
##
##  Add directories that will be recursively excluded, delimited by a space. 
##  Be sure to omit the trailing /
dir_excludes="/proc /sys /tmp /usr/portage /var/db/repos /var/cache/distfiles /var/tmp"
##
##  Add files that will be excluded, delimited by a space.
##  You can use the * wildcard for multiple matches.
##  There should always be $archive listed or bad things will happen.
file_excludes="$archive"
##
##  Combine the two *-excludes variables into the $excludes variable
excludes="$(for i in $dir_excludes; do if [ -d $i ]; then echo -n " --exclude=$i/*"; fi; done) $(for i in $file_excludes; do echo -n " --exclude=$i"; done)"

##  The options for the stage 4 tarball.
tarOptions="$excludes --create --gzip --absolute-names --preserve-permissions --xattrs --acls --verbose --file"

echo -=- Done!
echo -=-

##  Creating the stage 4 tarball.
echo -=- Creating custom stage 4 tarball \=\=\> $archive
echo -=-
echo -=- Running the following command:
echo -=- tar ${tarOptions} ${archive} /
tar ${tarOptions} ${archive} /;
echo -=- Done!

##  Unmounting /boot
echo -=- Unmounting /boot then sleeping for 5 seconds...
umount /boot
sleep 5
echo -=- Done!
echo -=-

##  Split the stage 4 tarball in cd size tar files.
##  Use: "cat ${archive}.* >> ${archive}" to join the tar files into a stage 4 tarball.
##  Uncomment the following lines to enable this feature.
#echo -=- Splitting the stage 4 tarball into CD size tar files...
#split --bytes=700000000 ${archive} ${archive}.
#echo -=- Done!

##  This is the end of the line.
echo -=- The Backup Script has completed!

