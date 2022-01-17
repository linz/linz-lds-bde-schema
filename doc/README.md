# Editing Markdown Data Dictionary

## Headings

Headings must be in the format:

    # Level One Heading
    ## Level Two Heading
    ### Level Three Heading

Level one and two headings will be automatically numbered when converted into pdf. Headings must
have either an empty line or another heading before. Level Two Headings must be used for Database
Table Names, for the extraction of table comments. The heading `Description:` must occur before each
database table definition, for the extraction of table comments. This should be a level three
heading. There can be no empty lines between consecutive headings.

## Hyperlinks

Hyperlinks must be in the format, and must have both the label and link:

    [label](link)

## Lists

Lists must be in the format:

    - Item 1
    - Item 2

-   Item 1
-   Item 2

or

    + Item 1
    + Item 2

-   Item 1
-   Item 2

or for ordered lists, (any number can be used at the start):

    1. Item 1
    1. Item 2
    1. Item 3

1. Item 1
1. Item 2
1. Item 3

Lists must have an empty line before begining and an empty line after.

## Figures/ Images

Figures or images must be in the format:

    ![label](link)

The label is optional but must still contain the [] brackets. The link can just be the name of the
file eg. parcels_dataset_model.png, so long as it is inside the models folder.

## Emphasis

Emphasis can be bold, italic or both in the format:

    __bold__
    **bold**
    *italic*
    __*italic and bold*__

As:  
**bold**  
**bold**  
_italic_  
**_italic and bold_**

## Newline

A new line is created by just starting the text on a new line, there may be multiple empty lines
between text, however the next text will still start on the line directly following. This cannot be
done in tables as empty lines break the table syntax.  
A new paragraph is created by using `<br>`, the text can be continued on the same line or started on
a new line the new paragraph will still be created. If a new line is required within a table use the
latex command `<br>` and continue the text on the same line, when this is converted to pdf the
newlines will be created. If a new paragraph is required within a table two `<br>` commands will
create this.

New pages will be automatically started before level 1 and level 2 headings.

## Database Tables

A database table must start with the database table name. Written in the form `## Table Name`, where
Table Name is the name of the table.

Following that there must be a description of the database table. With a heading written in the form
`### Description` followed by a description about the table on the following lines. This must then
be followed by an empty line to indicate the end of the description and begining of the table.

The first row of the table contains the column headers which must use bold syntax. The first column
of a table must be the column names of the table.

The only exception being when the first column contains types that extend multiple cells, where the
row isn't filled in every cell. For example:

| **Memorial Type**                                     | **Column Name**             | **Type**      | **Description**                                                                                     |
| :---------------------------------------------------- | :-------------------------- | :------------ | :-------------------------------------------------------------------------------------------------- |
|                                                       | **id**                      | **integer**   | A unique identifier for the memorial text (Primary Key). Sourced from crs_title_mem_text.audit_id.  |
|                                                       | **ttm_id**                  | **integer**   | The title memorial id.                                                                              |
| **Cancellation of Title**                             | new_title_legal_description | varchar(2048) | Legal description of a new title issued from the cancelation of the title related to this memorial. |
|                                                       | new_title_reference         | varchar(2048) | Title reference of a new title issued from the cancelation of the title related to this memorial.   |
| **Cancellation of Head Title for a Unit Development** | principal_unit              | varchar(2048) | New principal units issued from the cancelation of the title related to this memorial.              |
|                                                       | future_development_unit     | varchar(2048) | New future development units issued from the cancelation of the title related to this memorial.     |
|                                                       | assessory_unit              | varchar(2048) | New assessory units issued from the cancelation of the title related to this memorial.              |
|                                                       | title_issued                | varchar(2048) | New unit title issued from the cancelation of the title related to this memorial.                   |

The last column of a table must be the column which contains the notes/ comments about the row.
Labelled as either `__Notes__` or `__Description__`

The end of a Database Table is recognised by an empty line.

For Example:

## Legal Description Parcel [(https://data.linz.govt.nz/table/51717)](https://data.linz.govt.nz/table/51717)

### Description:

Contains the list of parcels for a particular legal description.

| **Data Element** | **Type (max. size)** | **Notes**                                                                  |
| :--------------- | :------------------- | :------------------------------------------------------------------------- |
| **LGD_ID**       | INTEGER              | The id of the legal description.                                           |
| **PAR_ID**       | INTEGER              | The id of the parcel in the legal description.                             |
| SEQUENCE         | SMALLINT             | The sequence in which the parcel are ordered within the legal description. |

## Table Syntax

Tables are defined using pipe table syntax:

      __Heading 1__ | __Heading 2__
      :-------------|:--------------
      Row 1 Col 1 | Row 1 Col 2
      Row 2 Col 1 | Row 2 Col 2

As:

| **Heading 1** | **Heading 2** |
| :------------ | :------------ |
| Row 1 Col 1   | Row 1 Col 2   |
| Row 2 Col 1   | Row 2 Col 2   |

Table headings use bold syntax to convert into bold headings in the pdf output. The heading
separator contains `:` to left align, and must contain at least three `-` per cell. Each row may or
may not be aligned, either way will still convert to a table correctly. There must be an empty line
before and after tables. To create multiple lines in a cell use `<br>` and continue the text on the
same line, when converted a newline will be created.

For tables with content that will span longer then the pdf page width, how the text wraps is
determined by the relative lengths of `-` in the table separator. So narrow columns should have less
`-` and wider columns have more.

## Yaml Header

A yaml header is required for the title, subtitle, date and version of the document.

The header requires `---` before and after. As there is no version option the version can be added
by using a `<br>` after the date, which will convert the version to be on the line following the
date.

If the title, version or subtitle text contains the text : the text must be contained in quotes, eg:
"LINZ Data Service: Simplified property and ownership tables".

    ---
    title: Dictionary Title
    subtitle: Dictionary Subtitle
    date: Date \newline Version
    ---

# Visio Files

When there is a change to the schema the png diagrams must also be updated. To do this, update the
relevant Visio files and then save copies of the diagrams as png images.
