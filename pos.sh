#!/bin/bash

echo "Listing $1 contents...."
sleep 2
ls -al $1
echo "Archiving $1 contents ...."
sleep 2
tar -czvf $1.tar.gz $1
echo "Completing zipping of file..."
sleep 2


