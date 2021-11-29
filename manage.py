#!/usr/bin/python

from sys import argv
from os import system

conf = ["pacman.conf", "xorg.conf"]
extra = ["dell_mode", "cpu_set", "sudowoodo.png"]

# Checks the diff between git_files and system_files
def diff():
    for e in conf:
        diff = 0
        if (e == "xorg.conf"):
            diff = system(f"diff /etc/X11/{e} ./conf/{e} --color")
        else :
            diff = system(f"diff /etc/{e} ./conf/{e} --color")
        

        if (diff != 0):
            print(f"^ Diffs dans {e} ^")

    for e in extra:
        diff = system(f"diff /usr/local/bin/{e} ./extra/{e} --color")

        if (diff != 0):
            print(f"^ Diffs dans {e} ^")

# Fetches system files to update the git repo.
def fetch():
    for e in usr_local:
        system(f"cp /usr/local/bin/{e} ./extra/{e}")

    for e in rest:
        if(e == "xorg.conf"):
            system(f"cp /etc/X11/{e} ./conf/{e}")
        else :
            system(f"cp /etc/{e} ./conf/{e}")


# Pushes the files in the repo into the system.
def push():
    pass

def usage():
    print("usage : python manage.py <option>")
    print("Arguments : <diff> <fetch> and <push>")

def main():
    if (len(argv) != 2):
        usage()
        return 1
    
    if(argv[1] == "diff"):
        diff()

    elif(argv[1] == "fetch"):
        fetch()

    elif(argv[1] == "fetch"):
        fetch()

    else:
        usage()
if __name__ == "__main__":
    main()
