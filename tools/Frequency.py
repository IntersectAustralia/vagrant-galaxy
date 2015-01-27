import sys
import os
import nltk

from nltk import FreqDist

import argparse

def Parser():
  the_parser = argparse.ArgumentParser(description="generate a word frequency table from a text")
  the_parser.add_argument('--input', required=True, action="store", type=str, help="input text file")
  the_parser.add_argument('--output', required=True,  action="store", type=str, help="output file path")
  args = the_parser.parse_args()
  return args



# work
def freq(inp, outp):
    """Input: a text file
    Output: a table of word frequency with three columns for Word, Count and Percent frequency
    """    
    text = open(inp,'r').read()
    
    sents = nltk.sent_tokenize(text)
    all_words = []
    for sent in sents:
        words = nltk.word_tokenize(sent)
        all_words += words
        
    all_words = [x.lower() for x in all_words]

    freq = FreqDist(all_words)
    tot = float(freq.N())

    # output

    o = open(outp,'w')
    o.write("Word\tCount\tPercent\n")
    for pair in freq.most_common():
        o.write("{pair[0]}\t{pair[1]}\t{pc:.2f}\n".format(pair=pair, pc=100*pair[1]/tot))
    o.close()


if __name__=='__main__':

    args=Parser()
    
    freq(args.input, args.output)
    
    