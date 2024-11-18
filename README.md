# fox

> A fox for your terminal.

```
fox@den:~$ echo "I am a cheetah. 🐆" | /var/bin/fox
A aa a aaaaaaa! 🦊
fox@den:~$
```

## Installation

Install either with `go install`:

```shell
~$ go install github.com/varbin/fox
```

or by using the Makefile:

```shell
git clone https://github.com/varbin/fox
cd fox
make
sudo make install
```

The latter also installs the `fox(1)` man page and the `🦊` alias.

## Building from source

You can use just `go build`.
Alternatively use the provided Makefile.

Targets of the Makefile:
- `all` (default): `fox` and `man`
- `fox`: Builds a fox...
- `man`: Compresses the manual.
- `clean`: Removes build artifacts.
- `install`: Install to `PREFIX`.
- `uninstall`: Uninstalls from `PREFIX`.

Variables:
- `PREFIX` (default `/usr/local`): Installation prefix, e.g. where to install to

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
     fox translates arbitrary unicode runes into fox screams!  See the follow‐
     ing enumeration on how each scream is generated.

     a
       Quiet squeaks are emitted for any lowercase letter.

     A
       Loud screams will be emitted for for any uppercase or titlecase letter.

     !
       Foxes do scream. Other punctuation than exclamation marks are unneces‐
       sary.

     🦊
       Symbols (and other emojis!) are replaced with foxes. Foxes are every‐
       where!

     ?
       The fox gets confused if they encounter an unknown symbol, such as a
       number.

     Linebreaks a are left intact, other whitespaces are replaces with spaces.

EXAMPLES
     Process text from standard input:

           $ echo "I am a cheetah. 🐆" | fox
           A aa a aaaaaaa! 🦊

     First read the file arctic, then standard input and finally the file cor‐
     sac:

           $ fox arctic - corsac

EXIT STATUS
     0
       Everything is fine. Yerf!

     1
       Cannot not open file. Aaaaa!

     2
       Cannot read file after opening it successfully. AAAAA!

BUGS
     Use brushes to move them out of the fur.  You may also need tick tweez‐
     ers.

SEE ALSO
     cat(1), tac(1)

                               November 18, 2024
```