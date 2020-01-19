# Setup
I decided to use Racket's support for SICP because it seems to have a much nicer REPL + debugger facilities than mit-scheme.

The documentation can be found here: https://docs.racket-lang.org/sicp-manual/index.html.

In order to install it on Mac OS, I did the following:
```bash
brew cask install racket
raco setup
raco pkg install sicp
```

The other thing that needs to be done is to prefix all files with `#lang sicp`.

The following aliases can come in useful:
```bash
alias scheme='racket -l sicp --repl'
alias mit-scheme='racket -l sicp --repl'
```
