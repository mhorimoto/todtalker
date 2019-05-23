EXECP=/usr/local/bin/todtalkerd.py
SYSCD=/etc/systemd/system/todtalker.service
TARGD=/usr/local/bin
CFGFD=/etc/uecs
CONFF=$(CFGFD)/config.ini
XMLFF=$(CFGFD)/todtalker.xml

$(EXECP): todtalkerd.py
	install $^ $(TARGD)

$(CONFF): config.ini
	cp $^ $(CONFF)

$(XMLFF): todtalker.xml
	cp $^ $(XMLFF)

$(SYSCD): todtalker.service
	cp $^ $(SYSCD)

install: $(EXECP) $(CONFF) $(XMLFF) $(SYSCD)


