#!/usr/bin/python
'''
Python script to check against markdown file before extracting PostgreSQL
comments and creating pdf.
Checks for errors in:
 - Headings and types of headings.
 - Checks each line for hyperlink, image, emphasis, newline structure.
 - Checks the tables are headed correctly with correct space between tables and
   other text.
 - Checks rows and columns of table are formatted correctly
   - however cannot check exactly how the table will convert to pdf. Because
     most tables have contents that are over the column limit so when pandoc
     wraps them it defaults to checking the relative size of the header
     separators, in which case each cell formats slightly differently based on
     the amount of text in each row.
'''


import sys

if len(sys.argv) != 2:
  sys.stderr.write('Syntax markdown_check.py <input_file>\n')
  sys.exit(1)

file = sys.argv[1]

invalid_heading = '####'
subsubheading = '###'
subheading = '##'
heading = '#'
count = 1
bullet = ('-', '+')
description = '## Description'

nextline_checked = False
table_required = False

# Output error details
def format_error(heading, line, count, details):
  sys.stderr.write(heading + '\'' + line + '\' on line ' + str(count) + details + '\n')
  sys.exit(1)


# Check for errors when a hyperlink is used.
def hyperlink_check(line, count):
  if 'https' in line and '[' in line and '(' in line:
      # Check has [] brackets - doesn't have to have https inside, but must
      # have something.
      if line[line.find('['):line.find(']',line.find('['))+1] == -1            \
        or line.find('[') == line.find(']')-1:
        format_error('No title for hyperlink: ', line[:len(line)-1], count,    \
                     '\nHyperlink structure is [Title](link)')
      # Check has () brackets - does have to have https link inside
      elif line[line.find('(', line.find(']')):] == -1 or 'https' not in       \
           line[line.find('(', line.find(']')):] or ')' not in                 \
           line[line.find('(', line.find(']')):]:
        format_error('Incorrect hyperlink: ', line[:len(line)-1], count,       \
                     '\nHyperlink structure is [Title](link)')


# Check if line is a heading, it must have either an empty line or another
# header previous to it.
def empty_line_check():
  if count != 1 and prvline != '\n'                                            \
     and heading not in prvline                                                \
     and subheading not in prvline                                             \
     and subsubheading not in prvline:
    format_error('Incorrect Heading: ', line[:len(line)-1], count,             \
                 '\nMust have an empty line or another heading in previous'    \
                 ' line')

# Check if line is a list, and check if empty line before list.
def list_check(line, count, prvline):
  if len(line) > 2 and line[0] in bullet and line[1] == ' ':
    if prvline != "\n" and prvline[0] not in bullet:
      format_error('Incorrectly formed list: ', line[:len(line)-1], count,     \
                   '\nMust have either an empty line or another list item'     \
                   ' before a list')
  elif len(line) > 2 and line[0].isdigit() and line[1] == '.':
    if prvline != "\n" and not prvline[0].isdigit():
      format_error('Incorrectly formed list: ', line[:len(line)-1], count,     \
                   '\nMust have either an empty line or another list item'     \
                   ' before a list')


# Check for errors when an image is used.
def image_check(line, count):
  # given that an image would be an image model.
  if line[0] == '!' or '.png' in line:
    # Check has '!'
    if line[0] != '!':
      format_error('Image reference must contain !: ', line[:len(line)-1],     \
                   count, '\nImage structure is ![Alt text](url)')
    # Check has [] brackets - can be empty
    elif '[' not in line or ']' not in line:
      format_error('Incorrect image: ', line[:len(line)-1], count,             \
                   '\nImage structure is ![Alt text](url)')
    # Check has () brackets - not empty, must contain link to image.
    elif '(' not in line or ')' not in line                                    \
         or line.find('(') == line.find(')')-1:
      format_error('Incorrect image: ', line[:len(line)-1], count,             \
                   '\nImage structure is ![Alt text](url)')


# Check that only #, ##, and ### level headings are used.
def header_check(line, count, prvline, fp, nextline_checked):
  if invalid_heading in line:
    format_error('Incorrect Heading: ', line[:len(line)-1], count,             \
                 '\n# Main Heading\n## Subheading\n### Other Heading')
  prvline = line
  line = fp.readline()
  count += 1
  
  # If current heading is a table heading and next line is description
  if description in line and subheading not in prvline:
    format_error('Incorrect Heading: ', line[:len(line)-1], count,             \
                 '\nTable heading before a description heading must be ## '    \
                 'Subheading not # Heading format \nFor conversion to sql '    \
                 'commments.')
    
  # Else if the heading is followed by empty lines find next text line
  elif line == "\n":
    while line == "\n":
      prvline = line
      line = fp.readline()
      count += 1
    # There cannot be spaces between table and description headings
    if description in line:
      format_error('Incorrect Heading: ', line[:len(line)-1], count,           \
                   '\nThere cannot be any empty lines between table and '      \
                   'description headings')  
  if "|" in line:
    nextline_checked = True
  return line, count, prvline, fp, nextline_checked
  

