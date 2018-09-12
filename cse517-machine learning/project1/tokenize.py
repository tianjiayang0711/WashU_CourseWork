#!/usr/bin/python
#
# Usage: 
# python tokenize.py log_2(HASHBUCKETSIZE)
#
# 

import os, sys

path=sys.argv[1]

if len(sys.argv)>1:
	HASHBUCKETS=2**int(sys.argv[2])
else:
	HASHBUCKETS=2**10
	
ind=[x.split() for x in open(path+'/index').read().split('\n') if len(x)>0] # read in index file
codebook={}

# build codebook
for (num,(label,fn)) in enumerate(ind):
		# the next command loads in the data, replaces returns with blanks, splits it into words and hashes the words into integers
		email=map(lambda e: abs(e.__hash__()) % HASHBUCKETS,open(path+'/'+fn).read().replace('\n',' ').split())
		# write out "emailnumber,hashedword" for all words
		sys.stdout.write('\n'.join(map(lambda a: '%i,%i' % (num+1,a+1),email))+'\n')



	
