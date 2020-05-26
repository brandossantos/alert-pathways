VERSION := $(shell git describe --tags 2>/dev/null || echo 0.0.0)

shell:
	/bin/bash

rpm: rpm-release rpm-devel

rpm-release:
	fpm -s dir -t rpm \
        --name ${CIRCLE_PROJECT_REPONAME} \
        --version $(VERSION) \
        --prefix /data/notebooks/${CIRCLE_PROJECT_REPONAME} \
        ./notebooks/=/
	sign_rpm
	rpm -qlp *.rpm

rpm-devel:
	fpm -s dir -t rpm \
        --name ${CIRCLE_PROJECT_REPONAME}-devel \
        --version $(VERSION) \
        --prefix /data/notebooks/${CIRCLE_PROJECT_REPONAME} \
        ./notebooks/=/
	sign_rpm
	rpm -qlp *.rpm

install:
	yum -y localinstall *.rpm

publish:
	/usr/local/bin/jfrog rt upload \
        --user expelcircleci \
        --password '${ARTIFACTORY_PW}' \
        --url https://expel.jfrog.io/expel \
        "*.rpm" expel-yum-dev

clean:
	$(RM) -r __pycache__ tests/__pycache__ .coverage build coverage.xml htmlcov junit *.rpm *.egg-info
