#!/bin/sh
set -e

if [ -e "/build/env" ]; then
    source /build/env
fi

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
export ABUILD_BOOTSTRAP=true # Disable package checks. other wise add !check to each single package options
mkdir -p /var/cache/distfiles
APK="" abuild -rFdK
cp -rf pkg/$PACKAGE_NAME/* / || true

