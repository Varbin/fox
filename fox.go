// Command fox screams files on the standard output.
package main

import (
	"bufio"
	"errors"
	"flag"
	"fmt"
	"io"
	"os"
	"unicode"
)

func foxifyRune(in rune) rune {
	if unicode.IsLower(in) {
		return 'a'
	}
	if unicode.IsUpper(in) || unicode.IsTitle(in) {
		return 'A'
	}
	if unicode.IsPunct(in) {
		return '!'
	}
	if in == '\n' {
		return in
	}
	if unicode.IsSpace(in) {
		return ' '
	}
	if unicode.IsSymbol(in) {
		return '🦊'
	}
	return '?'
}

func foxifyStream(in io.Reader, out io.Writer) error {
	ears := bufio.NewReader(in)
	muzzle := bufio.NewWriter(out)

	var err error
	for err == nil {
		var charr rune
		var bytes int
		charr, bytes, err = ears.ReadRune()
		if errors.Is(err, io.EOF) {
			return nil
		}
		if bytes == 0 {
			continue
		}

		_, _ = muzzle.WriteRune(foxifyRune(charr))
		_ = muzzle.Flush()
	}
	return err
}

func main() {
	flag.Parse()

	files := flag.Args()
	if len(files) == 0 {
		files = []string{"-"}
	}
	for _, file := range files {
		var reader io.Reader
		if file == "-" {
			reader = bufio.NewReader(os.Stdin)
		} else {
			fd, err := os.Open(file)
			if err != nil {
				_, _ = fmt.Fprintf(os.Stdout, "sad fox noises when opening %s: %+v", file, reader)
				os.Exit(1)
			}
			defer fd.Close()
			reader = fd
		}
		err := foxifyStream(reader, os.Stdout)
		if err != nil {
			_, _ = fmt.Fprintf(os.Stdout, "sad fox noises when reading %s: %+v", file, reader)
			os.Exit(2)
		}
	}
}
