---
title: 'LINZ Data Service: Simplified property and ownership tables'
subtitle: Data Dictionary
date: January 2022 <br> Version 1.7
---

# Versioning

| **Version number** | **Amendments**                                                                         | **Date**       |
| :----------------- | :------------------------------------------------------------------------------------- | :------------- |
| 1.0                | First draft                                                                            | September 2013 |
| 1.1                | Minor corrections                                                                      | July 2015      |
| 1.2                | Links to datasets and licensing information added                                      | May 2016       |
| 1.3                | Schema changes to NZ Survey Plans, updated data diagram & other minor changes          | August 2016    |
| 1.4                | Updates to LINZ Licence For Personal Data references                                   | September 2016 |
| 1.5                | Updates for new version (2.1) of LINZ License for Personal Data and dataset ID changes | November 2017  |
| 1.6                | Terminology changes for the Land Transfer Act 2017                                     | November 2018  |
| 1.7                | Minor schema changes                                                                   | January 2022   |

# Introduction

### Purpose

This document provides detailed metadata for the simplified property and ownership tabular data
available on the LINZ Data Service.

### Background

The LDS provides two sets of
[simplified data](https://data.linz.govt.nz/data/category/property-ownership-boundaries/) that
originates from the Landonline database, simplified spatial layers and simplified tables. <br>
_Simplified spatial layers_ <br> The simplified layers combine the most commonly used spatial and
tabular information. While this provides easy access and reuse, the process of combining datasets
necessarily leaves out data. The simplified layers are: <br>

-   [NZ Property Titles](https://data.linz.govt.nz/data/category/property-ownership-boundaries/)
-   [NZ Property Title Owners](https://data.linz.govt.nz/layer/50806-nz-property-title-owners/)
-   [NZ Property Titles Including Owners](http://data.linz.govt.nz/layer/50805-nz-property-titles-including-owners/)
    <br>

_Simplified tables_ <br> If you require additional data than provided in the simplified layers
above, you may need to access the simplified tabular data. These tables have been created to enable
the relationships to be better modelled rather than relying entirely on aggregation, or duplication
as is the case for the spatial layers. <br> If you require more complex, property and titles data,
please see the
[Full Landonline Dataset](https://data.linz.govt.nz/data/category/full-landonline-dataset/) on the
LINZ Data Service.

### Data Access

Simplified datasets that contain personal information are subject to the
[LINZ License for Personal Data](http://www.linz.govt.nz/data/licensing-and-using-data/linz-licence-for-personal-data)
to protect the privacy of individuals. You must read and accept the
[terms and conditions of the licence](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
and request access to the
[Owner Data – Controlled Access Group](https://data.linz.govt.nz/group/owner-data-controlled-access-group/)
before you can use this data.

### Data Model

The simplified _tabular_ data model below provides data for titles, owners, parcels and statutory
actions. It shows the relationships between them and the directly related spatial tables; NZ Parcels
and NZ Survey Plans. The descriptions of the spatial layers are provided in this document for
understanding the relationships with the property and ownership tabular datasets.

![](lds_property_ownership_model.png) _Figure 1: Table Relationship diagram for LDS Property and
Ownership simplified tables_ <br> **Note:** The relational diagram only shows the NZ Parcels layer.
However the Linear Parcels, Primary Road Parcels, Primary Land Parcels, Primary Hydro Parcels,
Non-Primary Parcels, Strata Parcels, Non-Primary Linear Parcels and Parcels Pending Approval (for
Councils only) have exactly the same relationships as NZ Parcels.

## NZ Parcels

### Description:

[https://data.linz.govt.nz/layer/51571-nz-parcels/](https://data.linz.govt.nz/layer/51571-nz-parcels/)
<br> This layer provides all cadastral parcel polygons/lines and some associated descriptive data
that details the appellation (legal description), purpose, size and a list of titles that have an
interest in the parcel. NZ Linear Parcels has the same schema
[(https://data.linz.govt.nz/layer/51570-nz-linear-parcels/)](https://data.linz.govt.nz/layer/51570-nz-linear-parcels/).
<br> In conjunction with the Linear Parcels this layer provides the easiest way to create a
relationship with associated tables such as NZ Parcel Title Association, NZ Statutory Actions and NZ
Survey Affected Parcels. <br> This layer contains spatial and non-spatial (without geometry)
parcels. The Landonline system which manages the data maintains non-spatial parcels for many
different reasons. The non-spatial parcels can only be accessedvia WFS or as a full layer file
download. No layer clips can be used. The most common reasons for non-spatial parcels are: <br>

1. Flats and unit survey plans will create non-spatial parcels for referencing property rights. This
   is because the Landonline system has not yet been designed to support the spatial definition of
   these plans. <br>
2. Titles which were not linked to a spatial parcel during the Landonline title conversion project
   created non-spatial parcel references. As titles are spatially linked many of these non-spatial
   parcels will be made historic or will be merged with the associated spatial parcel.

| **Column Name**   | **Type**       | **Description**                                                                                                                                                                                                                                                                                                                                   |
| :---------------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **id**            | **integer**    | The unique identifier for the parcel (Primary Key).                                                                                                                                                                                                                                                                                               |
| appellation       | varchar(2048)  | Appellations are the textual descriptions that describe a parcel. <br> Every parcel must have at least one appellation. Where there are both Survey and Title appellations, only the Survey one listed first.                                                                                                                                     |
| affected_surveys  | varchar(2048)  | A comma separated list of surveys plans that affect this parcel.                                                                                                                                                                                                                                                                                  |
| parcel_intent     | varchar(100)   | A description of a right of interest intended to be assigned to a parcel. e.g. Fee Simple Title, Road, Hydro, Maori, Railway.                                                                                                                                                                                                                     |
| topology_type     | varchar(100)   | Topology class of the parcel.                                                                                                                                                                                                                                                                                                                     |
| status            | varchar(25)    | The status of the parcel. A parcel can one of the following statuses: <br> Approved, Current, Historic, Survey Historic                                                                                                                                                                                                                           |
| statutory_actions | varchar(4096)  | A windows newline separated list of statutory actions associated to the parcel. Refer to the NZ Parcel Statutory Actions table for non-aggregated data.                                                                                                                                                                                           |
| land_district     | varchar(100)   | The name of the land district the title is in. e.g. “North Auckland”, “Southland” See [http://data.linz.govt.nz/layer/50785-nz-land-districts/](http://data.linz.govt.nz/layer/50785-nz-land-districts/) for more details <br> A Land District is an administrative area that all titles and surveys were registered against prior to Landonline. |
| titles            | varchar(32768) | A comma separated list of Titles numbers associated to the parcel. This is provided for convenience. If more detailed Titles data is required reference to the NZ Property Titles, NZ Property Title Estates and NZ Title Owners tables.                                                                                                          |
| survey_area       | decimal(20,4)  | The total area of combined sub parcels if recorded, otherwise the area provided by a surveyor on a new survey lodged to support a title or amend a title.                                                                                                                                                                                         |
| calc_area         | decimal(20,0)  | An area calculated on a Transverse Mercator projection of the parcel geometric object. For parcels on the NZ mainland, the NZTM projection is used, for parcels on the Chatham Islands the CITM2000 projection is used. It is not an official area and has been produced for the convenience of users.                                            |
| shape             | geometry       | Spatial definition of parcel. Multi-polygon or Multi-linestring geometric object.                                                                                                                                                                                                                                                                 |

### Relationships

| **Parent table** | **Child table**                           | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :--------------- | :---------------------------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Parcels       | NZ Parcel Statutory Actions List          | id                            | par_id                       | Zero or more    |
| NZ Parcels       | NZ Survey Statutory Affected Parcels List | id                            | par_id                       | Zero or more    |
| NZ Parcels       | NZ Title Parcel Association List          | id                            | par_id                       | Zero or more    |

## NZ Property Titles List

### Description:

[https://data.linz.govt.nz/table/51567-nz-property-titles-list/](https://data.linz.govt.nz/table/51567-nz-property-titles-list/)
<br> This table provides information on Records of Title that are live and part-cancelled. This
table contains top level, general title data only, such as the title number, type (e.g. Freehold,
Unit Title, Cross Lease etc) and status.<br> A Record of Title is a record of a property's owners,
legal description and the rights and responsibilities registered against the title – known as
estates, encumbrances and easements.</br> These are still recorded in this dataset in their legacy
(pre-Land Transfer Act 2017) format as Computer Registers incorporating Computer Freehold Registers,
Composite Computer Registers, Computer Unit Title Registers and Computer Interest Registers.

| **Column Name**   | **Type**        | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| :---------------- | :-------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**            | **integer**     | The unique identifier for the title (Primary Key). Sourced from crs_title.audit_id                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **title_no**      | **varchar(20)** | The title number that uniquely identifies each title.<br> Pre Landonline title numbers will usually be in the form of "nnnx/nn" (Eg, "203B/12" or "1A/1"). They will be converted with the land district prefix at the beginning to make them unique egg “OT1A/1”. <br> New title numbers created in Landonline will be numbers only.                                                                                                                                                                                                      |
| status            | vvarchar(50)    | The status of the title. Live or Part-Cancelled                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| register_type     | varchar(50)     | Indicates the register the title is contained in under the legacy Land Transfer Act 1952 (e.g. the Computer Freehold Register, Computer Interest Register)                                                                                                                                                                                                                                                                                                                                                                                 |
| type              | varchar(100)    | Indicates the type of title. Examples of title type include Freehold, Leasehold, Composite and Supplementary Record Sheet.                                                                                                                                                                                                                                                                                                                                                                                                                 |
| land_district     | varchar(100)    | The name of the land district the title is in. e.g. “North Auckland”, “Southland” See [http://data.linz.govt.nz/layer/50785-nz-land-districts/](http://data.linz.govt.nz/layer/50785-nz-land-districts/) for more details <br> A Land District is an administrative area that all titles and surveys were registered against prior to Landonline.                                                                                                                                                                                          |
| issue_date        | datetime        | The date on which the title was issued.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| guarantee_status  | varchar(100)    | The status of the State guarantees relating to a title. <br> A title may be fully guaranteed or "Limited as to parcels" which means that a fully guaranteed title will not be issued for the land until a survey plan of the land has been deposited.                                                                                                                                                                                                                                                                                      |
| provisional       | char(1)         | A flag indicating if the title is qualified (previously termed provisional). A qualified title is a type of Record of Title (computer interest register) that is used to record transactions against land where the requirements to have a normal Record of Title (computer freehold register) issued have not been met. e.g. For Maori land, to deal with delays in the registration of dealings between the date of the order of the Maori Land Court declaring the land to be held in freehold tenure and the issue of the Crown grant. |
| title_no_srs      | varchar(20)     | Unit titles are linked to a single Supplementary Record Sheet title. <br> This contains the SRS title number if the current title is a unit title.                                                                                                                                                                                                                                                                                                                                                                                         |
| title_no_head_srs | varchar(20)     | Titles of type Supplementary Record Sheet, where it is a subsidiary unit title development (subdivision of a principal unit).                                                                                                                                                                                                                                                                                                                                                                                                              |
| survey_reference  | varchar(50)     | Titles of type Supplementary Record Sheet display a survey plan number for the title to support the Unit development subdivision plan.                                                                                                                                                                                                                                                                                                                                                                                                     |
| maori_land        | char(1)         | ‘Y’ or null. Identifies titles which may potentially be Maori Land. It is known to contain omissions and errors and is indicative only.                                                                                                                                                                                                                                                                                                                                                                                                    |
| number_owners     | integer         | Total number of current owners for the title.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

### Relationships

| **Parent table**        | **Child table**                  | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :---------------------- | :------------------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Property Titles List | NZ Title Parcel Association List | title_no                      | title_no                     | Zero or more    |
| NZ Property Titles List | NZ Property Title Estates List   | title_no                      | title_no                     | One or more     |

## NZ Title Memorials List (Including Mortgages, Leases, Easements)

### Description:

[https://data.linz.govt.nz/table/51695-nz-title-memorials-list-including-mortgages-leases-easements/](https://data.linz.govt.nz/table/51695-nz-title-memorials-list-including-mortgages-leases-easements/)
<br> A title memorial is information recorded on a property title relating to a transaction,
interest or restriction over a piece of land. Memorials can include details of mortgages, discharge
of mortgages, transfer of ownership, and leases; all of which affect the land in some way. <br>
Title memorials result from the official processing and recording of legal documents (instruments)
that deal with land. There are over three million titles and most titles will have more than one
memorial. Most memorials have a date and time which relate to when the transaction (dealing) was
lodged for registration. <br> This dataset is an aggregation and simplification of title memorial
data and only provides the high-level memorial text that is shown on the certificate of title. The
full legal documentation related to the memorial is held in Landonline, our official survey and
title application, and is only accessible to customers that have a Landonline login. An introduction
to Landonline can be found here:
[http://www.linz.govt.nz/land/landonline/getting-started](http://www.linz.govt.nz/land/landonline/getting-started).
<br> A memorial only remains current while the interest/restriction affecting the title remains
valid. For example when a discharge of mortgage is registered, the current mortgage memorial is
removed from the current view of the title but is kept in the system as an historic record. As such
it is important to be aware of the “current” field when using this data. <br> This dataset does not
include memorials that have been submitted for processing (lodged) and are yet to be registered.
<br> A small number of memorials records recorded on a title have additional text which is not
included in this dataset, but instead is available as the NZ Title Memorials Additional Text table:
[http://data.linz.govt.nz/table/51696](http://data.linz.govt.nz/table/51696). These are usually
easement memorials affecting titles in South Island land districts or are cancellation memorials.
<br> **Important Notes:** <br>

-   The Privacy Act applies to personal information contained within this dataset, particularly when
    used in conjunction with other public data. See the
    [LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
    <br>
-   When Landonline was developed (circa 2000), only current memorials (i.e. those shown on live
    titles) were converted from paper to digital format. Therefore any historic memorial contained
    in this dataset has only become historic since the development of Landonline.

| **Column Name**            | **Type**        | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| :------------------------- | :-------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**                     | **integer**     | The memorial id (primary key).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **title_no**               | **varchar(20)** | The title number the memorial relates to.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| land_district              | varchar(100)    | The name of the land district the title is in. e.g. “North Auckland”, “Southland” See [(https://data.linz.govt.nz/layer/51570-nz-linear-parcels/) ](https://data.linz.govt.nz/layer/51570-nz-linear-parcels/) for more details <br> A Land District is an administrative area that all titles and surveys were registered against prior to Landonline.                                                                                                                                                                                                                                                                                   |
| memorial_text              | text            | The text of the memorial. <br> **Note:** A small minority of memorials (usually easements) don’t have this field populated. They instead have additional text held in tabular format in the Landonline System. This additional text is not included in this dataset but is available as the NZ Title Memorials Extended Text table [http://data.linz.govt.nz/table/51696](http://data.linz.govt.nz/table/51696).                                                                                                                                                                                                                         |
| current                    | boolean         | Indicates if the memorial is a current or historic ‘interest’.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| instrument_number          | varchar(30)     | The number of the instrument that created the memorial; an instrument being a document relating to the transfer of, or other dealing with land. See note on instruments below.                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| instrument_lodged_datetime | datetime        | The date and time the instrument was lodged for registration.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| instrument_type            | varchar(100)    | The type of the instrument. For example Mortgage, Transfer, Lease or Discharge of Mortgage.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| encumbrancees              | varchar(4096)   | Those that have a share in an encumbrance where an encumbrance is an interest in the land (e.g., mortgage, lease etc). For example where a bank holds a mortgage on a piece of land, the bank is the encumbrancee. Only current memorials with certain instrument types have encumbrancees. Instrument types that have encumbrancees include Mortgage, Caveat and Encumbrance. The memorial text always includes all current encumbrancees, however, the encumbrancees field sometimes does not. This means that when searching for particular encumbrancees the memorial_text field is best used in addition to the encumbrancee field. |

**- A note on Instrument Numbers -** In the Landonline System a memorial may be associated with
different instruments: the original instrument that created the memorial, instruments that have
modified the memorial, and an instrument that has extinguished the memorial. This dataset only shows
the details of the instrument that last modified the memorial if it exists, and if it doesn’t then
the original ‘creating’ instrument details are shown. A result of this simplification is that in
some cases the instrument number listed in the memorial_text does not match the instrument_number
field. An example of when this occurs is where an Order for a New Certificate of Title has been
registered. Any memorials on the cancelled title that affect the new title(s) are brought forward
onto the new title(s). The instrument number in the memorial_text will refer to the original
instrument, but the instrument_number column will refer to the instrument that has brought forward
the memorial onto the new title(s).

### Relationships

| **Parent table**        | **Child table**         | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :---------------------- | :---------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Property Titles List | NZ Title Memorials List | title_no                      | title_no                     | Zero or more    |

## NZ Title Memorials Additional Text List

### Description:

[https://data.linz.govt.nz/table/51696-nz-title-memorials-additional-text-list/](https://data.linz.govt.nz/table/51696-nz-title-memorials-additional-text-list/)
<br> This table should be used in conjunction with the NZ Title Memorials List table
[(http://data.linz.govt.nz/table/51695)](http://data.linz.govt.nz/table/51695) A small percentage of
memorials (about 1%) have additional text that is structured in such a way that it could not be
included in the NZ Title Memorials table and so is included here as a separate table. <br> The
additional text is used in three different situations:

-   Where a certificate of title has been cancelled and more than one new title has been issued from
    the cancelled title. In this case the new_title_legal_description and new_title_reference fields
    are populated itemising the new titles that have been issued. <br>
-   Where a head title for a unit development has been cancelled and individual unit titles have
    been issued from the cancelled title. In this case some or all of the principal_unit,
    future_development_unit, assessory_unit and ct_issued fields are populated. <br>
-   Where easements were converted from paper records to digital format at the beginning of the
    Landonline project (circa 2000). Easements are no longer recorded in this format but none the
    less they make up the majority of the records in this dataset. They usually relate to titles in
    the South Island. In this case some or all of the easement_type, servient_tenement,
    easement_area, dominant_tenement_or_grantee and statutory_restriction fields are populated. <br>

**Important:** The Privacy Act applies to personal information contained within this dataset,
particularly when used in conjunction with other public data. See the
[LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)

| **Memorial Type**                                     | **Column Name**              | **Type**      | **Description**                                                                                     |
| :---------------------------------------------------- | :--------------------------- | :------------ | :-------------------------------------------------------------------------------------------------- |
|                                                       | **id**                       | **integer**   | A unique identifier for the memorial text (Primary Key). Sourced from crs_title_mem_text.audit_id.  |
|                                                       | **ttm_id**                   | **integer**   | The title memorial id.                                                                              |
| **Cancellation of Title**                             | new_title_legal_description  | varchar(2048) | Legal description of a new title issued from the cancelation of the title related to this memorial. |
|                                                       | new_title_reference          | varchar(2048) | Title reference of a new title issued from the cancelation of the title related to this memorial.   |
| **Cancellation of Head Title for a Unit Development** | principal_unit               | varchar(2048) | New principal units issued from the cancelation of the title related to this memorial.              |
|                                                       | future_development_unit      | varchar(2048) | New future development units issued from the cancelation of the title related to this memorial.     |
|                                                       | assessory_unit               | varchar(2048) | New assessory units issued from the cancelation of the title related to this memorial.              |
|                                                       | title_issued                 | varchar(2048) | New unit title issued from the cancelation of the title related to this memorial.                   |
| **Easement**                                          | easement_type                | varchar(2048) | The type of easement. For example right of way or drain water.                                      |
|                                                       | servient_tenement            | varchar(2048) | The land over which the easement runs (burdened land).                                              |
|                                                       | easement_area                | varchar(2048) | Description of the easement area.                                                                   |
|                                                       | dominant_tenement_or_grantee | varchar(2048) | The land enjoying the benefit of an easement (benefitted land).                                     |
|                                                       | statutory_restriction        | varchar(2048) | A restriction on the removal of an easement without consent from a local body.                      |

### Relationships

| **Parent table**        | **Child table**                         | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :---------------------- | :-------------------------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Title Memorials List | NZ Title Memorials Additional Text List | id                            | ttm_id                       | Zero or more    |

## NZ Property Title Estates List

### Description:

[https://data.linz.govt.nz/table/51566-nz-property-title-estates-list/](https://data.linz.govt.nz/table/51566-nz-property-title-estates-list/)
<br> A title estate is a type of ownership of a piece of land e.g. fee simple estate, leasehold
estate. <br> Estates are used to link the owners to the title. A title can have more than 1 estate
and type.

| **Column Name**   | **Type**        | **Description**                                                                                                                                                                                                                                                                                |
| :---------------- | :-------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**            | **integer**     | The unique identifier for the title estate (Primary Key). Sourced from crs_title_estate.id                                                                                                                                                                                                     |
| **title_no**      | **varchar(20)** | The number of the title that this title estate belongs to.                                                                                                                                                                                                                                     |
| type              | varchar(100)    | Defines the type of the estate for which the title was issued. E.g. 'Fee Simple', 'Stratum in Freehold', 'Leasehold'                                                                                                                                                                           |
| land_district     | varchar(100)    | The name of the land district the title is in. e.g. “North Auckland”, “Southland” See [http://data.linz.govt.nz/layer/50785-nz-land-districts/](http://data.linz.govt.nz/layer/50785-nz-land-districts/) for more details                                                                      |
| status            | varchar(25)     | The status of the estate within the context of the title estate. Can only be ‘Registered’                                                                                                                                                                                                      |
| share             | varchar(100)    | The share of the estate held by this title. This field will normally be a whole share, however, it is possible for two different titles to contain a half (or other) share of the same area of land (e.g., for access lots or composite cross-lease titles).                                   |
| purpose           | varchar(255)    | The description of the purpose that the land is held for (if applicable). E.g., a piece of land vested in the council during a subdivision may have a purpose "Local purpose recreation reserve". The purpose restricts the use of the land and the title. Used for display in the title view. |
| timeshare_week_no | varchar(20)     | If the title is a timeshare title, this contains the timeshare week that the title is for.                                                                                                                                                                                                     |
| term              | varchar(255)    | Description of the term of the estate. Only valid for time limited estates for example Lease Hold estates. Their term is held as a textual description only for display (i.e, no automatic processing is performed based on the term).                                                         |
| legal_description | varchar(2048)   | The legal description for the title estate types. It is derived from the appellations of the parcels that make up the estate                                                                                                                                                                   |
| area              | integer         | Total area of the land contained with the title estate. The area may not always be defined, due to data conversion issues from the historic paper record into the Landonline system.                                                                                                           |

### Relationships

| **Parent table**               | **Child table**                | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :----------------------------- | :----------------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Property Titles List        | NZ Property Title Estates List | title_no                      | title_no                     | One to many     |
| NZ Property Title Estates List | NZ Property Title Owners List  | id                            | tte_id                       | One to many     |

## NZ Property Title Owners List

### Description:

[https://data.linz.govt.nz/table/51564-nz-property-titles-owners-list/](https://data.linz.govt.nz/table/51564-nz-property-titles-owners-list/)
<br> This table provides registered (or current) ownership information for a Title. An owner is a
person or corporation holding a share in a Title estate. <br> This tabular data table has direct
relationships to the tabular table, title estates. <br> **Important:** The Privacy Act applies to
personal information contained within this dataset, particularly when used in conjunction with other
public data. See the [LINZ Licence For Personal Data 2.1](LINZ Licence For Personal Data 2.1)

| **Column Name**   | **Type**     | **Description**                                                                                                                                                                                                                                                                                                                                    |
| :---------------- | :----------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**            | **integer**  | The unique identifier for the title owner. (Primary Key).                                                                                                                                                                                                                                                                                          |
| **tte_id**        | **integer**  | The identifier of the title estate that the owner owns. If there are joint tenants on a title, there will be more than one owner for the same title estate.                                                                                                                                                                                        |
| title_no          | varchar(20)  | The number of the title that this owner belongs to.                                                                                                                                                                                                                                                                                                |
| land_district     | varchar(100) | The name of the land district the title is in. e.g. “North Auckland”, “Southland” See [http://data.linz.govt.nz/layer/50785-nz-land-districts/](http://data.linz.govt.nz/layer/50785-nz-land-districts/) for more details. <br> A Land District is an administrative area that all titles and surveys were registered against prior to Landonline. |
| status            | varchar(25)  | The status of the owner within the context of the title estate. Can only be ‘Registered’                                                                                                                                                                                                                                                           |
| estate_share      | varchar(100) | The title estate share that owner has. If tenants in common exist on a title, they will be recorded as separate estate shares. A value needs to be given to each of the shares. Generally the value of all the estate shares in an estate will add up to one (but this is not always the case with Maori titles).                                  |
| owner_type        | varchar(10)  | Indicates whether this owner is an individual or corporation.                                                                                                                                                                                                                                                                                      |
| prime_surname     | varchar(100) | If this owner is an individual, the surname of the owner is stored here, otherwise this should be blank.                                                                                                                                                                                                                                           |
| prime_other_names | varchar(100) | If this owner is an individual, the given name(s) of the owner are stored here, otherwise this should be blank.                                                                                                                                                                                                                                    |
| corporate_name    | text         | If this owner is a corporation, the name of the corporation is stored here, otherwise this should be blank.                                                                                                                                                                                                                                        |
| name_suffix       | varchar(6)   | If this owner is an individual, the name_suffix of the owner is stored here; otherwise this should be blank e.g. Junior, 'senior, Second, Third.                                                                                                                                                                                                   |

### Relationships

| **Parent table**               | **Child table**               | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :----------------------------- | :---------------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Property Title Estates List | NZ Property Title Owners List | id                            | tte_id                       | One to many     |

## NZ Title Parcel Association List

### Description:

[https://data.linz.govt.nz/table/51569-nz-title-parcel-association-list/](https://data.linz.govt.nz/table/51569-nz-title-parcel-association-list/)
<br> This table is used to associate live and part cancelled titles to current spatial parcels.
There is a many to many relationship between titles and parcels. <br> This table can be used to link
NZ Property Titles List, NZ Property Title Estates List, or NZ Property Title Owners List to spatial
parcel layers such as NZ Parcels, NZ Linear Parcels or NZ Primary Parcels <br> The match between
live/part cancelled titles and current parcels is more than 97%.

| **Column Name** | **Type**        | **Description**                                                                                                                                                                                                          |
| :-------------- | :-------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**          | **integer**     | The unique identifier title parcel association. (Primary Key)                                                                                                                                                            |
| **title_no**    | **varchar(20)** | The title that is associated to the spatial parcel.                                                                                                                                                                      |
| **par_id**      | **integer**     | The id of the spatial parcel.                                                                                                                                                                                            |
| source          | varchar(8)      | The source of the association. <br> LINZ - sourced from other Landonline official information <br> External – sourced external to Landonline (from external agencies and LINZ staff). These will be of variable quality. |

### Relationships

| **Parent table**        | **Child table**                  | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :---------------------- | :------------------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Parcels              | NZ Title Parcel Association List | id                            | par_id                       | Zero or more    |
| NZ Property Titles List | NZ Title Parcel Association List | title_no                      | title_no                     | Zero or more    |

## NZ Survey Plans

### Description:

[https://data.linz.govt.nz/layer/50794-nz-survey-plans/](https://data.linz.govt.nz/layer/50794-nz-survey-plans/)
<br> This layer provides metadata about cadastral surveys along with reference points indicating the
location of the survey. A cadastral survey determines and describes the spatial extent (including
boundaries) of interest of land within New Zealand. Each survey is allocated a unique reference
number (that prior to Landonline included reference to the land district. Survey provides details
that identify the type of survey, the purpose, and who is involved with giving authorisation,
preparation and taking responsibility for work when it is lodged with LINZ <br> For example: The
Surveyor who generates a survey dataset is responsible for the accuracy, definition and completeness
and provides the details of the purpose for carrying out the work.

| **Column Name**  | **Type**      | **Description**                                                                                                                                                                                                                                                                                                                                                                                                            |
| :--------------- | :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**           | **integer**   | Unique identifier for Survey. (Primary Key) Source from crs_work.id                                                                                                                                                                                                                                                                                                                                                        |
| survey_reference | varchar(100)  | The survey dataset number e.g. SO 12345, DP 12345                                                                                                                                                                                                                                                                                                                                                                          |
| land_district    | varchar(100)  | The name of the land district the title is in. e.g. “North Auckland”, “Southland” See [http://data.linz.govt.nz/layer/50785-nz-land-districts/](http://data.linz.govt.nz/layer/50785-nz-land-districts/) for more details A Land District is an administrative area that all titles and surveys were registered against prior to Landonline.                                                                               |
| description      | varchar(2048) | Survey Description, e.g. "Lots 1 and 2 being subdivision of Lot 1 DP 1000"                                                                                                                                                                                                                                                                                                                                                 |
| status           | varchar(30)   | The status for the survey. e.g. 'Approved', 'Registered', 'Requisitioned'                                                                                                                                                                                                                                                                                                                                                  |
| survey_date      | date          | The date the survey was performed.                                                                                                                                                                                                                                                                                                                                                                                         |
| purpose          | varchar(30)   | LT subdivision, cross lease, unit plan etc.                                                                                                                                                                                                                                                                                                                                                                                |
| type             | varchar(100)  | Survey - A dataset where a Surveyor has completed Reduced Observations to determine spatial reference.(Includes Flats & Units) <br> Compiled - A dataset prepared from existing boundary points and no new Reduced Observations are required. <br> Computed - A dataset prepared from previous datasets that creates new boundary points without new Reduced Observations <br> Refer Sys Code Group SURT for valid values. |
| datum            | varchar(10)   | The datum the plan is generalised to NZGD1949, NZGD2000, OCD (Old Cadastral Datum).                                                                                                                                                                                                                                                                                                                                        |
| lodged_date      | datetime      | The latest date the survey was lodged with LINZ for approval.                                                                                                                                                                                                                                                                                                                                                              |
| authorised_date  | datetime      | The date the survey was authorised (i.e. date of approval).                                                                                                                                                                                                                                                                                                                                                                |
| shape            | geometry      | Multi-point geometry. This is aggregation of reference points indicating the location of the survey.                                                                                                                                                                                                                                                                                                                       |

### Relationships

| **Parent table** | **Child table**                 | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :--------------- | :------------------------------ | :---------------------------- | :--------------------------- | :-------------- |
| NZ Survey Plans  | NZ Survey Affected Parcels List | id                            | sur_wrk_id                   | Zero or more    |

## NZ Survey Affected Parcels List

### Description:

[https://data.linz.govt.nz/table/51568-nz-survey-affected-parcels-list/](https://data.linz.govt.nz/table/51568-nz-survey-affected-parcels-list/)
<br> This table is used to describe the many to many relationship between surveys and parcels. <br>
An affected parcel is a parcel which is affected by the approval of a survey dataset. A parcel may
be affected, created or extinguished. For example, a survey can affect extinguish parcels by
rendering them historical and at the same time may create new parcels (subdivision). Parcels may be
affected by a survey but remain current (definition of an easement etc). <br> The same relationships
and attributes exist for the NZ survey Affected Parcels List (Pending Approval) dataset (for Council
only).<br>

| **Column Name** | **Type**    | **Description**                                                                                                                                                                                                                                                                                                            |
| :-------------- | :---------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**          | **integer** | Unique identifier for affected parcel surveys. (Primary Key) Sourced from crs_affected_parcl.audit_id                                                                                                                                                                                                                      |
| **sur_wrk_id**  | **integer** | Work id of survey this parcel was affected by                                                                                                                                                                                                                                                                              |
| **par_id**      | **integer** | Identifier of the parcel that was affected by the survey                                                                                                                                                                                                                                                                   |
| action          | varchar(12) | A parcel may be affected, created or extinguished by the approval of a Survey Dataset. For example, a survey can affect extinguish parcels by rendering them historical and at the same time may create new parcels (subdivision). Parcels may be affected by a survey but remain current (definition of an easement etc). |

### Relationships

| **Parent table** | **Child table**                 | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :--------------- | :------------------------------ | :---------------------------- | :--------------------------- | :-------------- |
| NZ Parcels       | NZ Survey Affected Parcels List | id                            | par_id                       | Zero or more    |
| NZ Parcels       | NZ Survey Affected Parcels List | id                            | sur_wrk_id                   | Zero or more    |

## NZ Parcel Statutory Actions List

### Description:

[https://data.linz.govt.nz/table/51565-nz-parcel-statutory-actions-list/](https://data.linz.govt.nz/table/51565-nz-parcel-statutory-actions-list/)
<br> A Statutory Action is the action that is authorised by a specific Part or Section of an Act.
<br> This table provides information about the current and historic statutory actions as recorded
against specific parcels. Such as the purpose and Gazette Reference if applicable.

| **Column Name**  | **Type**     | **Description**                                                                                           |
| :--------------- | :----------- | :-------------------------------------------------------------------------------------------------------- |
| **id**           | **integer**  | Unique identifier for the parcel statutory action. (Primary Key) Sourced from crs_stat_act_parcl.audit_id |
| **par_id**       | **integer**  | The identifier for a parcel.                                                                              |
| status           | varchar(10)  | The status for the action e.g. ‘Current’, ‘Historic’                                                      |
| action           | varchar(12)  | Actions against parcel networks when recorded. e.g. 'Extinguished', 'Create', 'Referenced'                |
| statutory_action | varchar(255) | Description of the statutory action listing type, purpose and Gazette Reference if applicable.            |

### Relationships

| **Parent table** | **Child table**                  | **Relating Parent Attribute** | **Relating Child Attribute** | **Cardinality** |
| :--------------- | :------------------------------- | :---------------------------- | :--------------------------- | :-------------- |
| NZ Parcels       | NZ Parcel Statutory Actions List | id                            | par_id                       | Zero or more    |
