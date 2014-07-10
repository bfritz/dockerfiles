arch-latest:
	docker build -t bfritz/archlinux:latest archlinux/latest

arch-aur: arch-latest
	docker build -t bfritz/archlinux-aur archlinux/aur

arch-xpra: arch-aur
	docker build -t bfritz/archlinux-xpra archlinux/xpra
