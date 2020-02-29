# simple-markov
markov chains using only unix commands

The models can be incrementally trained by appending new data to them through the ```mrkfeed.awk``` script (4 lines of awk).

```mrkwords.sh``` can generate word chains from a model using only sh, grep, awk and shuf. An initial ```grep -Fw``` pass is done to quickly narrow down huge model files. Then, awk (much slower than grep) does a second pass which matches the pairs that actually begin with the word.

In the interest of simplicity, the model is stored a flat plaintext file with word pairs. This is inefficient but much simpler than using a directory tree or more advanced structures. It also makes it easy to parse the model yourself with simple tools like awk and grep.


## usage
Feed new data to an existing model or create it if it doesn't exist:

```sh
./mrkfeed.awk < input.txt >> model.mrkdb
```

Generate a chain up to 50 words long from a model

```sh
./mrkwords.sh model.mrkdb 50
```

Generate a sentence up to 50 words long

```sh
./mrkwords.sh model.mrkdb 50 | tr '\n' ' ' && echo
```

Generate a sentence up to 50 words long that starts with "hello"

```sh
./mrkwords.sh model.mrkdb 50 hello | tr '\n' ' ' && echo
```
