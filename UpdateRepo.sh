 #!/bin/bash
rm -f ./Packages
rm -f ./Packages.bz2


for file in ./deb/*
do
  num=$((num + 1))
  dpkg-deb -f $file >> Packages
  echo Filename: $file >> Packages
  echo Size: `wc -c < $file` >> Packages
  echo MD5sum: `MD5sum $file | cut -d '.' -f 1` >> Packages
  echo \ >> Packages
  echo Finished `dpkg-deb -f $file Name` v`dpkg-deb -f $file Version`
done
echo -e "\033[32m"Finished Writing $num Packages "\033[0;39m"
bzip2 Packages
