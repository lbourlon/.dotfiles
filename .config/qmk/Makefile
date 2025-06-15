QMK_HOME=~/.local/share/qmk_firwmare
SRCVENV=. ./.venv/bin/activate &&

dependencies:
	apt install gcc-avr gdb-avr avr-libc avrdude dfu-programmer dfu-util
	python3 -m venv ./.venv
	${SRCVENV} python3 -m pip install --user qmk

setup-qmk:
	${SRCVENV} qmk setup le_map/qmk_firmware --home ${QMK_HOME}
	ln -s ~/.config/qmk/le_map ${QMK_HOME}/keyboards/splitkb/aurora/sofle_v2/keymaps/
	sudo cp ${QMK_HOME}/util/udev/50-qmk.rules /etc/udev/rules.d/
	sudo udevadm trigger
	sudo udevadm control --reload-rules

getting-started:
	${SRCVENV} qmk new-keymap
	${SRCVENV} qmk json2c -o keymap.c keymap.json
	${SRCVENV} qmk compile -kb splitkb/aurora/sofle_v2/rev1 -km default
	${SRCVENV} qmk json2c -o keymap.c keymap.json

json:
	mv ~/Downloads/le_map.json ./le_map.json
	${SRCVENV} qmk json2c le_map.json

compile:
	${SRCVENV} qmk compile -e CONVERT_TO=liatris -km le_map -kb splitkb/aurora/sofle_v2/rev1

flash:
	${SRCVENV} qmk flash -km le_map -e CONVERT_TO=liatris
