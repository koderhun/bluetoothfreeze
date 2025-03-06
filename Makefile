runcommand: contents/* LICENSE* metadata.*
	zip -FS -r -v bluetoothfreeze.plasmoid contents LICENSE* metadata.*
clean:
	rm *.plasmoid
