PLASMOID_NAME = com.github.koderhun.bluetoothfreeze
PLASMOID_FILE = bluetoothfreeze.plasmoid
INSTALL_DIR = $(HOME)/.local/share/plasma/plasmoids/$(PLASMOID_NAME)

build: contents/* LICENSE* metadata.*
	zip -FS -r -v $(PLASMOID_FILE) contents LICENSE* metadata.*

test:
	plasmoidviewer -a .

clean:
	rm -f $(PLASMOID_FILE)

reload:
	@echo "Restarting Plasma Shell (KDE Neon 6+)..."
	kquitapp6 plasmashell 2>/dev/null || true
	sleep 2
	nohup plasmashell >/dev/null 2>&1 &
	@echo "Plasma Shell restarted"

install: build
	rm -rf $(INSTALL_DIR)
	mkdir -p $(INSTALL_DIR)
	unzip -o $(PLASMOID_FILE) -d $(INSTALL_DIR)/
	kpackagetool6 --upgrade $(INSTALL_DIR) || kpackagetool6 --install $(INSTALL_DIR)
	$(MAKE) reload

runcommand: clean build

.PHONY: build test clean reload install runcommand
