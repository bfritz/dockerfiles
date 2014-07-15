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

wheezy-openjdk7: wheezy-latest
	docker build -t bfritz/debian-wheezy-openjdk7 debian/wheezy/openjdk7

wheezy-pkg-dev: wheezy-latest
	docker build -t bfritz/debian-wheezy-pkg-dev debian/wheezy/package-dev

wheezy-collectd: wheezy-pkg-dev
	docker build -t wheezy-collectd debian/wheezy/collectd
	docker run wheezy-collectd > collectd_debs.tar.gz
	@echo "Packages copied to collectd_debs.tar.gz"
	tar tfz collectd_debs.tar.gz

collectd-riemann-influxdb: wheezy-collectd
	docker build -t cri-collectd collectd-riemann-influxdb/collectd
	docker build -t cri-riemann  collectd-riemann-influxdb/riemann
	docker build -t cri-riemann-dash  collectd-riemann-influxdb/riemann-dash
	docker build -t cri-influxdb collectd-riemann-influxdb/influxdb

run-cri: collectd-riemann-influxdb
	docker run -d -P -p 8083:8083 -p 8086:8086 --name influxdb cri-influxdb
	docker run -d -P -p 5556:5556 --link influxdb:influxdb --name riemann cri-riemann
	docker run -d              --link riemann:riemann cri-collectd
	docker run -d -p 4567:4567 --link riemann:riemann cri-riemann-dash
