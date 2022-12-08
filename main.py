import argparse


if __name__ == '__main__':
	parser = argparse.ArgumentParser(
		description='CLI utility to manage or setup wordpress server enviornments')

	parser.add_argument('-i', '--install', action='store_true', 
		help='install bash scripts and utilities on a server')

	args = parser.parse_args()

	if args.install:
		print("Installing utilities...")


