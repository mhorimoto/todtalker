EXECP=/usr/local/bin/todtalkerd.py
SCANP=/usr/local/bin/scanresponse.py
SYSCD=/etc/systemd/system/todtalker.service
SCAND=/etc/systemd/system/scanresponse.service
TARGD=/usr/local/bin
CFGFD=/etc/uecs
NTPDC=/etc/ntp.conf
CONFF=$(CFGFD)/config.ini
XMLFF=$(CFGFD)/todtalker.xml

$(EXECP): todtalkerd.py
	install $^ $(TARGD)

$(SCANP): scanresponse.py
	install $^ $(TARGD)

$(CONFF): config.ini
	cp $^ $(CONFF)

$(XMLFF): todtalker.xml
	cp $^ $(XMLFF)

$(SYSCD): todtalker.service
	cp $^ $(SYSCD)

$(SCAND): scanresponse.service
	cp $^ $(SCAND)

$(NTPDC): ntp.conf
	@mv $(NTPDC) $(NTPDC)-orig
	cp $^ $(NTPDC)

install: $(EXECP) $(SCANP) $(CONFF) $(XMLFF) $(SYSCD) $(SCAND) $(NTPDC)


