PREFIX?=/usr/local

bindir=/bin
mandir=/share/man
mansubdir=man
varbindir=/var/bin
manpages=fox.1.gz

MKDIR_P?=mkdir -p
RM_F?=rm -f
RMDIR?=rmdir --ignore-fail-on-nonempty
GZIP?=gzip
INSTALL?=install
STRIP?=strip
LN?=ln

GO_BUILD?=go build
GO_BUILD_EXTRA_ARGS?=
GO_BUILD_ARGS?=-trimpath -ldflags=-buildid= -buildmode=pie -v

.PHONY: all clean install uninstall varbin uninstall-varbin

all: fox man

fox: *.go
	$(GO_BUILD) $(GO_BUILD_ARGS) $(GO_BUILD_EXTRA_ARGS)

man: $(manpages)

%.gz : %
	$(GZIP) -k $?

clean:
	-$(RM_F) *.gz
	-$(RM_F) fox

# Naked fox
strip: fox
	$(STRIP) $?

install: all strip
	$(MKDIR_P) $(PREFIX)
	$(MKDIR_P) $(PREFIX)$(bindir)
	$(MKDIR_P) $(PREFIX)$(mandir)/$(mansubdir)1

	$(INSTALL) -m 0755 fox $(PREFIX)$(bindir)/fox
	$(LN) $(PREFIX)$(bindir)/fox $(PREFIX)$(bindir)/🦊

	$(INSTALL) -m 644 fox.1.gz $(PREFIX)$(mandir)/$(mansubdir)1/fox.1.gz

uninstall:
	$(RM_F) $(PREFIX)$(bindir)/fox
	$(RM_F) $(PREFIX)$(bindir)/🦊
	$(RM_F) $(PREFIX)$(mandir)/$(mansubdir)1/fox.1.gz

varbin: fox strip
	$(MKDIR_P) $(varbindir)
	install -m 0755 fox $(varbindir)/fox
	$(LN) $(varbindir)/fox $(varbindir)/🦊

uninstall-varbin:
	$(RM_F) $(varbindir)/fox
	$(RM_F) $(varbindir)/🦊
	if test -d $(varbindir); then $(RMDIR) $(varbindir); fi
