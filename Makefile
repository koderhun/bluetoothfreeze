build: contents/* LICENSE* metadata.*
	zip -FS -r -v bluetoothfreeze.plasmoid contents LICENSE* metadata.*

test:
	plasmoidviewer -a .

clean:
	rm -f *.plasmoid

runcommand: clean build

.PHONY: build test clean runcommand
