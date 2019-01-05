 #!/bin/bash
rm -f ./Packages
rm -f ./Packages.bz2
for file in ./*/*.deb
do
  num=$((num + 1))
  echo Name: `dpkg-deb -f $file Name`>>Packages
  echo Package: `dpkg-deb -f $file Package` >> Packages
  echo Version: `dpkg-deb -f $file Version` >> Packages
  echo Description: `dpkg-deb -f $file Description` >> Packages
  echo Architecture: `dpkg-deb -f $file Architecture` >> Packages
  echo Author: `dpkg-deb -f $file Author` >> Packages
  echo Maintainer: `dpkg-deb -f $file Maintainer` >> Packages
  echo Installed-Size: `dpkg-deb -f $file Installed-Size` >> Packages
  echo Depends: `dpkg-deb -f $file Depends` >> Packages
  echo Filename: $file >> Packages
  echo Size: `wc -c < $file` >> Packages
  echo MD5sum: `MD5sum $file | cut -d '.' -f 1` >> Packages
  echo SHA1: `sha1sum $file | cut -d '.' -f 1` >> Packages
  echo SHA256: `shasum -a 256 $file | cut -d '.' -f 1` >> Packages
  echo Section: `dpkg-deb -f $file Section` >>Packages
  echo Description: `dpkg-deb -f $file Description` >>Packages
  echo Depiction: https://karimo299.github.io/repo/depictions/?p=`dpkg-deb -f $file package` >>Packages
  echo SileoDepiction: https://karimo299.github.io/repo/sileo/`dpkg-deb -f $file package` >>Packages
  echo Icon: https://karimo299.github.io/repo/icons/`dpkg-deb -f $file Name`.png >>Packages
  echo>> Packages
  echo Finished `dpkg-deb -f $file Name` v`dpkg-deb -f $file Version`
done

echo -e "\033[32m"Finished Writing $num Packages "\033[0;39m"
bzip2 Packages
