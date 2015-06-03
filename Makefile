VERSION=0.2
DEPENDS=python3-python-simplepam, python3-xdg, libxcb1, libxcb-image0

package:
	python3 setup.py sdist
	py2dsc --with-python3=True --with-python2=False dist/*.tar.gz
	sed -i 's/python3:Depends}/python3:Depends}, $(DEPENDS)/' deb_dist/pyxtrlock-$(VERSION)/debian/control
	cd deb_dist/pyxtrlock-$(VERSION); dpkg-buildpackage -b -us -uc
