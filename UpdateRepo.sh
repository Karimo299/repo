 #!/bin/bash
repo="."
rm -f $repo/Packages
for file in $repo/*/*.deb
do
  num=$((num + 1))
  echo Name: `dpkg-deb -f $file Name`>>$repo/Packages
  echo Package: `dpkg-deb -f $file Package` >> $repo/Packages
  echo Version: `dpkg-deb -f $file Version` >> $repo/Packages
  echo Description: `dpkg-deb -f $file Description` >> $repo/Packages
  echo Architecture: `dpkg-deb -f $file Architecture` >> $repo/Packages
  echo Author: `dpkg-deb -f $file Author` >> $repo/Packages
  echo Maintainer: `dpkg-deb -f $file Maintainer` >> $repo/Packages
  echo Installed-Size: `dpkg-deb -f $file Installed-Size` >> $repo/Packages
  echo Depends: `dpkg-deb -f $file Depends` >> $repo/Packages
  echo Filename: $file >> $repo/Packages
  echo Size: `wc -c < $file` >> $repo/Packages
  echo MD5sum: `MD5sum $file | cut -d '.' -f 1` >> $repo/Packages
  echo SHA1: `sha1sum $file | cut -d '.' -f 1` >> $repo/Packages
  echo SHA256: `shasum -a 256 $file | cut -d '.' -f 1` >> $repo/Packages
  echo Section: `dpkg-deb -f $file Section` >>$repo/Packages
  echo Description: `dpkg-deb -f $file Description` >>$repo/Packages
  echo Depiction: https://karimo299.github.io/repo/depictions/?p=`dpkg-deb -f $file package` >>$repo/Packages
  echo SileoDepiction: https://karimo299.github.io/repo/sileo/`dpkg-deb -f $file package` >>$repo/Packages
  echo Icon: https://karimo299.github.io/repo/icons/`dpkg-deb -f $file Name`.png >>$repo/Packages
  echo>> $repo/Packages
  echo Finished `dpkg-deb -f $file Name` v`dpkg-deb -f $file Version`
done

echo -e "\033[32m"Finished Writing $num Packages "\033[0;39m"
rm -f $repo/Packages.bz2
bzip2 $repo/Packages
