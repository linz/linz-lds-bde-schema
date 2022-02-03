#!/usr/bin/env bash
# Script to convert from a markdown file with yaml metadata to a commonmark
# file suitable for read the docs.

finish(){
  rm -f /tmp/markdown-commonmark-convert-$$.md
}

trap finish EXIT

SED=$(which gsed)
test -z "${SED}" && SED=sed

if [ $# -ne 2 ]; then
  >&2 echo "Syntax markdown-to-commonmark-conversion.bash <input_markdown_file> <output_commonmark_file"
  exit 1;
fi

# Create temp markdown file
cp $1 /tmp/markdown-commonmark-convert-$$.md

# Update yaml metadata to header style.
count=1
while read text; do
  if [[ $text == "---" ]]; then
      ${SED} -i "${count}s/---//" /tmp/markdown-commonmark-convert-$$.md;
  elif [[ "${text::5}" == "title" ]]; then
      ${SED} -i "s/${text}/$(echo "# "${text:7} | ${SED} "s/\"//g")/g" /tmp/markdown-commonmark-convert-$$.md;
  elif [[ "${text::8}" == "subtitle" ]]; then
      ${SED} -i "s/${text}/$(echo "## "${text:10} | ${SED} "s/\"//g")/g" /tmp/markdown-commonmark-convert-$$.md;
  elif [[ $count -ne 1 ]] && [[ $text != "---" ]]; then
      ${SED} -i "s/${text}/$(echo "### "${text:6} | ${SED} "s/\"//g")/g" /tmp/markdown-commonmark-convert-$$.md;
  fi
  if [[ $count -ne 1 ]] && [[ $text == "---" ]]; then break; fi
  count=$(expr $count + 1);
done</tmp/markdown-commonmark-convert-$$.md

# Perform pandoc markdown to commonmark conversion.
pandoc /tmp/markdown-commonmark-convert-$$.md -f \
  markdown_strict+intraword_underscores+pipe_tables+hard_line_breaks+compact_definition_lists \
  -t commonmark -o $2 || exit 1