# Check that emphasis characters(bold and italic) have been used correctly to
# display on the pdf.
def emphasis_check(line, count):
  # Check that has both ends of markdown bold or italic syntax
  if line.count('*') % 2 or line.count('__') % 2 or line.count('**') % 2:
    format_error('Incorrect emphasis: ', line[:len(line)-1], count,            \
                 '\nFor Bold use __text__ or **text**\nFor Italics use *text*')
  # Check that there are no spaces at the start or end of bold/italic syntax,
  # if * or ** used.
  if line.find('*') != -1 and line.find('*', line.find('*')+1) != -1:
    text = line[line.find('*'):line.find('*',line.find('*')+1)+1]
    if text[1] == '*':
      text = line[line.find('**'):line.find('**', line.find('**')+1)+2]
      if text[2] == ' ' or text[len(text)-3] == ' ':
        format_error('Incorrect emphasis: ', line[:len(line)-1], count,        \
                    '\nCannot have spaces between bold or italic syntax.')
    elif text[1] == ' ' or text[len(text)-2] == ' ':
      format_error('Incorrect emphasis: ', line[:len(line)-1], count,          \
                   '\nCannot have spaces between bold or italic syntax.')
  # Check that there are no spaces at the start or end of bold syntax
  # if __ used.
  if line.find('__') != -1 and line.find('__', line.find('__')+1) != -1:
      text = line[line.find('__'):line.find('__', line.find('__')+1)+2]
      if text[2] == ' ' or text[len(text)-3] == ' ':
        format_error('Incorrect emphasis: ', line[:len(line)-1], count,        \
                     '\nCannot have spaces between bold syntax.')


# Check that \newline is used not \n or <br>, to display correctly on the pdf.
def newline_check(line, count):
  for i in line.split():
    if r'\n' in i                                                              \
       and r'\newline' in i                                                    \
       and r'\newpage' in i:
      format_error('Incorrect newline: ', line[:len(line)-1], count,           \
                   '\n' + r'If needing newline character use \newline')


# Check a table to make sure it is correctly formatted.
def table_check(fp, count, line, prvline):

  # Stores the number of columns in the table.
  table_sep = line.count('|')
  # Check that the table headers are bolded for display on the pdf.
  text = line.replace(' ', '').replace('\n', '').split('|')
  for i in text:
    if i.count('__') == 1 or i.count('**') == 1:
      format_error('Non bold table header: ', line[:len(line)-1], count,       \
                   '\nUse __text__ or **text** to set headings to bold')

  # Update previous/next lines and count
  prvline = line
  line = fp.readline()
  count += 1

  # Check for correct header line separator in table:
  if line.count(':---') != table_sep+1:
    format_error('Incorrect table header: ', line[:len(line)-1], count,        \
                 '\nMust be in format :---|:---|:--- and have at least 3 ---')

  # Check each row of table formatted correctly
  while line and not line == '\n':
    hyperlink_check(line, count)
    emphasis_check(line, count)
    newline_check(line, count)
    if not (line.count('|')-line.replace(' ','').count('||')) == table_sep:
      format_error('Incorrectly formed table: ', line[:len(line)-1], count,    \
                   '\nMust have an empty line after table. \nIf needing '      \
                   'multiple lines in a single cell use '+ r'"\newline"')

    # Update previous/next lines and count
    prvline = line
    line = fp.readline()
    count += 1
  return fp, count, line, prvline

# Check that yaml header correctly written.
def yaml_header_check(fp, count, line, prvline):
  options=('title:', 'subtitle:', 'date:')
  if '---' not in line:
    format_error('Missing title metadata: ', line[:len(line)-1], count,        \
                 '\nMust have title metadata. If title contains \":\" then '   \
                 'must be encased in brackets.\nFormat:\n\t---\n\ttitle:\n\t'  \
                 'subtitle:\n\tdate:\n\t---')
  prvline = line
  line = fp.readline()
  count += 1
  while '---' not in line:
    if line == '\n':
      format_error('Missing title metadata: ', line[:len(line)-1], count,      \
                   '\nMust have title metadata. If title contains \":\" then'  \
                   ' must be encased in brackets.\nFormat:\n\t---\n\ttitle:'   \
                   '\n\tsubtitle:\n\tdate:\n\t---')
    if ':' in line[line.find(' '):] and "\"" not in line:
      format_error('Missing \" in title metadata, contains \':\' ',            \
                   line[:len(line)-1], count,'')
    elif line.split()[0] not in options:
      format_error('Incorrect title metadata option: ', line[:len(line)-1],    \
                   count, '\nMust be in format: \n\t---\n\ttitle:\n\t'         \
                   'subtitle:\n\tdate:\n\t---')
    prvline = line
    line = fp.readline()
    count += 1
  return fp, count, line, prvline


with open(file) as fp:
  line = fp.readline()
  prvline = ''
  fp, count, line, prvline = yaml_header_check(fp, count, line, prvline)
  while line:
    # Check each line
    hyperlink_check(line, count)
    image_check(line, count)
    emphasis_check(line, count)
    newline_check(line, count)
    list_check(line, count, prvline)

    # If line is a header line, do header and empty line check
    if '#' in line[0]:
      line, count, prvline, fp, nextline_checked = header_check(
          line, count, prvline, fp, nextline_checked)
      empty_line_check()
      if nextline_checked:
        if prvline != '\n':
          format_error('Incorrect spacing no new line before table header: ',  \
                       line[:len(line)-1], count, '')
        fp, count, line, prvline = table_check(fp, count, line, prvline)
        table_required = False
        nextline_checked = False
    # Else if line is a table line, check there is an empty line before and
    # call table check.
    elif line.count('|') > 0:
      if prvline != '\n':
        format_error('Incorrect spacing no new line before table header: ',    \
                     line[:len(line)-1], count, '')
      fp, count, line, prvline = table_check(fp, count, line, prvline)
      table_required = False

    if description in line:
      table_required = True
    # Update previous/next lines and count
    prvline = line
    line = fp.readline()
    count += 1
  if table_required:
    format_error('## Description header used without table following: ',       \
                 line[:len(line)-1], count, '\nMust follow Description '       \
                 'header with a table')
