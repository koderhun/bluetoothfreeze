runcommand: contents/* LICENSE* metadata.*
	zip -FS -r -v bluetoothfreeze.plasmoid contents LICENSE* metadata.*

test:
	plasmoidviewer -a .

clean:
	rm *.plasmoid
