# Setup
I decided to use Racket's support for SICP because it seems to have a much nicer REPL + debugger facilities than mit-scheme.

The documentation can be found here: https://docs.racket-lang.org/sicp-manual/index.html.

In order to install it on Mac OS, I did the following:
```bash
brew install --cask racket
raco setup
raco pkg install sicp
```

The other thing that needs to be done is to prefix all files with the following snippet - it will make racket register the correct language:
```racket
#lang sicp
```

To make the printer print expressions similarly to how mit-scheme would, place the following in the `~/.racketrc` file:
```racket
(#%require (only racket/base
		  print-as-expression
		  print-mpair-curly-braces))
(print-as-expression #f)
(print-mpair-curly-braces #f)
```

and the following in the `~/.racket-geiser` file:
```racket
(load (find-system-path 'init-file))
```

The following aliases can come in useful:
```bash
alias scheme='racket -l sicp --repl'
alias mit-scheme='racket -l sicp --repl'
```

Another thing I noticed is that MIT scheme's "load" function doesn't work - have to use this instead:
```racket
;; in the file that provides a function
(#%provide FUNCTION_NAME_ONE
           FUNCTION_NAME_TWO)

;; in the file that uses the above functions
(#%require "FILENAME")
```

# Editor
Using emacs for its tight integration with various lisps.

## Useful plugins
[Geiser](https://www.nongnu.org/geiser/): lets you run Racket code from the editor.

[smartparens](https://github.com/Fuco1/smartparens): minor mode for dealing with pairs, similar to paredit.

[rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters): color matching parentheses in a unique colour for easier identification.

## Running code
On first run, call `C-c C-a` - this evaluates the whole buffer, including the `#lang sicp` definition.
From that point onwards, individual lines can be evaluated using `C-M-x`.
