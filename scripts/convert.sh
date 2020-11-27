#!/bin/bash

if [ ! -d "aports-apline" ]; then
	git clone https://github.com/alpinelinux/aports.git aports-alpine
fi

luet abuildspec $PWD/aports-alpine/main "alpine"
luet abuildspec $PWD/aports-alpine/community "alpine"
luet abuildspec $PWD/aports-alpine/testing "alpine"

echo "Packages in aports-alpine are now converted"

echo "To convert single packages, run: luet abuildspec <path> alpine"

echo "To build a package, run: luet build --tree packages alpine/sed"

