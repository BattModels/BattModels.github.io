#!/usr/bin/env python3
"""Wrapper around bibble that cleans LaTeX special characters."""

import re
import subprocess
import sys

import latexcodec  # noqa: F401 - registers 'latex' codec


def decode_latex_match(match):
    """Decode a single LaTeX escape sequence."""
    latex_seq = match.group(0)
    try:
        decoded = latex_seq.encode("ascii").decode("latex")
        return re.sub(r"[{}]", "", decoded)
    except (UnicodeDecodeError, ValueError):
        return latex_seq


def clean_latex(text):
    """Convert LaTeX special characters to Unicode and strip BibTeX braces."""
    pattern = r"\{?\\['\"`^~=.cucvHtdb]\s*\{?\\?[a-zA-Z]\}?\}?"
    text = re.sub(pattern, decode_latex_match, text)
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
