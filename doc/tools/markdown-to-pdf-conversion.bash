#!/usr/bin/env bash
# Script to convert markdown files to pdf.
# Updates directory location of figures/ models to match correct location.

set -o errexit -o noclobber -o nounset -o pipefail
shopt -s failglob inherit_errexit

finish(){
  rm -f /tmp/markdown-pdf-convert-$$.md
}

trap finish EXIT

if [ $# -ne 2 ]
then
  >&2 echo "Syntax markdown-to-pdf-conversion.bash <input_markdown_file> <output_pdf_file"
  exit 1
fi

# Create temp markdown file with current location.
cp "$1" /tmp/markdown-pdf-convert-$$.md
count=1
while read -r text
do
  if [[ ${text::2} == "![" ]]
    then
      text1="${text##*\(}"
      text1="${text1%%\)*}"
      text2="$(pwd)/doc/models/$text1)"
      sed -i "${count}s|$text1|$text2|g" /tmp/markdown-pdf-convert-$$.md

  fi
  ((count++))
done<"$1"

# Run pandoc to perform the conversion between markdown to pdf.
pandoc /tmp/markdown-pdf-convert-$$.md -o "$2" -t html5        \
    --css="$(pwd)/doc/tools/custom.css" -s -f                                        \
    markdown_strict+intraword_underscores+raw_tex+hard_line_breaks+pipe_tables+compact_definition_lists+yaml_metadata_block \
    --toc --variable margin-left=0.75in --variable margin-right=0.75in         \
    --variable margin-top=0.8in --variable margin-bottom=0.8in --toc-depth=2   \
    -N --data-dir=""

