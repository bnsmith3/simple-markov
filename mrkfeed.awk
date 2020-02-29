#!/usr/bin/awk -f

# Read in all content, lowercase it, remove punctuation, 
# and spit out each two token sequence.
# Tokens are delimited by whitespace.
# Based on this blog post: https://0x0f0f0f.github.io/posts/2019/11/really-fast-markov-chains-in-~20-lines-of-sh-grep-cut-and-awk/

{
  gsub(/["*^&()#@$,\.\|!?~;:—•]/, "") # remove most punctuation except apostrophes
  gsub(/^[ \t\r]+/, "") # remove leading whitespace 
  gsub(/[ \t\r]+$/, "") # remove trailing whitespace  
  gsub(/' /, " ") # remove trailing apostrophes
  gsub(/'$/, " ") # remove trailing apostrophes
  gsub(/ '/, " ") # remove leading apostrophes
  gsub(/^'/, " ") # remove leading apostrophes
  
  for (i = 1; i < NF; i++) {
    # only print lines with content
    if ((length($i) != 0) && (length($(i+1)) != 0))
       print tolower($i),tolower($(i+1))
  }
  
  # only print lines with content
  if (length($i) != 0)
    print tolower($i)
}
