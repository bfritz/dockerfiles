arch-latest:
	docker build -t bfritz/archlinux:latest archlinux/latest

arch-aur: arch-latest
	docker build -t bfritz/archlinux-aur archlinux/aur

arch-xpra: arch-aur
	docker build -t bfritz/archlinux-xpra archlinux/xpra

android-dev: arch-xpra
	docker build -t android-dev android-dev

android-dev-maxs: android-dev
	docker build -t android-dev-maxs android-dev-maxs

wheezy-latest:
	docker build -t bfritz/debian-wheezy:latest debian/wheezy/latest

wheezy-pkg-dev: wheezy-latest
	docker build -t bfritz/debian-wheezy-pkg-dev debian/wheezy/package-dev
