VERSION=0.2

package:
	python3 setup.py sdist
	py2dsc --with-python3=True --with-python2=False dist/*.tar.gz
	cd deb_dist/pyxtrlock-$(VERSION); dpkg-buildpackage -b -us -uc
