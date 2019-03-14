#!/bin/bash
rm Packages.bz2
dpkg-scanpackages -m ./deb > Packages
perl -i -pe 's/Sileodepiction/SileoDepiction/g' Packages
bzip2 Packages
rm Packages
