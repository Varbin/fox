INSTALL_PATH?=/usr/local
MANPAGES=fox.1.gz

.PHONY: all clean install varbin strip prod

all: fox man

fox: *.go
	go build -trimpath -ldflags=-buildid= -buildmode=pie -v

man: $(MANPAGES)

%.gz : %
	gzip -k $?

clean:
	-rm -f *.gz
	-rm -f fox

# Naked fox
strip: fox
	strip $?

install: all strip
	install -D -m 755 fox $(INSTALL_PATH)/bin/fox
	install -D -m 644 fox.1.gz $(INSTALL_PATH)/share/man/man1/fox.1.gz

varbin: fox strip
	install -D -m 755 fox /var/bin/fox

uninstall:
	rm -f $(INSTALL_PATH)/bin/fox
	rm -f $(INSTALL_PATH)/share/man/man1/fox.1.gz
	rm -f /var/bin/fox
	if test -d /var/bin; then rmdir --ignore-fail-on-non-empty /var/bin; fi