# Unix Makefile

# Local files
DUMP_SH   = mysqldump-secure
DUMP_CONF = mysqldump-secure.conf
DUMP_CNF  = mysqldump-secure.cnf

# System directories
PREFIX  = $(DESTDIR)/usr/local
SBINDIR = $(PREFIX)/sbin
ETCDIR  = /etc


all:

	@echo "Nothing to make."
	@echo "Type 'Make help' or one of the below options."
	@echo ""
	@echo Options
	@echo "   make install"
	@echo "   make uninstall"
	@echo "   make help"


help:
	@echo Options
	@echo "   make install"
	@echo "      Install everthing (requires root)"
	@echo ""
	@echo "   make uninstall"
	@echo "      Remove everything except the logfiles"
	@echo "      (requires root)"
	@echo ""
	@echo "   make help"
	@echo "      Show this help screen"


install:

	@echo "Installing files"
	@echo ""

	@# Install binary
	install  $(DUMP_SH) $(SBINDIR)/$(DUMP_SH)
	@echo ""

	@# Install config file with backup file
	install -b $(DUMP_CONF) $(ETCDIR)/$(DUMP_CONF)
	chmod 400 $(ETCDIR)/$(DUMP_CONF)
	@echo ""

	@# Install config file with backup file
	install -b $(DUMP_CNF) $(ETCDIR)/$(DUMP_CNF)
	chmod 400 $(ETCDIR)/$(DUMP_CNF)
	@echo ""

	@echo "Installation complete"
	@echo ""
	@echo "Adjust values in $(ETCDIR)/$(DUMP_CONF)"
	@echo "Adjust values in $(ETCDIR)/$(DUMP_CNF)"


uninstall:

	@# Never ever delete the public private keys!!
	@# Just remove the binary and config files
	rm -f $(SBINDIR)/$(DUMP_SH)
	rm -f $(ETCDIR)/$(DUMP_CONF)
	rm -f $(ETCDIR)/$(DUMP_CNF)

