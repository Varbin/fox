# fox

> A fox for your terminal.

```
fox@den:~$ echo "I am a cheetah. 🐆" | /var/bin/fox
A aa a aaaaaaa! 🦊
fox@den:~$
```

## Installation

Install either with go:

```shell
~$ go install github.com/varbin/fox
```

or by using the makefile:

```shell
git clone https://github.com/varbin/fox
cd fox
make
sudo make install
```

The latter method includes a man page.


## Manual

```
Fox(1)                    BSD General Commands Manual                   Fox(1)

NAME
     fox, 🦊 — Join and foxify files on the standard output.

SYNOPSIS
     fox [file ...]

DESCRIPTION
     Join foxified files to standard output.

     With no file, or when file is -, read from the standard input.

FOX TRANSLATION RULES
     fox translates arbitrary unicode runes into fox screams!
     See the following enumeration on how each scream is generated.

     a
       Quiet screams are emitted for any lowercase letter.

     A
       Loud screams will be emitted for for any uppercase or titlecase letter.

     !
       Foxes scream. Other punctuation than exclamation marks are unnecessary.

     🦊
       Symbols (and emojis!) are replaced with foxes. Foxes are everywhere!

     ?
       The fox gets if they encounter an unknown symbol, such as a number.

     Linebreaks a are left intact, other whitespaces are replaces with spaces.

EXAMPLES
     0
       Everything is fine. Yerf!

     1
       Cannot not open file. Aaaaa!

     2
       Cannot read file. AAAAA!

BUGS
     Use brushes to move them out of the fur.  You may also need tick tweezers.

SEE ALSO
     cat(1), tac(1)
```