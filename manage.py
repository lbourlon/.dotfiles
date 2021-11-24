#!/usr/bin/python

from sys import argv
from os import system

usr_local = ["dell_mode", "cpu_set", "sudowoodo.png"]
rest = ["pacman.conf", "xorg.conf"]

# Checks the diff between git_files and system_files
def diff():
    for e in rest:
        diff = 0
        if (e == "xorg.conf"):
            diff = system(f"diff /etc/X11/{e} ./{e} --color")
        else :
            diff = system(f"diff /etc/{e} ./{e} --color")
        

        if (diff != 0):
            print(f"^ Diffs dans {e} ^")

    for e in usr_local :
        diff = system(f"diff /usr/local/bin/{e} ./{e} --color")

        if (diff != 0):
            print(f"^ Diffs dans {e} ^")

# Fetches system files to update the git repo.
def fetch():
    for e in usr_local:
        system(f"cp /usr/local/bin/{e} ./{e}")

    for e in rest:
        if(e == "xorg.conf"):
            system(f"cp /etc/X11/{e} ./{e}")
        else :
            system(f"cp /etc/{e} ./{e}")


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
