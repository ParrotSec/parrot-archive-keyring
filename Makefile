build: keyrings/parrot-archive-keyring.gpg

keyrings/parrot-archive-keyring.gpg: active-keys/index
	mkdir -p keyrings
	jetring-build -I $@ active-keys

clean:
	rm -rf keyrings

install: build
	install -d $(DESTDIR)/usr/share/keyrings/
	cp keyrings/*.gpg $(DESTDIR)/usr/share/keyrings/

.PHONY: build clean install
