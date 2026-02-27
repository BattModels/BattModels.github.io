#!/usr/bin/env python3
"""Wrapper around bibble that cleans LaTeX special characters."""

import re
import subprocess
import sys

from pylatexenc.latex2text import LatexNodes2Text


def clean_latex(text):
    """Convert LaTeX special characters to Unicode and strip BibTeX braces."""
    converter = LatexNodes2Text()
    text = converter.latex_to_text(text)
    text = re.sub(r"\\relax\s*", "", text)
    text = re.sub(r"[{}]", "", text)
    return text


def main():
    result = subprocess.run(["bibble"] + sys.argv[1:], capture_output=True, text=True)

    if result.returncode != 0:
        sys.stderr.write(result.stderr)
        sys.exit(result.returncode)

    output = clean_latex(result.stdout)
    sys.stdout.write(output)


if __name__ == "__main__":
    main()
