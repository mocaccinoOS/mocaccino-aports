#!/bin/sh
set -e
# export CBUILD=$MUSL_TARGET
# export LUET_YES=true
# luet install libs/libressl development/abuild vcs/git development/make
echo "#!/bin/sh" > /usr/bin/apk
echo "exit 0" >> /usr/bin/apk
echo "#!/bin/sh" > /usr/bin/abuild-sign
echo "touch \$2" >> /usr/bin/abuild-sign
echo "exit 0" >> /usr/bin/abuild-sign
chmod +x /usr/bin/apk
chmod +x /usr/bin/abuild-sign

echo "" | SUDO=" " abuild-keygen -a -i

mkdir -p /var/cache/distfiles
APK="" abuild -rFdK
cp -rfv pkg/$PACKAGE_NAME/* /
