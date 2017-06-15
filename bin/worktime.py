#!/usr/bin/env python

import getopt
import socket
import sys

HOSTS_FILE = "/etc/hosts"
REDIRECT = "jira.trading.imc.intra"
HOSTS = [ "youtube.com", "www.youtube.com", "facebook.com", "www.facebook.com", "news.ycombinator.com", "forum.arcadecontrols.com", "eztv.it" ]
SUFFIX = "# WORK TIME BITCH"

def work_time():
	already_working = False
	fd = open(HOSTS_FILE, 'r')
	for line in fd:
		if line.endswith(SUFFIX):
			already_working = True
			break
	fd.close()

	if not already_working:
		fd = open(HOSTS_FILE, 'a')
		fd.write("%s\t%s %s\n" % (socket.gethostbyname(REDIRECT), " ".join(HOSTS), SUFFIX))
		fd.close()

def play_time():
	fd = open(HOSTS_FILE, 'r')
	lines = fd.readlines()
	fd.close()

	fd = open(HOSTS_FILE, 'w')
	for line in lines:
		if not line.strip().endswith(SUFFIX):
			fd.write(line)
	fd.close()

def usage():
    print("Usage: %s [-w | -p]" % sys.argv[0])
    print("Modifies /etc/hosts to block a set of distracting websites (or set it back to normal).")
    print("\t-w\tWork mode engage!")
    print("\t-p\tPlay mode engage!")
    
def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], 'wp')
    except getopt.GetoptError as err:
        print(str(err))
        usage()
        sys.exit(2)

    if len(args):
        usage()
        sys.exit(2)

    work = True
    for o, a in opts:
        if o == '-p':
			work = False
        elif o == '-w':
            work = True
        else:
            print("Invalid option '%s'" % o)
            usage()
            sys.exit(2)

	if work:
		work_time()
	else:
		play_time()

if __name__ == "__main__":
	main()
