---
title: "LINZ Data Service: Full Landonline Dataset"
subtitle: Data Dictionary and Data Models
date: November 2018
version: 2.6
---

# Versioning

__Version number__ | __Amendments__ | __Date__
:--------|:---------------------------------|:------------
1.0 | First draft drawn from BDE documentation for external comment. <br> Notable changes: <br> - Geometry type defined <br> - Clarification of primary keys | September 2014
2.0 | First official release | November 2014
2.1 | Updates for schema and data changes, and minor corrections | May 2015
2.2 | Updates to LINZ Licence For Personal Data references | September 2016
2.3 | Updates for the change of source for Street Address and Roads data from Landonline to the Address Information Management System | October 2016
2.4 | Revised URLs to direct to new dataset IDs <br> Added Ordinate Adjustment table and model <br> Deprecated Map Grid <br> Removed roads and addresses table and model | November 2017
2.5 | Updated for change to Creative Commons Attribution 4.0 license | April 2018
2.6 | Terminology changes from Land Transfer Act 2017 | November 2018

# Introduction
### Purpose
The document provides detailed metadata (data dictionary) and data models for the [Full Landonline Dataset available on the LINZ Data Service](https://data.linz.govt.nz/group/full-landonline-dataset/).

### Background
[Landonline](http://www.linz.govt.nz/land/landonline) is the online service for surveyors, lawyers and other land professionals, providing access to New Zealand’s only authoritative database for land title and survey information. It enables land professionals to search, and to lodge title dealings and survey data digitally. <br>

The Full Landonline Dataset available on the LINZ Data Service of comprised of over 90 datasets sourced from Landonline and is available for reuse. <br>

The Full Landonline Dataset available on the LINZ Data Service is:

- updated weekly
- available as a ‘changeset’ – allowing incremental data updates
- downloadable in a variety of formats including CSV and Esri FileGDB
- available in a range of projections, including [Transverse Mercator 2000 (NZTM)](http://www.linz.govt.nz/geodetic/datums-projections-heights/projections/new-zealand-transverse-mercator-2000), [World Geodetic System (WGS84)](http://www.linz.govt.nz/geodetic/datums-projections-heights/geodetic-datums/world-geodetic-system-1984) and [New Zealand Geodetic Datum (NZGD2000)](http://www.linz.govt.nz/geodetic/datums-projections-heights/geodetic-datums/new-zealand-geodetic-datum-2000)
- accessible via web services/apis <br>

The schema for the Full Landonline Dataset tables is based on the original LINZ Bulk Data Extract tables; as is this data dictionary. Please contact LINZ if you have used the BDE tables in the past and require a list of schema changes between the tables described in this document and the BDE supply.

### About the Full Landonline Dataset on LDS
The Full Landonline Dataset on the LINZ Data Service includes over 90 tables and layers of survey, geodetic, and title data that is maintained by LINZ in managing New Zealand’s property rights system. <br>
The dataset is intended to cater for those customers who require access large volumes of detailed data on a regular basis. The dataset allows you to recreate the database held in Landonline. Expertise in reading, transforming and analysing large volumes of complex data is required to successfully understand and use this data.<br>
The most commonly used information from the Full Landonline Dataset is the property and ownership data. If you are interested in this information but don’t need the full, complex dataset, we provide access to a selection of simplified property and ownership datasets.

### Simplified property and ownership data
The LDS provides two sets of simplified data that originates from the Landonline database:

- [Simplified spatial layers](https://data.linz.govt.nz/layers/category/property-ownership-boundaries/)
- [Simplified tables](https://data.linz.govt.nz/tables/category/property-ownership-boundaries/) <br>

These layers and tables are cut down, easy to digest versions of those in the Full Landonline Dataset and have been designed to be easy to use and have attributes that are most useful for most data processing, GIS viewing and analysis. This data is updated weekly. <br>

The simplified layers provide the most commonly used spatial information, with some compromises made such as data aggregation, omission and duplication, e.g. NZ Title Owners and NZ Property Titles Including Owners. <br>

The tabular data provides some additional information that cannot be easily added or utilised within the simplified spatial layers. These tables have been created to enable the relationships to be better modelled rather than relying entirely on aggregation, or duplication as is the case for the spatial layers. <br>

For Esri users we have developed a [File Geodatabase support tool to merge and build relationships](https://www.linz.govt.nz/data/linz-data-service/guides-and-documentation/building-relationships-for-esri-file-geodatabase) between these simplified layers and tables.

### Data updates
Data sourced from Landonline is updated in LDS on a weekly basis. The refreshed data will be available on LDS from Monday morning and is a snapshot of data from Landonline changed between Saturday and Friday and previous week.

### Data use and licensing
Unless otherwise specified, data from LDS is provided under the [Creative Commons Attribution 3.0 New Zealand license](https://creativecommons.org/licenses/by/3.0/nz/). This means you are free to use, reuse and share data as long as you attribute the work to LINZ as the original source of the data. LINZ retains Crown copyright. See the LINZ website for more information on [data licensing and attribution](https://www.linz.govt.nz/data/licensing-and-using-data). <br>

Datasets containing personal data, such as those that contain information on the owner of a property title, have a customised licence which you need to accept before being able to access this data. Please familiarise yourself with the key features of the [LINZ License For Personal Data](https://www.linz.govt.nz/data/licensing-and-using-data/linz-licence-for-personal-data), then read and accept [the terms and conditions of this license](https://data.linz.govt.nz/license/linz-licence-personal-data-21/) before using the licensed data.

# Data Definitions
### Full Landonline Dataset data models
To assist you in understanding the relationships between datasets, the following nine diagrams provide detailed models of logical groupings of data from the Full Landonline Dataset. No attempt has been made to indicate cardinality, however, the arrows drawn between datasets point from the dataset containing the unique record, to the dataset that may contain one or more references to that record (i.e. primary key -> foreign key).

### Primary keys
To enable changes between updates to be recorded and then queried using the LDS changeset service, every table has a primary key. In the cases where the Landonline table view doesn’t have a primary key, a single column integer primary key has been provided. <br>

__*Primary keys*__ are shown by a bolded and italic field name. Tables can also have __unique keys__, which are shown by a bolded field name. Where more than one field is bolded, this indicates that the unique fields can be used together to create a composite key. <br>

The LDS changeset service has a strict requirement that the primary key must be a single column integer. In cases where the Landonline table did not have a single column unique integer we added one. The Landonline naming convention for primary keys is “ID”. Where LDS has added a single column integer primary key it has a field name of AUDIT_ID. <br>

### Data models and LINZ Data Service sets
The tables in these datasets are accessible from the LINZ Data Service individually or as themed sets. The nine available sets are derived from the original Landonline data model. Due to file size restrictions, some of these original groupings have been split across LDS Landonline sets.

__LDS Full Landonline Set__ | __Landonline Datasets__
:----------------------------|:-----------------------
[Landonline: Parcels and Descriptions Dataset](https://data.linz.govt.nz/set/4745-landonline-parcels-and-descriptions-dataset/) | Parcels
[Landonline: Parcel Topology Dataset](https://data.linz.govt.nz/set/4746-landonline-parcel-topology-dataset/) | Parcel Topology
[Landonline: Survey and Observations Dataset 1](https://data.linz.govt.nz/set/4750-landonline-survey-and-observations-dataset-1/) | Survey <br> Survey Observations
[Landonline: Survey and Observations Dataset 2](https://data.linz.govt.nz/set/4751-landonline-survey-and-observations-dataset-2/) | Survey Observations
[Landonline: Marks and Adjustments Dataset](https://data.linz.govt.nz/set/4752-landonline-marks-and-adjustments-dataset/) | Marks, Nodes & Coordinates Adjustments
[Landonline: System/Shared Dataset](https://data.linz.govt.nz/set/4744-landonline-system-shared-dataset/) | System/Shared
[Landonline: Titles Dataset](https://data.linz.govt.nz/set/4749-landonline-titles-dataset/) | Title
[Landonline: Title Memorials Dataset](https://data.linz.govt.nz/set/4748-landonline-title-memorials-dataset/) | Title Memorial

### Roads and Addresses dataset model
Roads and address datasets were removed from Landonline in mid-2017. The new datasets and supporting data dictionaries, populated from LINZ’s new Address Information Management System, can be found under the [Addressing Group on the LINZ Data Service](https://data.linz.govt.nz/group/addressing/data/). <br>

The Electorate Place dataset was deprecated in August 2016 and is no longer maintained. Please refer to the [NZ Geographic Board NZ Place Names dataset on the LINZ Data Service](https://data.linz.govt.nz/layer/51681) for place names data.


## Parcels Dataset Model
This dataset contains the parcel polygons and information directly related to them, e.g. appellation and legalisation.

![](parcels_dataset_model.png)

## Parcel Topology Dataset Model
This dataset contains the intermediate “building blocks” for parcel polygons.

![](parcel_topology_dataset_model.png)

## Survey Dataset Model
This dataset contains those tables related to survey documentation, including survey plan references.
![](survey_dataset_model.png)

## Marks, Nodes & Coordinates Dataset Model
This dataset focuses on the tables directly related to nodes and survey monuments (marks).
![](marks_nodes_coordinates_dataset_model.png)

## Survey Observations Dataset Model
This dataset relates to the survey observations stored in Landonline.
![](survey_observations_dataset_model.png)

## Adjustments Dataset Model
This dataset relates to survey and geodetic adjustments that have been carried out within Landonline.
![](adjustments_dataset_model.png)

## System / Shared Dataset Model
The tables in this dataset are generally small in size and typically those which are required by more than one dataset.
![](system_shared_dataset_model1.png)

![](system_shared_dataset_model2.png)

## Title Dataset Model
This dataset relates to the title information stored in Landonline.
![](title_dataset_model.png)

## Title Memorial Dataset Model
This dataset relates to the title memorial information stored in Landonline.
![](title_memorial_dataset_model.png)

# Data Dictionary: Introduction
### Landonline table extracts

Entire Landonline tables views are extracted, with a LINZ Data Service table or layer being created for each table view. Consequently, the data covers the entire country. In the LINZ Data Service, spatial layers can be downloaded in their entirety or be clipped to pre-defined or customer-determined extents. Tables can be filtered client side. <br>

Table views are used to enable filtering of fields that may be considered inappropriate for public release, for example fields that may contain data that is considered confidential, commercially sensitive, or have system security implications. Some data in the Title and Title Memorial datasets, protected under section 107 Domestic Violence Act 1995, has been excluded from the Full Landonline Dataset. <br>

This document lists each Landonline table view that is available on the LDS together with a description of the data elements that are extracted.

### Official names

The New Zealand Geographic Board (Ngā Pou Taunaha o Aotearoa) Act 2008 requires official geographic names to be used in all official documents, unless it clearly states that the name shown is not an official geographic name. In ASCII based systems (this includes Landonline), some official names are not able to be displayed correctly as they contain macrons. <br>

To ensure that the data is compliant with the Act, official place names that should have macrons will be uniquely identified by appending "[Spelling not official]" to the affected name record. The name field in the Elect Place, Feature Name and Stat Act Parcel layers are impacted by this requirement. Additionally, the name field in the Road Name layer is impacted due to official railway line names.

## Action [(https://data.linz.govt.nz/table/51702)](https://data.linz.govt.nz/table/51702)
### Description:
Instruments can be made up of one or more actions.
Actions are used to perform the actual operations of titles transactions.

__Data Element__   | __Type (max. size)__   | __Required__   | __Notes__
:------------|:-----------|:-------|:---------------------------------------
__*AUDIT_ID*__     | INTEGER                | Yes            | Id used to link to the associated audit details. (Primary Key)
__TIN_ID__         | INTEGER                | Yes            | The instrument the action belongs to. <br> The instrument id is also included in the primary in all foreign keys from the action table. (FK)
__ID__             | INTEGER                | Yes            | Unique Identifier
SEQUENCE           | INTEGER                | Yes            | The sequence of the action within the instrument
ATT_TYPE           | VARCHAR(4)             | Yes            | The type of the action that describes the operations that the action can perform. (FK)
SYSTEM_ACTION      | CHAR(1)                | Yes            | Whether the current action was created internally by CRS or created explicitly by the user. This is only set to "Yes" by new titles instruments as part of a "copy down" operation.
ACT_ID_ORIG        | INTEGER                | No             | The id of the existing action that the current action affects. <br> Used by the data entry screens in the Receive Registration subsystem when a new action alters or removes the data created by another "original" action. (FK)
ACT_TIN_ID_ORIG    | INTEGER                | No             | The id of the existing instrument that the current action affects. <br> Used by the data entry screens in the Receive Registration subsystem when a new action alters or removes the data created by another "original" instrument and action. (FK)
STE_ID             | INTEGER                | No             | The id of the statute that is associated with this particular action. <br> This column is used to populate variables in memorial templates for the action. (FK)
MODE               | VARCHAR(4)             | No             | Window mode for the Modify Encumbrance screen. This column will only be used by CRR_S11 - Modify Encumbrance. See Reference Code group ACTM for valid values.
FLAGS              | VARCHAR(4)             | No             | A general purpose column to store state during processing of the action.
SOURCE             | INTEGER                | Yes            | Default: 1

### Relationships

 __Parent Entity__ | __Child Entity__ | __Relating Parent Attribute__ | __Relating Child Attribute__
:-----------------|:---------------|:-----------------------------|:----------------------------
Action             | Action           | TIN_ID <br> ID            | ACT_TIN_ID_ORIG <br> ACT_ID_ORIG
Action             | Appellation      | TIN_ID <br> ID            | ACT_TIN_ID_CRT <br> ACT_ID_CRT
Action             | Appellation      | TIN_ID <br> ID            | ACT_TIN_ID_EXT <br> ACT_ID_EXT
Acton              | Title Action     | TIN_ID <br> ID            | ACT_TIN_ID <br> ACT_ID
Action             | Title Memorial   | TIN_ID <br> ID            | ACT_TIN_ID_CRT <br> ACT_ID_CRT
Action             | Title Memorial   | TIN_ID <br> ID            | ACT_TIN_ID_EXT <br> ACT_ID_EXT
Action             | Title Memorial   | TIN_ID <br> ID            | ACT_TIN_ID_ORIG <br> ACT_ID_ORIG
Action Type        | Action           | TYPE                          | ATT_TYPE
Statute            | Action           | ID                            | STE_ID
Title Instrument   | Action           | ID                            | TIN_ID

## Action Type [(https://data.linz.govt.nz/table/51728)](https://data.linz.govt.nz/table/51728)
### Description:
Instruments can be made up of one or more actions. Actions are used to perform the actual operations of titles transactions.
This table contains all the valid action types.

__Data Element__   | __Type (max. size)__   | __Required__   | __Notes__
:------------|:-----------|:-------|:---------------------------------------
__*AUDIT_ID*__     | INTEGER                | Yes            | Id used to link to the associated audit details. (Primary Key)
__TYPE__           | VARCHAR(4)             | Yes            | The code for the action type.
DESCRIPTION        | VARCHAR(200)           | Yes            | The description for the action type.
SYSTEM_ACTION      | CHAR(1)                | Yes            | Flag to indicate if the action type can be manually assigned to an instrument in Receive Registration by a user (eg, Modify Proprietor), or if it is an action that can be allocated by the system only.
SOB_NAME           | VARCHAR(50)            | No             | The name of the window in Receive Registration that should be opened to allow the entry of structured data for this action type. (FK)
EXISTING_INST      | CHAR(1)                | Yes            | This column is used in the CRR_S04 Instrument Detail screen to determine whether or not an existing instrument can or should be entered for the action type. <br> Valid values are: <br> Y - Yes - existing instrument is mandatory for the action. <br> N - No - existing instrument should not be entered for the action <br> O - Optional - existing instrument may be entered for the action, but it is not mandatory

### Relationships

 __Parent Entity__ | __Child Entity__ | __Relating Parent Attribute__ | __Relating Child Attribute__
:-----------------|:---------------|:-----------------------------|:----------------------------
Action Type        | Action           | TYPE                          | ATT_TYPE

## Adjustment Coefficient [(https://data.linz.govt.nz/table/51704)](https://data.linz.govt.nz/table/51704)
### Description:
Adjustment Coefficient is a set of control parameters used by an Adjustment Method in the Generate Coordinate/Adjustment process.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier. (Primary Key)
ADM_ID             | INTEGER                | The adjustment method that the coefficient relates to.
DEFAULT_VALUE      | VARCHAR(255)           | Default parameter passed to adjustment program.
DESCRIPTION        | VARCHAR(100)           | Description of the Adjustment Coefficient.
SEQUENCE           | INTEGER                | Order that the coefficients belong in. This is used to ensure parameters are always passed in the right order.
COEF_CODE          | VARCHAR(4)             | Adjustment Coefficient Code eg <br> -  Bearing Swing <br> -  Convergence Tolerance <br> -  Adjustment Operating Mode <br> -  Max Allowable coordinate change <br> Refer Sys Code Group ADCC for valid values.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Adjustment Method [(https://data.linz.govt.nz/table/51705)](https://data.linz.govt.nz/table/51705)
### Description:
Adjustment Method contains information concerning the type of software and procedures used to adjust the parcel fabric.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the adjustment method. (Primary Key)
STATUS             | VARCHAR(4)             | Status of the adjustment method eg Authoritative, Decommissioned or Provisional. <br> Refer Sys Code Group ADMS for valid values.
SOFTWARE_USED      | VARCHAR(4)             | Software used to perform the adjustment. <br> Refer Sys Code Group ADMU for valid values.
TYPE               | VARCHAR(4)             | The type of Adjustment eg Horizontal, Vertical etc. <br> Refer Sys Code Group ADMT for valid values.
NAME               | VARCHAR(30)            | Name of the adjustment method
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
DESCRIPTION        | VARCHAR(100)           | Description of the adjustment method

## Adjustment Run [(https://data.linz.govt.nz/table/51981)](https://data.linz.govt.nz/table/51981)
### Description:
An Adjustment is a mathematical process of generating corrections to Reduced Observations and Coordinates to generate a consistent set of adjusted Coordinates and adjusted Reduced Observations. <br>
The adjusted Reduced Observations are able to be re-generated from the adjusted Coordinates and are therefore not retained. <br>
Inputs are, Reduced Observations, Observation Accuracy, Coordinates and constraints which are defined by Adjustment Method and Adjustment Coefficients. The primary outputs are adjusted Coordinates, Coordinate Accuracy (again in the form of a VCV matrix) and identification of suspect Reduced Observations. <br>
The Adjustment entity contains information about the network adjustment process including, the type of adjustment model used, constraints applied, source, etc.

__Data Element__   | __Type (max. size)__   | __Notes__
:--------------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the adjustment run. (Primary Key)
ADM_ID             | INTEGER                | Adjustment Method used for this run.
COS_ID             | INTEGER                | Coordinate system that the adjustment was performed in.
STATUS             | VARCHAR(4)             | The status of the Adjustment eg Failed, Provisional, Accepted, Authoritative. <br> Refer Sys Code Group ADJS for valid values.
USR_ID_EXEC        | VARCHAR(20)            | User that last ran the adjustment. Defaults to the user that creates the adjustment
ADJUST_DATETIME    | DATETIME               | Timestamp of when the adjustment was run.
DESCRIPTION        | VARCHAR(100)           | Description of the adjustment run.
SUM_SQRD_RESIDUALS | DECIMAL(22,12)         | The weighted sum of squared residuals from the adjustment. <br> With the redundancy this provides an indication of how consistent the data is and how well it fits the fixed coordinates in the adjustment.
REDUNDANCY         | DECIMAL(22,12)         | The redundancy of the adjustment is the number of independent observations - generally the total number of observations minus the number of ordinates and other parameters computed.
WRK_ID             | INTEGER                | Work id that created the adjustment run through authorise survey process.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.


## Adjustment User Coefficient [(https://data.linz.govt.nz/table/51703)](https://data.linz.govt.nz/table/51703)
### Description:
This entity is used to override the default values for an adjustment run.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__ADC_ID__         | INTEGER                | The adjustment coefficient that was overridden.
__ADJ_ID__         | INTEGER                | The adjustment run that the coefficient relates to.
VALUE              | VARCHAR(255)           | Value of the coefficient
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Adoption [(https://data.linz.govt.nz/table/51706)](https://data.linz.govt.nz/table/51706)
### Description:
This entity stores the relationship between an observation element and the original observation element that the value was adopted from. <br>
The adoption link has been made at the observation element level to allow for combinations of measured, calculated and adopted values for one observation.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*OBN_ID_NEW*__   | INTEGER                | Newly adopted observation id (Primary Key)
OBN_ID_ORIG        | INTEGER                | Original observation id that this adoption is taken from. This is optional as the original observation may not exist in CRS.
SUR_WRK_ID_ORIG    | INTEGER                | The survey that the original observation has been adopted from.
FACTOR_1           | DECIMAL(22,12)         | This is the factor that the adopted value has been altered by. For Distances the factor is multiplied by the original value. For bearings the factor is added.
FACTOR_2           | DECIMAL(22,12)         | This is the factor that the adopted value has been altered by. For Distances the factor is multiplied by the original value. For bearings the factor is added.
FACTOR_3           | DECIMAL(22,12)         | This is the factor that the adopted value has been altered by. For Distances the factor is multiplied by the original value. For bearings the factor is added.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Affected Parcel [(https://data.linz.govt.nz/table/51707)](https://data.linz.govt.nz/table/51707)
### Description:
An Affected Parcel is a Parcel which is affected by the approval of a survey dataset, including any parcels created by the approval of that survey dataset. <br>
This entity is used to describe the relationship between surveys and parcels.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__SUR_WRK_ID__     | INTEGER                | Work id of survey this parcel was affected by
__PAR_ID__         | INTEGER                | Identifier of the parcel that was affected by the survey.
ACTION             | VARCHAR(4)             | A parcel may be affected, created or extinguished by the approval of a Survey Dataset. For example, a survey can affect extinguish parcels by rendering them historical and at the same time may create new parcels (subdivision). Parcels may be affected by a survey but remain current (definition of an easement etc). <br> Refer Sys Code Group AFPT for valid values.
__*AUDIT_ID*__     | INTEGER | Id used to link to the associated audit details. (Primary Key)

## Alias [(https://data.linz.govt.nz/table/51982)](https://data.linz.govt.nz/table/51982)
### Description:
Individual registered owners may have one or more alternate names or aliases. This entity stores all of the alternate names used by an individual registered owner. Corporate owners can not have aliases.<br>
__IMPORTANT__: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the [LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
__Please ensure your use of this data does not breach any conditions of the Act.__

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for an alias (Primary Key)
PRP_ID             | INTEGER                | Identifier of the registered owner whose alias this is.
SURNAME            | VARCHAR(100)           | The surname of an alias for a registered owner.
OTHER_NAMES        | VARCHAR(100)           | The first and subsequent names of an alias for a registered owner.

## Appellation [(https://data.linz.govt.nz/table/51590)](https://data.linz.govt.nz/table/51590)
### Description:
Appellations are the textual descriptions that describe a parcel. <br>
Every parcel must have at least one appellation.

__Data Element__   | __Type (max. size)__   | __Notes__
:--------------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | The unique identifier for the appellation. (Primary Key)
PAR_ID             | INTEGER                | The parcel the appellation belongs to.
TYPE               | VARCHAR(4)             | The type of appellation eg Maori, General or Other. <br> Refer Sys Code Group APPT for valid values.
TITLE              | CHAR(1)                | Specifies if the appellation is valid in the titles context. <br> Valid values are "Y" or "N".
SURVEY             | CHAR(1)                | Specifies if the appellation is valid in the survey context. <br> Valid values are "Y" or "N".
STATUS             | VARCHAR(4)             | The current status of the appellation. <br> Refer Sys Code Group APPS for valid values.
PART_INDICATOR     | VARCHAR(4)             | An indicator that the parcel exists only as to part. <br> Refer Sys Code Group APPI for valid values.
MAORI_NAME         | VARCHAR(100)           | Valid for Maori type appellations. The name of the maori block.
SUB_TYPE           | VARCHAR(4)             | Valid for General type appellations. The sub-type of appellation used to describe the land (e.g. Deposited Plan, Survey Office Plan, Survey District, Town, etc). <br> Valid for Maori type appellations. The plan type for a maori appellation, if applicable. <br> Refer Sys Code Group ASAU for valid values.
APPELLATION_VALUE  | VARCHAR(60)            | Valid for General type appellations. The name or number which is associated with the appellation type (e.g., the name of the town or the number of the deposited plan). <br> Valid for Maori type appellations. The number of the plan for a maori appellation, if applicable.
PARCEL_TYPE        | VARCHAR(4)             | Valid for General type appellations. The type of parcel used to describe the land (e.g. Lot on a deposited plan, Section on a survey office plan, etc). <br> Refer Sys Code Group ASAP for valid values.
PARCEL_VALUE       | VARCHAR(60)            | Valid for General type appellations. The letter or number which is associated with the parcel type (e.g., '1' in Lot 1, '2' in Section 2 or 'C' in Flat C). <br> Valid for Maori type appellations. The identifier for a Maori block.
SECOND_PARCEL_TYPE | VARCHAR(4)             | Valid for General type appellations. The type of parcel where a secondary parcel type exists (e.g., "Section" in Lot 1 of Section 2). <br> Refer Sys Code Group ASAP for valid values.
SECOND_PRCL_VALUE  | VARCHAR(60)            | Valid for General type appellations. The letter or number which is associated with a second parcel type (e.g., "2" in Lot 1 of Section 2).
BLOCK_NUMBER       | VARCHAR(15)            | Valid for General type appellations. The Block number associated with the parcel.
SUB_TYPE_POSITION  | VARCHAR(4)             | Valid for General type appellations. Indicates whether an 'appellation type' is either a suffix or a prefix to an 'appellation value'. <br> Refer Sys Code Group AGNP for valid values.
ACT_ID_CRT         | INTEGER                | For titles appellations - the identifier of the action creating the new titles appellation. This will make the appellation current when the instrument the action belongs to is registered.
ACT_TIN_ID_CRT     | INTEGER                | For titles appellations - the identifier of the instrument creating the new titles appellation. This will make the appellation current when the instrument is registered.
ACT_ID_EXT         | INTEGER                | For titles appellations - the identifier of the action extinguishing the appellation. This will make the appellation historic when the instrument the action belongs to is registered.
ACT_TIN_ID_EXT     | INTEGER                | For titles appellations - the identifier of the instrument extinguishing the appellation. This will make the appellation historic when the instrument is registered.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
OTHER_APPELLATION  | VARCHAR(2048)          | Valid for Other type appellations. The text of a non-standard appellation.

## Comprised In [(https://data.linz.govt.nz/table/51708)](https://data.linz.govt.nz/table/51708)
### Description:
This entity contains references entered to show what the area under survey is comprised in.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the coordinate. (Primary Key)
WRK_ID             | INTEGER                | Work id that the reference is captured for.
TYPE               | VARCHAR(4)             | Type of reference, either gazette notice (GNOT) or title (TITL).
REFERENCE          | VARCHAR(20)            | The reference entered by the Plan Capture person. If type is title, the reference should relate to a CRS title number. Gazette notice references should be the title number if the gazette is registered, otherwise the gazette notice legality description.
LIMITED            | CHAR(1)                | Flag to signify, if the reference is a title, that the State guarantee relating to a title is either fully guaranteed or "Limited as to parcels".

## Coordinate [(https://data.linz.govt.nz/table/52018)](https://data.linz.govt.nz/table/52018)
### Description:
A set of numbers which define the position of a node relative to a coordinate system. <br>
Coordinates are either system derived or obtained from an authoritative source. The form of the coordinates (polar, Cartesian, etc.) depends on the Coordinate Type assigned to a coordinate system. <br>
Coordinates of nodes are usually derived from a network adjustment of reduced survey observations. <br>
The authoritative coordinate values of a node or mark will update from time to time as new survey data is received and incorporated into the system. <br>
Coordinates can be transformed, to be held in different coordinate systems, or adjusted to represent an improvement in the positional accuracy of a node.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the coordinate. (Primary Key)
COS_ID             | INTEGER                | Coordinate system id that the coordinate is defined in.
NOD_ID             | INTEGER                | Node id that this coordinate is for.
ORT_TYPE_1         | VARCHAR(4)             | Code to uniquely identify an ordinate type.
ORT_TYPE_2         | VARCHAR(4)             | Code to uniquely identify an ordinate type.
ORT_TYPE_3         | VARCHAR(4)             | Code to uniquely identify an ordinate type.
STATUS             | VARCHAR(4)             | Status (Pending, Provisional, Authoritative, Decommissioned) <br> Refer Sys Code Group COOS for valid values.
SDC_STATUS         | CHAR(1)                | Indicates that the coordinates have been approved as Survey-accurate Digital Cadastre (SDC) coordinates <br> Valid values are "Y" or "N".
SOURCE             | VARCHAR(4)             | Source of coordinate. <br> Refer Sys Code Group COOU for valid values.
VALUE1             | DECIMAL(22,12)         | The first ordinate value of the coordinate.
VALUE2             | DECIMAL(22,12)         | The second ordinate value of the coordinate.
VALUE3             | DECIMAL(22,12)         | The third ordinate value of the coordinate.
WRK_ID_CREATED     | INTEGER                | The work that created this coordinate in CRS
COR_ID             | INTEGER                | Link to coordinate order
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Coordinate Order [(https://data.linz.govt.nz/table/51712)](https://data.linz.govt.nz/table/51712)
### Description:
This entity contains all of the valid geodetic orders used to define the relative accuracy of coordinates.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the geodetic order. (Primary Key)
DISPLAY            | VARCHAR(4)             | Value displayed on screen
DESCRIPTION        | VARCHAR(100)           | Description of the order
DTM_ID             | INTEGER                | Datum this order belongs to
ORDER_GROUP        | SMALLINT               | Group of order within datum for spatial window display purposes. <br> Allows for multiple Nth order co-ordinates to easily exist in the same layer.
ERROR              | DECIMAL(12,4)          | Defines the approximate error of coordinates of this order.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Coordinate Precision [(https://data.linz.govt.nz/table/51711)](https://data.linz.govt.nz/table/51711)
### Description:
This defines the precision of coordinates that will be displayed depending on the order of the coordinate. <br>
If a record does not exist for a coordinate order/ordinate type combination the default format mask for the ordinate type will be used.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__COR_ID__         | INTEGER                | The coordinate order that the precision relates to.
__ORT_TYPE__       | VARCHAR(4)             | The ordinate type that the precision relates to.
DECIMAL_PLACES     | SMALLINT               | The number of decimal places to be displayed.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Coordinate System [(https://data.linz.govt.nz/table/51709)](https://data.linz.govt.nz/table/51709)
### Description:
An associate entity that resolves the many-to - many relationships between Datum and Coordinate Type. <br>
Coordinates are expressed in terms of a Coordinate System. For example, Coordinates may be expressed as latitude and longitude (a Coordinate Type) on New Zealand Geodetic Datum 1949 (a Datum). <br>
Transformations operate between Coordinate Systems. For example, a transformation may relate Cartesian Coordinates on NZGD49 to Cartesian Coordinates on WGS84.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the coordinate system. (Primary Key)
COT_ID             | INTEGER                | Coordinate type id specifies the format of the coordinates in this coordinate system
DTM_ID             | INTEGER                | Datum of this coordinate system
COS_ID_ADJUST      | INTEGER                | Id of the coordinate system that will be used for automatic adjustments when the survey was performed within this coordinate system.
NAME               | VARCHAR(100)           | Name of the coordinate system. e.g. Geodetic 1949 (28 Meridional Circuits); Old Cadastral (28 Meridional Circuits ); New Zealand Map Grid; WGS84 etc.
INITIAL_STA_NAME   | VARCHAR(100)           | Coordinates can be expressed in terms of various origin points or Initial Stations. These initial stations (nodes) may have false values.
CODE               | VARCHAR(10)            | Unique code used by external systems to reference a Coordinate System.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Coordinate Type [(https://data.linz.govt.nz/table/51710)](https://data.linz.govt.nz/table/51710)
### Description:
This entity contains information about the different forms that coordinates can take within a datum. <br>
For example, Geocentric Cartesian (X, Y, Z); Topocentric Cartesian (East, North, Up): Geodetic (Latitude, Longitude) or (Latitude, Longitude, Height), Astronomic (Latitude, Longitude) Projection (North, East) in various projections, Orthometric Height, Ellipsoidal Height, Geoid Height, Gravitational Potential, etc.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the coordinate type. (Primary Key)
NAME               | VARCHAR(100)           | Name of the coordinate type.
STATUS             | VARCHAR(4)             | Status of the coordinate type eg Provisional, Authoritative or Decommissioned. <br> Refer Sys Code Group COTS for valid values
ORT_TYPE_1         | VARCHAR(4)             | Code to uniquely identify an ordinate type.
ORT_TYPE_2         | VARCHAR(4)             | Code to uniquely identify an ordinate type.
ORT_TYPE_3         | VARCHAR(4)             | Code to uniquely identify an ordinate type.
CATEGORY           | VARCHAR(4)             | Type (Projection, Ellipsoidal, Cartesian, Orthometric Height) <br> Refer Sys Code Group COTC for valid values
DIMENSION          | VARCHAR(4)             | Dimension (Three dimensional, Horizontal, Height). <br> Refer Sys Code Group COTD for valid values
ORD_1_MIN          | DECIMAL(22,12)         | Min and Max values for each coordinate type (e.g. Latitude -180 degrees to 180 degrees etc)
ORD_1_MAX          | DECIMAL(22,12)         | Min and Max values for each coordinate type (e.g. Latitude -180 degrees to 180 degrees etc)
ORD_2_MIN          | DECIMAL(22,12)         | Min and Max values for each coordinate type (e.g. Latitude -180 degrees to 180 degrees etc)
ORD_2_MAX          | DECIMAL(22,12)         | Min and Max values for each coordinate type (e.g. Latitude -180 degrees to 180 degrees etc)
ORD_3_MIN          | DECIMAL(22,12)         | Min and Max values for each coordinate type (e.g. Latitude -180 degrees to 180 degrees etc)
ORD_3_MAX          | DECIMAL(22,12)         | Min and Max values for each coordinate type (e.g. Latitude -180 degrees to 180 degrees etc)
DATA               | VARCHAR(4)             | Data / Parameters which are operated on by Processes <br> Refer Sys Code Group COTA for valid values.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Datum [(https://data.linz.govt.nz/table/51713)](https://data.linz.govt.nz/table/51713)
### Description:
A Datum is a complete system for enabling Coordinates to be assigned to Nodes. A datum is prescribed by the appropriate authority from which it derives its validity. <br>
All Coordinates will be in terms of a Datum. <br>
A Datum also provides a spatial standard for the alignment of Reduced Observations via a Datum Calibration. Most Reduced Observations are Datum dependent but there are specific Reduced Observation types which are Datum independent. <br>
The Datum entity contains information about the official geodetic Datum used in Land Information NZ databases and other important Datum's used to spatially reference source data (e.g.. Reduced Observations) or output data or products (e.g.. Coordinates, Digital Cadastral Database, topographic maps, hydrographic charts, etc). <br>
The Datum entity includes objects which, strictly, are reference frames rather than datum's but the distinction is a fine technical point which is of no great consequence. <br>
The Datum entity includes vertical reference surfaces such as leveling datum's, various tidal surfaces including Mean Sea Level, the geoid, datum ellipsoids, etc. <br>
For a Datum to maintain accuracy over a significant area it must be geodetic. Examples of non-geodetic datum's are the Old Cadastral Datum's. These do not account for the curvature of the earth and therefore can only maintain accuracy over a limited part of the earth's surface.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the datum. (Primary Key)
NAME               | VARCHAR(100)           | These may apply to local or regional areas or global. As a consequence various names can be attached.
TYPE               | VARCHAR(4)             | Describes what principles have been used to formulate the Datum. <br> Refer Sys Code Group DTMT for valid values
DIMENSION          | VARCHAR(4)             | Number of dimensions in the Datum. <br> Refer Sys Code Group DTMD for valid values
REF_DATETIME       | DATETIME               | Date of reference epoch (often the same as date of definition but can be different for a dynamic Datum)
STATUS             | VARCHAR(4)             | Status (provisional/authoritative/decommissioned) <br> Refer Sys Code Group DTMS for valid values
ELP_ID             | INTEGER                | The ellipsoid represents the curvature of the datum to match the curvature of the earth
REF_DATUM_CODE     | VARCHAR(4)             | For each dimension only one reference datum should exist. All other datum’s should have a transformation to and from the reference datum. <br> Refer Sys Code Group DTMR for valid values.
CODE               | VARCHAR(10)            | Unique code used by external systems to reference a Datum.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated details.

## Ellipsoid [(https://data.linz.govt.nz/table/51715)](https://data.linz.govt.nz/table/51715)
### Description:
Details of ellipsoid used for a datum. <br>
The ellipsoid represents the curvature of the datum to match the curvature of the earth.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of the ellipsoid. (Primary Key)
NAME               | VARCHAR(100)           | Name of the ellipsoid.
SEMI_MAJOR_AXIS    | DECIMAL(22,12)         | Value of the semi major axis.
FLATTENING         | DECIMAL(22,12)         | Value of the flattening axis.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Encumbrance [(https://data.linz.govt.nz/table/51984)](https://data.linz.govt.nz/table/51984)
### Description:
An encumbrance is an interest in the land (eg, mortgage, lease).

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the encumbrance. (Primary Key)
STATUS             | VARCHAR(4)             | The status of the encumbrance. <br> Refer Sys Code Group TSDS for valid values
ACT_TIN_ID_ORIG    | INTEGER                | The id of the instrument that originally created the encumbrance. <br> (Note : this is not the abstract number)
ACT_TIN_ID_CRT     | INTEGER                | The id of the instrument that created the encumbrance row.
ACT_ID_ORIG        | INTEGER                | The id of the action that originally created the encumbrance.
ACT_ID_CRT         | INTEGER                | The id of the action that created the encumbrance row.
TERM               | VARCHAR(250)           | The term of the encumbrance, if applicable.

## Encumbrance Share [(https://data.linz.govt.nz/table/51983)](https://data.linz.govt.nz/table/51983)
### Description:
This entity groups the shares in an encumbrance. It is not the actual share value.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
ENC_ID             | INTEGER                | The encumbrance the encumbrance share exists for.
__*ID*__           | INTEGER                | A unique identifier for the encumbrance share. (Primary Key)
STATUS             | VARCHAR(4)             | The status of the encumbrance share. <br> Refer Sys Code Group TSDS for valid values
ACT_TIN_ID_CRT     | INTEGER                | The id of the instrument that created the encumbrance share.
ACT_ID_CRT         | INTEGER                | The id of the action that created the encumbrance share.
SYSTEM_CRT         | CHAR(1)                | This field will indicate if an encumbrance share has been created as as part of a copy down operation. <br> It will be set to 'Y'es if the encumbrance share was created by copying down another encumbrance share simply to change the details. <br> It will be set to 'N'o if the encumbrance share was actually created from scratch by the user.

## Encumbrancee [(https://data.linz.govt.nz/table/51985)](https://data.linz.govt.nz/table/51985)
### Description:
An encumbrance on a title may be owned by one or more encumbrancees (whether an encumbrancee exists or not depends on the type of encumbrance). A lease does not have an encumbrancee because a Computer Interest Register is issued for the leasehold estate. <br>
An encumbrancee has an interest in a share in an encumbrance. <br>
__IMPORTANT__: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the [LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
__Please ensure your use of this data does not breach any conditions of the Act.__

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
ENS_ID             | INTEGER                | The encumbrance share the encumbrancee belongs to.
__*ID*__           | INTEGER                | The unique identifier for the encumbrancee. (Primary Key)
STATUS             | VARCHAR(4)             | The status of the encumbrancee. <br> Refer Sys Code Group TSDS for valid values
NAME               | VARCHAR(255)           | The name of the encumbrancee. <br> Names of corporate encumbrancees, and the surnames, other names and alias’s of individual encumbrancees are all held in this one attribute.

## Estate Share [(https://data.linz.govt.nz/table/52065)](https://data.linz.govt.nz/table/52065)
### Description:
An estate may be owned in shares by registered owners. For example Marian and Anne may each own a 1/2 share in the land. This table contains one row for each share that exists in an estate. <br>
__IMPORTANT__: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the [LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
__Please ensure your use of this data does not breach any conditions of the Act.__

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
ETT_ID             | INTEGER                | The title estate that this estate share is part of.
__*ID*__           | INTEGER                | The unique identifier for the estate. (Primary Key)
STATUS             | VARCHAR(4)             | Status of the estate share. <br> See Reference Code Group TSDS for valid values
SHARE              | VARCHAR(100)           | The value of the share. If tenants in common exist on a title, they will be stored as separate estate shares. A value needs to be given to each of the shares. Generally the value of all the estate shares in an estate will add up to one (but this is not always the case with Maori titles).
ACT_TIN_ID_CRT     | INTEGER                | The id of the instrument that created the new estate share.
ORIGINAL_FLAG      | CHAR(1)                | This flag is set to "Y" if this share was one of the original shares on the title. This is required for printing the historic view of the title which shows the original header data.
SYSTEM_CRT         | CHAR(1)                | This field will indicate if an estate share has been created as as part of a copy down operation. It will be set to 'Y'es if an estate share was created by copying down another estate share simply to change the details. It will be set to 'N'o if the estate share was actually created by the user.
EXECUTORSHIP       | VARCHAR(4)             | If the share is held by an executor, this will contain the type of executorship. Examples of executorship are when a person owns a share as an administrator or as the executor of a will. See Reference Code Group ETSE for valid values.
ACT_ID_CRT         | INTEGER                | The id of the action that created the new estate share.
SHARE_MEMORIAL     | VARCHAR(17500)         | Each estate share is displayed on a separate line on the title view. This description for the estate share is automatically generated from the attributes of the estate share and the names of the registered owners and their aliases. If there are not enough details stored as structured data to generate this description, it can be manually entered and stored in this attribute. Examples of when this will be required are for certain societies and minors, where the society name or the minor's date of birth is also needed to be displayed.

## Feature Name Point [(https://data.linz.govt.nz/layer/52017)](https://data.linz.govt.nz/layer/52017)
### Description:
This entity stores names associated with features and includes Streams, Rivers, Mountains, etc. <br>
Its main functions are the storage of place name points from NZTopo to enable ad-hoc spatial searches within Landonline, and the storage of hydrographic polygons.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | The unique identifier for the feature name. (Primary Key)
TYPE               | VARCHAR(4)             | The type of feature. Road, River, Stream, Mountain, Railway etc. <br> Refer Sys Code Group FENT for valid values. <br> Warning: Features with a Sys code of "NZPN" are intended for use as context or locational data, and are replaced every few months with data extracted from the NZTopo database.
NAME               | VARCHAR(100)           | Name of the feature. This may not be unique for a feature type. <br> Note : a name that requires a macron will be shown without the macron and have “ [Spelling not official]” appended to the name. See Section 1.1 Introduction.
STATUS             | VARCHAR(4)             | Status of the record. <br> Refer Sys Code Group FENS for valid values.
OTHER_DETAILS      | VARCHAR(100)           | Other details associated with a feature name such as suburb, location etc. This is used to assist in identifying features  ith the same name. <br> For NZPN entries, this field will be populated with information about the named feature and the date it was extracted from the NZTopo database eg “ISLD - NZTopo geoname 07 May 09”.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
SHAPE              | GEOMETRY(POINT)        | Spatial definition of the feature.

## Feature Name Polygon [(https://data.linz.govt.nz/layer/52016)](https://data.linz.govt.nz/layer/52016)
### Description:
This entity stores names associated with features and includes Streams, Rivers, Mountains, etc. <br>
Its main functions are the storage of place name points from NZTopo to enable ad-hoc spatial searches within Landonline, and the storage of hydrographic polygons.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:--------------|:-----------------------------------
__*ID*__           | INTEGER                | The unique identifier for the feature name. (Primary Key)
TYPE               | VARCHAR(4)             | The type of feature. Road, River, Stream, Mountain, Railway etc. <br> Refer Sys Code Group FENT for valid values. <br> Warning: Features with a Sys code of "NZPN" are intended for use as context or locational data, and are replaced every few months with data extracted from the NZTopo database.
NAME               | VARCHAR(100)           | Name of the feature. This may not be unique for a feature type.<br> Note : a name that requires a macron will be shown without the macron and have “ [Spelling not official]” appended to the name. See Section 1.1 Introduction.
STATUS             | VARCHAR(4)             | Status of the record. <br> Refer Sys Code Group FENS for valid values.
OTHER_DETAILS      | VARCHAR(100)           | Other details associated with a feature name such as suburb, location etc. This is used to assist in identifying features with the same name. <br> For NZPN entries, this field will be populated with information about the named feature and the date it was extracted from the NZTopo database eg “ISLD - NZTopo geoname 07 May 09”.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
SHAPE              | GEOMETRY(POLYGON)      | Spatial definition of the feature.

## Land District [(https://data.linz.govt.nz/layer/52070)](https://data.linz.govt.nz/layer/52070)
### Description:
This entity contains all of the land districts in New Zealand

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:--------------|:-----------------------------------
__*LOC_ID*__       | INTEGER                | The land district id. (Primary Key)
OFF_CODE           | VARCHAR(4)             | The office the land district belongs to.
DEFAULT            | CHAR(1)                | Specifies if this land district is the default for the corresponding office.
SHAPE              | GEOMETRY(POLYGON)      | The spatial definition of the land district.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (above).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
USR_TM_ID          | VARCHAR(20)            | Team Manager id used in workflowing request manual copy jobs to local unassigned queues (for internal LINZ use).


## Legal Description [(https://data.linz.govt.nz/table/51986)](https://data.linz.govt.nz/table/51986)
### Description:
A legal description is a grouping of parcels which is used to determine the textual legal description of a title, or a group of parcels in an easement.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | The unique identifier for the legal description. (Primary Key)
TYPE               | VARCHAR(4)             | The type of the legal description. It may be for an estate or an easement. <br> Refer Sys Code Group LGDT for valid values.
STATUS             | VARCHAR(4)             | The status of the legal description. <br> Refer Sys Code Group TSDS for valid values.
TTL_TITLE_NO       | VARCHAR(20)            | The title reference the legal description is for. This must always have a value for legal descriptions of type estate.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
TOTAL_AREA         | DECIMAL(22,12)         | Total area of the land contained within the legal description. The total area may not always be able to be determined on data conversion.
LEGAL_DESC_TEXT    | VARCHAR(2048)          | The textual description for the legal description <br> For estate types, it is derived from the appellations of the parcels that make up the legal description (generated by Landonline and not able to be edited). <br> For easement types, it can have either a value entered or be linked to some parcels.

## Legal Description Parcel [(https://data.linz.govt.nz/table/51717)](https://data.linz.govt.nz/table/51717)
### Description:
Contains the list of parcels for a particular legal description.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__LGD_ID__         | INTEGER                | The id of the legal description.
__PAR_ID__         | INTEGER                | The id of the parcel in the legal description.
SEQUENCE           | SMALLINT               | The sequence in which the parcel are ordered within the legal description. This will be used to determine the order to list the parcels in the legal description text.
PART_AFFECTED      | VARCHAR(4)             | Indicates if the legal description affects the whole parcel or only part of the parcel. <br> Refer Sys Code Group APPI for valid values.
SHARE              | VARCHAR(100)           | Indicates the share of the parcel contained in the legal description. This can only be used for accessory units in a timeshare or access lot titles. e.g., Unit Titles are made up of a primary unit and zero or more accessory units (e.g., a common piece of property such as a corridor) Shares in access lots should be represented as a share in a separate estate and therefore a separate legal description.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.
SUR_WRK_ID_CRT     | INTEGER                | Link to the survey that created a provisional allocation of parcels to a particular legal description (Survey WRK_ID)

## Line [(https://data.linz.govt.nz/layer/51975)](https://data.linz.govt.nz/layer/51975)
### Description:
A Line may be a surveyed or unsurveyed boundary line. It may also be a topographical feature, or both a topographical and a boundary feature.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | The unique identifier for the line. (Primary Key)
BOUNDARY           | CHAR(1)                | Indicates whether or not this line series is part of a boundary. <br> Valid values are "Y" or "N".
TYPE               | VARCHAR(4)             | Describes the type of line, either right or irregular <br> Valid values are "RGHT" or "IRRE" (Refer Sys Code Group LINT)
NOD_ID_END         | INTEGER                | The End node of the Line
NOD_ID_START       | INTEGER                | The Start node of the line.
ARC_RADIUS         | DECIMAL(22,12)         | The radius of the line. Set to null for straight and irregular lines.
ARC_DIRECTION      | VARCHAR(4)             | Whether the arc is drawn to the left or right of the line (direction of line is start node to end node). Refer Sys Code Group LIND for valid values.
ARC_LENGTH         | DECIMAL(22,12)         | Length of the arc between the two end nodes. This will assist in scaling the arc after adjustment etc.
PNX_ID_CREATED     | INTEGER                | The Parcel Network Transaction that created the line. This is used to enable topological data to be removed when a parcel is withdrawn.
DCDB_FEATURE       | VARCHAR(12)            | The DCDB feature code of the line as at conversion (not maintained).
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
DESCRIPTION        | VARCHAR(2048)          | Description of the natural boundary.
SHAPE              | GEOMETRY(LINE)         | Spatial representation of part of a parcel boundary

## Locality [(https://data.linz.govt.nz/layer/51718)](https://data.linz.govt.nz/layer/51718)
### Description:
This entity contains all localities used for searching and planning. <br>
The details within this entity have no legal aspects and are simply used for defining areas of interest.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:--------------|:-----------------------------------
__*ID*__           | INTEGER                | System generated id of the locality. (Primary Key)
TYPE               | VARCHAR(4)             | Type of Locality i.e. Land District, Network Area, Cell, Territorial Authority, Meridional Circuits Suburb, Town, etc.
NAME               | VARCHAR(100)           | Name of the Locality.
LOC_ID_PARENT      | INTEGER                | System generated id of the locality.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
SHAPE              | GEOMETRY(POLYGON)      |

## Maintenance [(https://data.linz.govt.nz/table/51988)](https://data.linz.govt.nz/table/51988)
### Description:
This entity defines the maintenance requirements for marks, mark beacons and mark protection.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__MRK_ID__         | INTEGER                | The mark id that the maintenance was performed on.
__TYPE__           | VARCHAR(4)             | Type of object eg Mark, Beacon, Protection. <br> Refer Sys Code Group MNTT for valid values
STATUS             | VARCHAR(4)             | Status of the maintenance eg Required, Complete etc.<br> Refer Sys Code Group MNTS for valid values
COMPLETE_DATE      | DATE                   | Date the last maintenance work was completed.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)
DESC               | VARCHAR(2048)          | Narrative description of the required maintenance

## Map Grid (Deprecated) [(https://data.linz.govt.nz/layer/51726)](https://data.linz.govt.nz/layer/51726)
### Description:
This layer was originally used to support electoral functionality within Landonline (Electoral Reports). This layer is no longer used for this purpose or maintained.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:--------------|:-----------------------------------
__MAJOR_GRID__     | VARCHAR(4)             | The major grid index identifying the 'map plate' that maps a particular section of New Zealand. e.g. R11, S18, A5, etc.
__MINOR_GRID__     | VARCHAR(4)             | The minor index grid reference which is currently 5000m by 7500m gridbox. The major index gridbox is divided into 8 minor grid boxes horizontally and 4 minor grid boxes vertically. e.g. 2.4, 6.1, 3.3, etc.
SHAPE              | GEOMETRY(POLYGON)      | The spatial representation of the minor index's gridboxes.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. <br> NB the geometry stored at this location has been extracted into the SHAPE data element (above).
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Mark [(https://data.linz.govt.nz/table/51989)](https://data.linz.govt.nz/table/51989)
### Description:
A Mark (MRK) is a physical monument placed for the purpose of being surveyed. A survey mark is a node which is occupied by a physical mark. <br>
This entity records the information that relates to mark type and maintenance. Marks connect Land Information NZ databases to the physical world and provide an infrastructure for other spatial systems such as topographic mapping, engineering, etc. <br>
Marks can be placed for a number of purposes e.g. geodetic, cadastral survey, boundary. (See Node)

__Data Element__   | __Type (max. size)__   | __Notes__
:--------------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | The unique identifier of a mark (Primary Key)
NOD_ID             | INTEGER                | The node id that this mark defines
STATUS             | VARCHAR(4)             | The internal status of the mark e.g. Provisional, Emplaced, Surveyed, Commissioned, Decommissioned. <br> Refer Sys Code Group MRKS for valid values
TYPE               | VARCHAR(4)             | Describes the physical composition of the type of mark placed as a monument as prescribed by Survey Regulations. <br> Refer Sys Code Group MRKT for valid values
CATEGORY           | VARCHAR(4)             | Mark Category(central, eccentric, reference) <br> Refer Sys Code Group MRKC for valid values
COUNTRY            | VARCHAR(4)             | Country that the mark exists in. <br> Refer Sys Code Group CTRY for valid values
BEACON_TYPE        | VARCHAR(4)             | The type of beacon <br> Refer Sys Code Group MRKE for valid values
PROTECTION_TYPE    | VARCHAR(4)             | The type of protection. <br> Refer Sys Code Group MRKR for valid values
MAINTENANCE_LEVEL  | VARCHAR(4)             | The level of maintenance required. <br> Refer Sys Code Group MRKM for valid values.
MRK_ID_DIST        | INTEGER                | The non disturbed version of this mark.
DISTURBED          | CHAR(1)                | Indicates if this mark is a disturbed mark. <br> Valid values are "Y" or "N".
DISTURBED_DATE     | DATETIME               | Date and time of disturbance.
MRK_ID_REPL        | INTEGER                | The mark id that this mark is replacing
REPLACED           | CHAR(1)                | Indicator that this mark replaces another mark <br> Valid values are "Y" or "N".
REPLACED_DATE      | DATETIME               | Date and time of replacement.
MARK_ANNOTATION    | VARCHAR(50)            | Extra comments recorded in CPC when a mark is disturbed or replaced
WRK_ID_CREATED     | INTEGER                | Work id that created the mark (required to remove the details of a work for re-submission).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
DESC               | VARCHAR(2048)          | A description of the physical details of the mark

## Mark Name [(https://data.linz.govt.nz/table/51991)](https://data.linz.govt.nz/table/51991)
### Description:
This entity contains the current name, geographic name and any alternative names associated with a mark. The geographic name of a mark refers to the official feature name in the Geographic Names database which may differ from the name of a mark which is emplaced on or near that feature. A mark may have several alternative names but only one current and geographical name should exist. <br>
When a mark is placed as part of a cadastral survey dataset (plan) its identity is in terms of the dataset series and ID number allocated and an abbreviated description of either the mark type or purpose. Marks can also be numbered in sequence in accordance with the mark type e.g. IS I DP 3456; IS II DP3456.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__MRK_ID__         | INTEGER                | The mark id that this name is associated with.
__TYPE__           | VARCHAR(4)             | The type of mark name, for example Current or Alternative. <br> Refer Sys Code Group MKNT for valid values
NAME               | VARCHAR(100)           | Name associated with a mark.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.

## Mark Physical State [(https://data.linz.govt.nz/table/51990)](https://data.linz.govt.nz/table/51990)
### Description:
This is used to identify the state of the mark, when and by what it was created.

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
__MRK_ID__         | INTEGER                | The mark id that has this associated state for a particular work.
__WRK_ID__         | INTEGER                | The work id that is associated with this mark.
__TYPE__           | VARCHAR(4)             | The type of physical work e.g. Mark,Beacon,Protection <br> Refer Sys Code Group MPST for valid values
CONDITION          | VARCHAR(4)             | The condition of the mark at the time of work e.g. Damaged, Not Found, Destroyed, Threatened, Dangerous, Reliable <br> Refer Sys Code Group MPSC for valid values
EXISTING_MARK      | CHAR(1)                | A flag indicating whether the mark is existing or created. <br> Valid values are "Y" or "N". (Y - existing, N - created)
STATUS             | VARCHAR(4)             | Is the condition Provisional, Current or Historical <br> Only one physical state for an object should be current at any one time. <br> Refer Sys Code Group MPSS for valid values.
REF_DATETIME       | DATETIME               | The date on which the condition of the object was defined.
PEND_MARK_STATUS   | VARCHAR(4)             | The mark status which is stored as pending until the associated work is approved and then updated into the associated mark entry. <br> Refer Sys Code Group MRKS for valid values.
PEND_REPLACED      | CHAR(1)                | The replaced flag which is stored as pending until the work is approved and then updated in the associated mark entry <br> Valid values are "Y" or "N".
PEND_DISTURBED     | CHAR(1)                | The disturbed flag which is stored as pending until the associated work is approved and then updated in the associated mark entry. <br> Valid values are "Y" or "N".
MRK_ID_PEND_REP    | INTEGER                | The mark the associated mark is going to replace which is stored as pending until the associated work is approved and then updated in the associated mark entry
MRK_ID_PEND_DIST   | INTEGER                | The non disturbed version of the associated disturbed mark which is stored as pending until the associated work is approved and then updated in the associated mark entry
PEND_DIST_DATE     | DATETIME               | This is the date that the associated mark is indicated as being disturbed and is stored as pending until the associated work is approved. It is then updated in the associated mark entry
PEND_REPL_DATE     | DATETIME               | The date that the associated mark is indicated that it is replacing another mark which is stored as pending until the associated work is approved and then updated in the associated mark entry
PEND_MARK_NAME     | VARCHAR(100)           | The mark name supplied for a mark that was captured from CPC
PEND_MARK_TYPE     | VARCHAR(4)             | The mark type supplied for a mark that was captured from CPC. <br> Refer Sys Code Group MRKT for valid values.
PEND_MARK_ANN      | VARCHAR(50)            | Extra comments recorded in CPC when a mark is disturbed or replaced
LATEST_CONDITION   | VARCHAR(4)             | The latest condition of the mark e.g. Damaged, Not Found, Destroyed, Threatened, Dangerous, Reliable <br> Refer Sys Code Group MPSC for valid values
LATEST_COND_DATE   | DATETIME               | The date that the latest condition of the mark was noted.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)
DESCRIPTION        | VARCHAR(2048)          | Further details relating to the condition of the mark

## Mark Supporting Document [(https://data.linz.govt.nz/table/51727)](https://data.linz.govt.nz/table/51727)
### Description:
Associative entity used to relate supporting documents to marks.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__MRK_ID__         | INTEGER                | The mark id that the document supports.
__SUD_ID__         | INTEGER                | The identification number of the supporting document. <br> The Supporting Document table (SUD) is not available via BDE.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Node [(https://data.linz.govt.nz/layer/51993)](https://data.linz.govt.nz/layer/51993)
### Description:
Node can be either a physical mark or a virtual point and contains information that relates to the spatial position of that mark, its association to other marks or points, and measurements and/or calculations. <br>
Nodes may be created without being Marks (for example, an unmarked node where an instrument has been setup, a boundary point that is unable to be physically marked because of occupational obstructions etc.). Similarly, Nodes may be created prior to Reduced Observations being available. <br>
Node is the fundamental entity in the structure of topology (shapes/geometry of features/objects) to represent the cadastral survey layer and other layers in graphical form.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier of a node.(Primary Key)
COS_ID_OFFICIAL    | INTEGER                | The official co-ordinate system for the node. An authoritative co-ordinate should exist for the node in this co-ordinate system.
TYPE               | VARCHAR(4)             | The type of node. <br> Refer Sys Code Group NODT for valid values
STATUS             | VARCHAR(4)             | The status of the node. <br> Refer Sys Code Group NODS for valid values
ORDER_GROUP_OFF    | INTEGER                | Used to define the order of the node. Valid values are 1-6
SIT_ID             | INTEGER                | The site which contains the node.
WRK_ID_CREATED     | INTEGER                | Work id that created the node, this is used to enable the data to be removed when a survey is withdrawn.
ALT_ID             | INTEGER                | Where present, this is a transaction id that has established a lock on the record. Can be used as a warning that changes may be pending.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
SHAPE              | GEOMETRY(POINT)        | Spatial definition of the node.

## Node Proposed Order [(https://data.linz.govt.nz/table/51992)](https://data.linz.govt.nz/table/51992)
### Description:
This entity contains the proposed order of a node within a datum.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__DTM_ID__         | INTEGER                | The Datum id for the associated node
__NOD_ID__         | INTEGER                | The node id for which a particular order is proposed
COR_ID             | INTEGER                | The proposed coordinate order id of the associated node.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Node Works [(https://data.linz.govt.nz/table/51729)](https://data.linz.govt.nz/table/51729)
### Description:
An associative entity which resolves the many to many relationship between Works and Node.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__NOD_ID__         | INTEGER                | The node id that is used as part of the work.
__WRK_ID__         | INTEGER                | The work id that used the node within observations, performed maintenance work on the node etc.
PEND_NODE_STATUS   | VARCHAR(4)             | The status of the associated node stored as pending until the associated work is approved and then the associated node entry is updated. <br> Refer Sys Code Group NODS for valid values.
PURPOSE            | VARCHAR(4)             |The purpose for which the associated node is used. <br> Refer Sys Code Group NOWP for valid values.
ADOPTED            | CHAR(1)                | Flag to indicate whether the node has been adopted from a previous survey.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Nominal Index [(https://data.linz.govt.nz/table/51994)](https://data.linz.govt.nz/table/51994)
### Description:
The nominal index is used when searching for Records of Title by registered owner (formerly proprietor).
The actual registered owner table is not used for searching.
Registered owners will always be automatically copied into the nominal index, but additional entries can be manually added (or removed). <br>
__IMPORTANT__: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the [LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
__Please ensure your use of this data does not breach any conditions of the Act.__

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
TTL_TITLE_NO       | VARCHAR(20)            | The title that this nominal index belongs to.
PRP_ID             | INTEGER                | If the name was automatically copied into the nominal index, this contains the id of the registered owner. This is used to make the nominal index entry historical when the registered owner is transferred off the title.
__*ID*__           | INTEGER                | The unique identifier for the nominal index entry. (Primary Key)
STATUS             | VARCHAR(4)             | Status of the nominal index entry. This indicates if the name is currently the registered owner on the title or not. The default when searching is to search on current names only, but titles can be searched using all historical names as well. <br> See Reference Code Group TSDS for valid values
NAME_TYPE          | VARCHAR(4)             | Indicates if the name is individual or corporate. See Reference Code Group NMIT for valid values
SURNAME            | VARCHAR(100)           | If this nominal index entry is an individual, the surname is stored here, otherwise this should be blank.
OTHER_NAMES        | VARCHAR(100)           | If this nominal index entry is an individual, the given names are stored here, otherwise this should be blank.
CORPORATE_NAME      | VARCHAR(250)           | If this nominal index entry is a corporation, the name of the corporation is stored here, otherwise this should be blank.

## Observation [(https://data.linz.govt.nz/table/51725)](https://data.linz.govt.nz/table/51725)
### Description:
Observation includes Reduced Observations. It may include data recorded in the field that impacts on the Observations such as meteorological observations, time of measurement, etc.

__Data Element__   | __Type (max. size)__   | __Notes__
:--------------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the observation. (Primary Key)
OBT_TYPE           | VARCHAR(4)             | Type of Observation eg Raw or Reduced.
OBT_SUB_TYPE       | VARCHAR(4)             | Code to identify the observation element subtype. Refer to the Observation Element Type table.
STP_ID_LOCAL       | INTEGER                | The local setup id. This identifies the node that was observed from. <br> Refer Sys Code Group OBNT for valid values.
STP_ID_REMOTE      | INTEGER                | The Remote setup id. This identifies the node that was observed to.
OBS_ID             | INTEGER                | This is used to group observations into a set. A collection of observations which are related in some way which is useful for administration or to simplify processes. <br> An example is a set of theodolite directions. These all have a common orientation uncertainty and are grouped as such in a network adjustment. <br> This field is only used for geodetic observations.
COS_ID             | INTEGER                | The coordinate system the observation is defined in.
RDN_ID             | INTEGER                | Identifies the reduction run that produced the reduced observation. <br> Only the metadata relating to the reduction is stored within CRS, the actual reduction of raw observations will be performed external to CRS.
VCT_ID             | INTEGER                | The vector that defines the graphical representation of the observation. <br> Only one vector will exist between two nodes, observations between the same two nodes will share the same vector record.
REF_DATETIME       | DATETIME               | Reference Date/Time of Observation
ACC_MULTIPLIER     | DECIMAL(22,12)         | This is used as an offset to adjust the accuracy. <br> Observations covariances are multiplied by the square of this number. <br> The default value is 1.
STATUS             | VARCHAR(4)             | The status of the observation. <br> Refer Sys Code Group ROBS for valid values.
GEODETIC_CLASS     | VARCHAR(4)             | The geodetic class associated with the precision of the observation. <br> Refer Sys Code Group ROBG for valid values.
CADASTRAL_CLASS    | VARCHAR(4)             | The cadastral class of the observation. <br> Defines the "Class" of the observation in terms of the Survey Regulations (e.g. I, II, III, IV - New Regs., and A,B,C - Old Regs). <br> Refer Sys Code Group ROBC for valid values.
SURVEYED_CLASS     | VARCHAR(4)             | An annotation to identify the means by which the bearing was derived e.g. Measured, Calculated, Adopted. <br> Refer Sys Code Group OBEC for valid values. For observations generated from DCDB the surveyed class will be set to Pseudo.
VALUE_1            | DECIMAL(22,12)         | The value of the first observation element.
VALUE_2            | DECIMAL(22,12)         | The value of the first observation element.
VALUE_3            | DECIMAL(22,12)         | The value of the first observation element.
ARC_RADIUS         | DECIMAL(22,12)         | Radius associated with an observation of type Arc. <br> Set to Null otherwise.
ARC_DIRECTION      | VARCHAR(4)             | Defines if the arc is on the left or the right of the observation (direction of observation is local setup to remote setup). <br> Set to Null if observation is not of type Arc. <br> Refer Sys Code Group OBNA for valid values.
OBN_ID_AMENDMENT   | INTEGER                | Holds the observation Id of the observation Id row that contains amended observation values
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Observation Accuracy [(https://data.linz.govt.nz/table/51724)](https://data.linz.govt.nz/table/51724)
### Description:
Observation Accuracy data is required as an input to a Network Adjustment and also to allow the quality of Observations to be judged. <br>
Observation Accuracy applies to a particular Observation (variance or standard deviation) or pair of Observation (covariances or correlations). The latter case is particularly relevant to the case of GPS baselines resulting from a multi- station adjustment.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
OBN_ID1            | INTEGER                | The id of the observation for which the accuracy information applies.
OBN_ID2            | INTEGER                | For cadastral data this is always the same as obn_id1. <br> For GPS data the accuracy information may represent the covariance between two different observations. Some parts of CRS assume that obn_id1 <= obn_id2
VALUE_11           | FLOATING               | This information holds the covariance of the first elements of the observations identified by obn_id1 and obn_id2. <br> For distance observations obn_id1 = obn_id2 and this holds the variance of the observation in units of metres squared. <br> For bearing observations obn_id1 = obn_id2 and this holds the variance of the observation in units of degrees squared. <br> For arc observations obn_id1 = obn_id2 and this holds the variance of the arc chord bearing in units of degrees squared.
VALUE_12           | FLOATING               | This information holds the covariance of the first element for obn_id1 and the second element of obn_id2.
VALUE_13           | FLOATING               | This information holds the covariance of the first element for obn_id1 and the third element of obn_id2.
VALUE_21           | FLOATING               | This information holds the covariance of the second element for obn_id1 and the first element of obn_id2.
VALUE_22           | FLOATING               | This information holds the covariance of the second element for obn_id1 and the second element of obn_id2.
VALUE_23           | FLOATING               | This information holds the covariance of the second element for obn_id1 and the third element of obn_id2.
VALUE_31           | FLOATING               | This information holds the covariance of the third element for obn_id1 and the first element of obn_id2.
VALUE_32           | FLOATING               | This information holds the covariance of the third element for obn_id1 and the second element of obn_id2.
VALUE_33           | FLOATING               | This information holds the covariance of the third element for obn_id1 and the third element of obn_id2.
__*ID*__           | INTEGER                | Unique identifier for the observation accuracy. (Primary Key)
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Observation Element Type [(https://data.linz.govt.nz/table/51730)](https://data.linz.govt.nz/table/51730)
### Description:
This entity contains all of the elements required to define an observation type.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*TYPE*__         | VARCHAR(4)             | Code to identify an observation element type. (Primary Key)
DESCRIPTION        | VARCHAR(100)           | Description of the observation element type.
UOM_CODE           | VARCHAR(4)             | Code to identify the unit of measurement that the observation element is defined in. Refer to the Unit of Measure table.
FORMAT_CODE        | VARCHAR(4)             | This identifies the format that will be used when displaying the observation element. <br> Refer Sys Code Group OETF for valid values.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Observation Set [(https://data.linz.govt.nz/table/51731)](https://data.linz.govt.nz/table/51731)
### Description:
A collection of observations which are related in some way which is useful for administration or to simplify processes. <br>
An example is a set of theodolite directions. These all have a common orientation uncertainty and are grouped as such in a network adjustment.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the observation set. (Primary Key)
TYPE               | VARCHAR(4)             | Type of set (e.g. set of theodolite directions, set of GPS multi-station baselines, etc) <br> Refer Sys Code Group OBST for valid values.
REASON             | VARCHAR(100)           | Reason for grouping (Textual description)
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Observation Type [(https://data.linz.govt.nz/table/51732)](https://data.linz.govt.nz/table/51732)
### Description
This entity defines all of the different types of observations. Observations are can be split into two types raw or reduced. <br>
For raw observations the following subtypes exist:

- GPS raw data, theodolite pointing, EDM slope observation, level foresight/backsight, meteorological readings, etc.

For Reduced Observations the following subtypes exist:

- GPS baseline, GPS multi-station set, GPS point position, Doppler point position, theodolite direction etc.

CRS 1.0 only supports the storage and manipulation of reduced observations.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__TYPE__           | VARCHAR(4)             | Type of Observation. Raw or Reduced. <br> Refer Sys Code Group OBNT for valid values.
__SUB_TYPE__       | VARCHAR(4)             | Code to identify the observation element subtype. <br> Refer to the Observation Element Type table.
VECTOR_TYPE        | VARCHAR(4)             | The vector type of the observation type. Either line or point. <br> Refer Sys Code Group OBVT for valid values.
OET_TYPE_1         | VARCHAR(4)             | Code to identify an observation element type. Refer to the Observation Element Type table.
OET_TYPE_2         | VARCHAR(4)             | Code to identify an observation element type. Refer to the Observation Element Type table.
OET_TYPE_3         | VARCHAR(4)             | Code to identify an observation element type. Refer to the Observation Element Type table.
DESCRIPTION        | VARCHAR(100)           | Description of the observation type.
DATUM_REQD         | CHAR(1)                | Does the datum need to be defined (some types are datum independent). Valid values are "Y" or "N".
TIME_REQD          | CHAR(1)                | Is the start and end time required (for some observation types only the observation date is required). Valid values are "Y" or "N".
TRAJECTORY_REQD    | CHAR(1)                | Is trajectory information required (trajectory type and supplier). <br> Valid values are "Y" or "N".
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)


## Office [(https://data.linz.govt.nz/table/52066)](https://data.linz.govt.nz/table/52066)
### Description:
This entity contains all of the LINZ offices.

__Data Element__   | __Type (max. size)__   | __Notes__
:--------------|:-----------|:-----------------------------------
__CODE__           | VARCHAR(4)             | Code used to uniquely identify an office.
__NAME__           | VARCHAR(50)            | Name of the office.
RCS_NAME           | VARCHAR(50)            | Defines the FileNet Regional Cache Server for the current office to connect to
CIS_NAME           | VARCHAR(50)            | Defines the FileNet Central Image Server for the current office to connect to.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.
ALLOC_SOURCE_TABLE | VARCHAR(50)            | Defines the FileNet Regional Cache page_cache entry that is used to determine which alloc_table to use to generate the next barcode id for each office.


## Official Coordinate System [(https://data.linz.govt.nz/layer/51733)](https://data.linz.govt.nz/layer/51733)
### Description:
This entity defines the extent of the official coordinate systems that are used for the definition of coordinates associated with nodes. <br>
It is mandatory for every coordinate to have one and only one authoritative coordinate in the official coordinate system.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:--------------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the official coordinate system. (Primary Key)
COS_ID             | INTEGER                | The coordinate system id.
DESCRIPTION        | VARCHAR(100)           | Description of the official coordinate system eg New Zealand, Chatham Islands, Antarctica, World.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
SHAPE              | GEOMETRY(POLYGON)      | The extent of the official coordinate system. <br> For the world coordinate system the shape is set to NULL, as the world coordinate systems cover all nodes that don't fall into the other coordinate systems.

## Ordinate Adjustment [(https://data.linz.govt.nz/table/89377)](https://data.linz.govt.nz/table/89377)
### Description:
This table contains detailed information about changes to Landonline coordinates, and how accurate they are. This can be combined with data in other tables to assess the likely reliability of coordinates by providing details of the adjustment date, connections to geodetic control and amount the coordinates changed by at each adjustment.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__ADJ_ID__         | INTEGER                | The adjustment run the adjustment information relates to. (Primary Key)
__COO_ID_SOURCE__  | INTEGER                | The original coordinate used in the adjustment. (Primary Key)
SDC_STATUS_PROP    | CHAR(1)                | Proposed Survey-accurate Digital Cadastre (SDC) status. <br> This is used in the CRS application to hold information until the adjustment is authorised.
COO_ID_OUTPUT      | INTEGER                | The resulting coordinate generated by the adjustment.
CONSTRAINT         | VARCHAR(4)             | Constraint applied as an input into the adjustment. <br> Refer Sys Code Group COJS for valid values
REJECTED           | CHAR(1)                | The coordinate was rejected by the adjustment process. <br> Valid values are "Y" or "N".
ADJUST_FIXED       | CHAR(1)                | The coordinate was held fixed by the adjustment process. <br> Valid values are "Y" or "N".
COR_ID_PROP        | INTEGER                | The proposed geodetic order of the generated coordinate. <br> This is used in the CRS application to hold information until the adjustment is authorised.
CHANGE_EAST        | DECIMAL(22,12)         | The east component of the calculated change to the coordinates expressed in metres.
CHANGE_NORTH       | DECIMAL(22,12)         | The north component of the calculated change to the coordinates  expressed in metres.
CHANGE_HEIGHT      | DECIMAL(22,12)         | The vertical component of the calculated change to the coordinates expressed in metres.
H_MAX_ACCURACY     | DECIMAL(22,12)         | With the Horizontal Minimum Accuracy and the Horizontal Maximum Azimuth defines the horizontal error ellipse of the calculated coordinate. <br> This is the length of the semi major axis of the 1 standard error a priori error ellipse.
H_MIN_ACCURACY     | DECIMAL(22,12)         | The length of the semi major axis of the 1 standard error a priori error ellipse.
H_MAX_AZIMUTH      | DECIMAL(22,12)         | The azimuth of the semi major axis measured in degrees from north to east.
V_ACCURACY         | DECIMAL(22,12)         | The a priori standard error of the calculated height in metres
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.

## Ordinate Type [(https://data.linz.govt.nz/table/51735)](https://data.linz.govt.nz/table/51735)
### Description:
This entity contains all of the ordinate types.
e.g. X,Y,Z, latitude, longitude, Velocity X, Velocity Y, Velocity Z etc.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__TYPE__           | VARCHAR(4)             | Code to uniquely identify an ordinate type. (Primary Key)
UOM_CODE           | VARCHAR(4)             | Code to identify the unit of measurement that the ordinate is stored in. <br> Refer to the Unit of Measure table.
DESCRIPTION        | VARCHAR(100)           | Description of the ordinate type.
FORMAT_CODE        | VARCHAR(4)             | Defines the display format of the ordinate type. <br> Refer Sys Code Group ORTF for valid values.
MANDATORY          | CHAR(1)                | Flag to determine whether the ordinate type is required for the associated coordinate system.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.

## Parcel [(https://data.linz.govt.nz/layer/51976)](https://data.linz.govt.nz/layer/51976)
### Description:
A Parcel is a polygon or polyhedron consisting of boundary lines (Features which are boundary features) which may be, or may be capable of being defined by survey, and includes the parcel area and appellation. <br>
Polyhedrons are required in order to define stratum estates and easements.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-------------|:-----------------------------------
__*ID*__           | INTEGER                | A unique identifier for a parcel. (Primary Key)
LDT_LOC_ID         | INTEGER                | Land District. Refer Refer to the Land District table.
IMG_ID             | INTEGER                | Link to a diagram of the parcel. Note: This image is added manually to a parcel outside of a survey transaction and as such will be seldom used.
FEN_ID             | INTEGER                | Feature name id
TOC_CODE           | VARCHAR(4)             | Topology class of the parcel <br> Used, sometimes in conjunction with "status," to determine the topological rules that apply to the parcels. <br> Default value = "NONE"
ALT_ID             | INTEGER                | Where present, this is a transaction id that has established a lock on the record. Can be used as a warning that changes may be pending.
AREA               | DECIMAL(20,4)          | The area provided by a surveyor on a new survey lodged to support a title or amend a title.
NONSURVEY_DEF      | VARCHAR(255)           | A description of a parcel, which is not currently defined by Survey. <br> This may be a reference to a description of the parcel, an imaged document or some other definition of the parcel.
APPELLATION_DATE   | DATETIME               | The date the database is updated with the survey dataset. <br> Allocation of new appellations may mean the appellation date differs from the other parcels on the same survey dataset.
PARCEL_INTENT      | VARCHAR(4)             | The reason/intention for creation of a parcel. <br> Refer Sys Code Group PARI for valid values.
STATUS             | VARCHAR(4)             | Status of the parcel. Either Current or Historical. <br> Refer Sys Code Group PARS for valid values.
TOTAL_AREA         | DECIMAL(20,4)          | The total area of the combined sub parcels.
CALCULATED_AREA    | DECIMAL(20,4)          | Area of the parcel as calculated by CPC in metres squared.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
SHAPE              | GEOMETRY(POLYGON)      | Spatial representation of the parcel

## Parcel Boundary [(https://data.linz.govt.nz/table/51723)](https://data.linz.govt.nz/table/51723)
### Description:
This entity records the sequence of lines that define a PRI "Parcel Ring". In the sequence, a line may or may not be reversed in order for the line to connect to the next line in terms of end nodes. <br>
The sequence begins at 1 and is incremented by 1. If the line sequence is a ring (as specified in PRI), the start and end nodes of the sequence must be the same, after the reverse flag has been applied to all lines in the sequence. Not all line sequences for a parcel ring are actually rings, however, as in the case of easement and walkway centreline parcels (i.e. parcels with a topology class of type "LINE"). <br>
For polygonal parcels (i.e. rings), the area occupied by the parcel must be on the right-hand side of the boundary at all times; this means that exterior rings will be defined in a clockwise direction (as specified by the coordinates of the nodes/vertices of the lines after reverse flag is applied), whereas interior rings will be defined in an anti-clockwise direction.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__PRI_ID__         | INTEGER                | The parcel line sequence of which the line is a part.
__SEQUENCE__       | INTEGER                | The position that the line is in the line sequence.
LIN_ID             | INTEGER                | The Line that is part of the line sequence
REVERSED           | CHAR(1)                | Whether the line should be reversed in the line sequence. <br> Valid values are "Y" or "N".
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.

## Parcel Dimension [(https://data.linz.govt.nz/table/51995)](https://data.linz.govt.nz/table/51995)
### Description:
This entity creates the link between a parcel and the observations that are the legal dimensions for the parcel.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__OBN_ID__         | INTEGER                | Observation id that is part of the legal dimension of a parcel.
__PAR_ID__         | INTEGER                | Identifier of the parcel that the observation is a legal dimension for.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Parcel Label [(https://data.linz.govt.nz/layer/51996)](https://data.linz.govt.nz/layer/51996)
### Description:
This entity stores the location of the spatial label used to annotate parcels.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__        | INTEGER                   | Unique identifier for the parcel label. (Primary Key)
PAR_ID          | INTEGER                   | Parcel id that the label relates to.
SHAPE           | GEOMETRY(POINT)           | Spatial location of the parcel label.
__AUDIT_ID__    | INTEGER                   | Id used to link to the associated audit details.
SE_ROW_ID       | INTEGER                   | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (above).

## Parcel Linestring [(https://data.linz.govt.nz/layer/51977)](https://data.linz.govt.nz/layer/51977)
### Description:
Non-primary parcels with a geometry type of a linestring, usually representing a centreline of an easement.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | A unique identifier for a parcel. (Primary Key)
LDT_LOC_ID         | INTEGER                | Land District. Refer to the Land District table.
IMG_ID             | INTEGER                | Link to a diagram of the parcel. Note: This image is added manually to a parcel outside of a survey transaction and as such will be seldom used.
FEN_ID             | INTEGER                | Feature name id
TOC_CODE           | VARCHAR(4)             | Topology class of the parcel <br> Used, sometimes in conjunction with "status," to determine the topological rules that apply to the parcels. <br> Default value = "NONE"
ALT_ID             | INTEGER                | Where present, this is a transaction id that has established a lock on the record. Can be used as a warning that changes may be pending.
AREA               | DECIMAL(20,4)          | The area provided by a surveyor on a new survey lodged to support a title or amend a title.
NONSURVEY_DEF      | VARCHAR(255)           | A description of a parcel, which is not currently defined by Survey. <br> This may be a reference to a description of the parcel, an imaged document or some other definition of the parcel.
APPELLATION_DATE   | DATETIME               | The date the database is updated with the survey dataset. <br> Allocation of new appellations may mean the appellation date differs from the other parcels on the same survey dataset.
PARCEL_INTENT      | VARCHAR(4)             | The reason/intention for creation of a parcel. <br>  Refer Sys Code Group PARI for valid values.
STATUS             | VARCHAR(4)             | Status of the parcel. Either Current or Historical. <br> Refer Sys Code Group PARS for valid values.
TOTAL_AREA         | DECIMAL(20,4)          | The total area of the combined sub parcels.
CALCULATED_AREA    | DECIMAL(20,4)          | Area of the parcel as calculated by CPC in metres squared.
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
SHAPE              | GEOMETRY(LINE)         | Spatial representation of the parcel

## Parcel Ring [(https://data.linz.govt.nz/table/51997)](https://data.linz.govt.nz/table/51997)
### Description:
This entity stores one record for each ring in a polygonal (e.g. fee simple) parcel or for the line sequence of a lineal (e.g. centreline) parcel. <br>
A polygonal parcel may have multiple rings, some of which may be exterior (i.e. polygons) or interior (i.e. holes). If a ring is an inner ring, its parent (i.e. bounding exterior ring) is specified in pri_id_parent_ring; otherwise, this field is NULL. <br>
The Parcel Ring record may not actually be a ring in the case of a lineal (e.g. centreline) parcel. The actual sequence of lines that define the ring is contained in the Parcel Boundary (PAB) table.

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Uniquely identifies line sequence (e.g. ring) for parcel. (Primary Key)
PAR_ID             | INTEGER                | The parcel that the ring is related to.
PRI_ID_PARENT_RING | INTEGER                | Non-mandatory self-reference. <br> Indicates the ring (of the same parcel) that this ring lies within. <br> If NULL, indicates that the line sequence is an exterior ring.
IS_RING            | CHAR(1)                | Does the line sequence form a linear ring, i.e. start and end nodes are the same? <br> This will be true for all line sequences in a polygonal parcel, and not true for the line sequence in a lineal (e.g. centreline) parcel. <br> Valid values are "Y" or "N".
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Proprietor [(https://data.linz.govt.nz/table/51998)](https://data.linz.govt.nz/table/51998)
### Description:
A registered owner (previously known as a proprietor) is a person or corporation holding a share in a Record of Title. <br>
__IMPORTANT__: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the [LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
__Please ensure your use of this data does not breach any conditions of the Act.__

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
ETS_ID             | INTEGER                | The identifier of the estate share that the registered owner owns. If there are joint tenants on a title, there will be more than one registered owner for the same estate share.
__*ID*__           | INTEGER                | The unique identifier for the registered owner. (Primary Key)
STATUS             | VARCHAR(4)             | The status of the registered owner. <br> See Reference Code Group TSDS for valid values.
TYPE               | VARCHAR(4)             | Indicates whether this registered owner is an individual or corporation. <br> See Reference Code Group PRPT for valid values.
PRIME_SURNAME      | VARCHAR(100)           | If this registered owner is an individual, the surname of the registered owner is stored here, otherwise this should be blank.
PRIME_OTHER_NAMES  | VARCHAR(100)           | If this registered owner is an individual, the given name(s) of the registered owner are stored here, otherwise this should be blank.
CORPORATE_NAME     | VARCHAR(250)           | If this registered owner is a corporation, the name of the corporation is stored here, otherwise this should be blank.
NAME_SUFFIX        | VARCHAR(4)             | If this registered owner is an individual, the name_suffix of the registered owner is stored here, otherwise this should be blank. <br> See Reference Code Group NMSF for valid values.
ORIGINAL_FLAG      | CHAR(1)                | This flag is set to "Y" if this registered owner was one of the original registered owners on the title. This is required for printing the historic view of the title which shows the original header data.

## Reduction Method [(https://data.linz.govt.nz/table/51736)](https://data.linz.govt.nz/table/51736)
### Description:
Reduction Method contains information of the type of software and procedures used to generate Reduced Observations from Raw Measurements or other reduced observations.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                 | Unique identifier for the reduction method. (Primary Key)
STATUS             | VARCHAR(4)              | The status of the reduction method. <br> Refer Sys Code Group RDMS for valid values.
DESCRIPTION        | VARCHAR(100)            | Description of the reduction method.
NAME               | VARCHAR(30)             | Name of reduction method
__AUDIT_ID__       | INTEGER                 | Id used to link to the associated audit details.

## Reduction Run [(https://data.linz.govt.nz/table/51737)](https://data.linz.govt.nz/table/51737)
### Description:
A Reduction Run is a mathematical process of reducing raw observations to generate a set of reduced observations (in the case of GPS observations, this results in the generation of baselines). <br>
The Reduction Run entity contains information about the filtering and quality measures applied in relation to the reduction method used.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the reduction run. (Primary Key)
RDM_ID             | INTEGER                | Reduction Method Id
DATETIME           | DATETIME               | Time/Date of Reduction Run
DESCRIPTION        | VARCHAR(100)           | Description of the reduction run.
TRAJ_TYPE          | VARCHAR(4)             | Defines the trajectory type used for a reduction. <br> Refer Sys Code Group RDNR for valid values.
USR_ID_EXEC        | VARCHAR(20)            | The user that performed the reduction run.
SOFTWARE_USED      | VARCHAR(30)            | Software used in the reduction run
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Reference Survey [(https://data.linz.govt.nz/table/51738)](https://data.linz.govt.nz/table/51738)
### Description:
The reference to previous survey datasets used in preparing a dataset being lodged. There will be a number of datasets appropriate to each dataset lodged.

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
__SUR_WRK_ID_EXIST__ | INTEGER                | The original referenced survey
__SUR_WRK_ID_NEW__   | INTEGER                | The new survey
__*AUDIT_ID*__       | INTEGER                | Id used to link to the associated audit details. (Primary Key)
BEARING_CORR         | DECIMAL                | Bearing Correction for the existing survey to bring it in terms with the new survey.

## Setup [(https://data.linz.govt.nz/table/51742)](https://data.linz.govt.nz/table/51742)
### Description:
The Setup entity holds information about a set-up at a Node as a result of a type of Work such as a Survey. <br>
The setup entity forms the link between an observation and the nodes that the observation is between.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the setup. (Primary Key)
NOD_ID             | INTEGER                | The node identifier for the setup.
TYPE               | VARCHAR(4)             | The type of setup i.e. local or remote. <br> Refer Sys Code Group STPT for valid values. <br> Note that the same setup should be used for a bearing and distance combined. There should only be one bearing and one distance for any setup pair.
VALID_FLAG         | CHAR(1)                | Indicates the validity of the setup. <br> Valid values are "Y" or "N".
EQUIPMENT_TYPE     | VARCHAR(4)             | The equipment type used for the survey. <br> Refer Sys Code Group STPE for valid values.
WRK_ID             | INTEGER                | The id of the work/survey for the setup.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Site [(https://data.linz.govt.nz/table/51743)](https://data.linz.govt.nz/table/51743)
### Description:
A physical location which was selected, according to specifications for the placement and subsequent survey and re-survey of physical geodetic marks (nodes). <br>
A site may consist of a cluster of geodetic marks which have been placed together for various reasons e.g. accommodate terrain irregularities, monitoring of marks, requirements for eccentric marks. <br>
Data confirming the selection of the site, such as owner/occupier, access diagram, locality diagram, digital photo etc. is listed. <br>
The site may hold information relating to an active maintenance programme. It can also hold updated information regarding the current status of the initial requirements due to third party input or by survey contracts.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the site. (Primary Key)
TYPE               | VARCHAR(4)             | Site Type (i.e. reason for grouping). Options are maintenance or proposed scheme. <br> Refer Sys Code Group SITT for valid values.
OCCUPIER           | VARCHAR(100)           | Site Occupier
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
WRK_ID_CREATED     | INTEGER                | Work ID that created thus site.
DESC               | VARCHAR(2048)          | Brief description of the site.

## Site Locality [(https://data.linz.govt.nz/table/51744)](https://data.linz.govt.nz/table/51744)
### Description:
Associative entity that links sites and localities.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__SIT_ID__         | INTEGER                | Site Id
__LOC_ID__         | INTEGER                | The locality that the site is contained in.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Statistical Area [(https://data.linz.govt.nz/table/52000)](https://data.linz.govt.nz/table/52000)
### Description:
Statistical Areas are areas definable as an aggregation of meshblocks. <br>
The areas defined here are those that are required for electoral purposes, e.g. territorial authorities, general electorates, and maori electorates. This unload only contains TA entries, that may be linked to a Survey plan.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | A unique identifier used to refer to the statistical area. (Primary Key)
SAV_AREA_CLASS     | VARCHAR(4)             | Code representing the type of statistical area (statistical area class). <br> Refer Sys Code Group SAVA for valid values.
SAV_VERSION        | INTEGER                | The version number of the statistical area 'layer'. This allows multiple boundaries of the same area class to be stored with different "as at" dates.
NAME               | VARCHAR(100)           | The full name of the statistical area itself.
NAME_ABREV         | VARCHAR(18)            | An abbreviation of the full name which is used in printouts etc.
CODE               | VARCHAR(6)             | A unique numeric code used to identify a specific statistical area. <br> (Code is assigned externally to CRS but will always be unique when used in conjunction with Sav_Area_Class & Sav_Version)
STATUS             | VARCHAR(4)             | Refer Sys Code Group STTS for valid values.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Statistical Version [(https://data.linz.govt.nz/table/51999)](https://data.linz.govt.nz/table/51999)
### Description:
A Statistical Area Class, e.g. Territorial Authority, may have more than one version. <br>
Versioning allows both the former and latter versions of statistical area boundary changes to be stored in Landonline.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__VERSION__        | INTEGER                | A unique number used to identify the definition of a set of statistical areas of one area class.
__AREA_CLASS__     | VARCHAR(4)             | A subclass of the statistical area type indicating the type of statistical area. <br> Refer Sys Code Group SAVA for valid values.
DESC               | VARCHAR(50)            | A description of the reason behind defining a new version for the statistical area class.
STATUTE_ACTION     | VARCHAR(50)            | A NZ Gazette reference to the Gazette notice responsible for this new definition of a statistical area class.
START_DATE         | DATE                   | The date from which the version of a statistical area class is valid and current.
END_DATE           | DATE                   | The final date on which the version of a statistical area class is valid and current.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Statute [(https://data.linz.govt.nz/table/51699)](https://data.linz.govt.nz/table/51699)
### Description:
A Statute is legislation enacted by Parliament and includes Acts and Regulations. The contents or provisions of a Statue (Act) are identified in terms of Parts, Sections and Schedules and the Act name. Statutory Regulations are structured in the same way.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Primary Key
SECTION            | VARCHAR(100)           | The section or Part of the Statute. Includes sub-sections, paragraphs and sub-paragraphs.
NAME_AND_DATE      | VARCHAR(100)           | The name and the year of the statute.
STILL_IN_FORCE     | CHAR(1)                | Is the statute still in force, Y/N.
IN_FORCE_DATE      | DATE                   | The date on which the statute comes into force.
REPEAL_DATE        | DATE                   | The date the statute is repealed.
TYPE               | VARCHAR(4)             | Identifies the valid types of statutory actions that can be stored against the statute. <br> Right Restrict, Parcel Restrict etc. See Reference Code Group STAT for valid values
DEFAULT            | CHAR(1)                | The default statute for the statute type. This is used in CRS where a particular type of statute needs to be defaulted (eg, when a new title is created the statute needs to be defaulted, or the create easement screen that needs to default the easement restriction statute).
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.

## Statute Action [(https://data.linz.govt.nz/table/51698)](https://data.linz.govt.nz/table/51698)
### Description:
A Statutory Action is the action that is authorised by a specific Part or Section of an Act.

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
TYPE               | VARCHAR(4)             | Identifies the type of statutory action eg Right Restrict, Parcel Restrict etc. <br> Refer Sys Code Group STAT for valid values.
STATUS             | VARCHAR(4)             | The status fo the Statutory Action. <br> Refer Sys Code Group STAS for valid values.
STE_ID             | INTEGER                | This links to the Statute (STE) table.
SUR_WRK_ID_VESTING | INTEGER                | Used by Vestings on Deposit to indicate the survey that was deposited
GAZETTE_YEAR       | SMALLINT               | Gazette Reference (year)
GAZETTE_PAGE       | INTEGER                | Gazette Reference (page number)
GAZETTE_TYPE       | VARCHAR(4)             | Refer Sys Code Group STAG for valid values.
OTHER_LEGALITY     | VARCHAR(250)           | Used to record other legality information brought forward from DCDB.
RECORDED_DATE      | DATE                   | The date the statutory action was recorded in CRS
__*ID*__           | INTEGER                | Primary Key
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
GAZETTE_NOTICE_ID  | INTEGER                | Unique Gazette Reference ID (see [http://www.linz.govt.nz/kb/687](http://www.linz.govt.nz/kb/687))


## Statutory Action Parcel [(https://data.linz.govt.nz/table/51700)](https://data.linz.govt.nz/table/51700)
### Description:
Statutory Actions recorded against specific parcels.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__STA_ID__         | INTEGER                | A unique identifier for a Statutory Action.
__PAR_ID__         | INTEGER                | A unique identifier for a parcel.
STATUS             | VARCHAR(4)             | The status of this action. <br> Refer Sys Code Group SAPS for valid values.
ACTION             | VARCHAR(4)             | Actions against parcel networks when recorded. <br> Refer Sys Code Group SAPA for valid values.
PURPOSE            | VARCHAR(250)           | Purpose of the parcel given by the statutory action
NAME               | VARCHAR(250)           | Any name information (e.g. reserve name) <br> Note : a name that requires a macron will be shown without the macron and have “ [Spelling not official]” appended to the name. See Section 1.1 Introduction.
COMMENTS           | VARCHAR(250)           | Any additional information or user comments
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Survey [(https://data.linz.govt.nz/table/52001)](https://data.linz.govt.nz/table/52001)
### Description:
Survey provides details that identify the type of survey, the purpose, and who is involved with giving authorization, preparation and taking responsibility for Work when it is lodged with Land Information NZ. <br>
For example: The Surveyor who generates a survey dataset is responsible for the accuracy, definition and completeness and provides the details of the purpose for carrying out the work.

__Data Element__   | __Type (max. size)__   | __Notes__
:--------------|:----------|:-----------------------------------
__*WRK_ID*__       | INTEGER                | Unique identifier for the Work entry for this Survey. (Primary Key)
LDT_LOC_ID         | INTEGER                | The id for the land district that the survey is contained in.
DATASET_SERIES     | VARCHAR(4)             | The series relates the survey identifier to the purpose of the survey. e.g. LT, DP, SO, ML etc. <br> Refer Sys Code Group SURD for valid values.
DATASET_ID         | VARCHAR(20)            | The number used to identify the survey. <br> This is only unique when combined with the land district and data set series for surveys create prior to CRS. <br> This will be unique for all new surveys created within CRS.
TYPE_OF_DATASET    | VARCHAR(4)             | Survey - A dataset where a Surveyor has completed Reduced Observations to determine spatial reference.(Includes Flats & Units) <br> Compiled - A dataset prepared from existing boundary points and no new Reduced Observations are required. <br> Computed - A dataset prepared from previous datasets that creates new boundary points without new Reduced Observations <br> Refer Sys Code Group SURT for valid values.
DATA_SOURCE        | VARCHAR(4)             | Valuedflag that indicates if the survey was DCDB converted (CONV), a Work In Progress survey (WIPS), general Landonline survey (LNDL) or electronically lodged survey (ESUR). <br> Refer Sys Code Group SURW for valid values.
LODGE_ORDER        | INTEGER                | The value of which position in the order of lodgment the survey was. <br> This is used for staged unit plans to enable the correct suffix to be allocated.
DATASET_SUFFIX     | VARCHAR(7)             | Suffix for the dataset. <br>  This is used to provide a unique identifier for staged unit developments as they use the same dataset id for each stage.
SURVEYOR_DATA_REF  | VARCHAR(50)            | The reference attached to the dataset by the surveyor to enable the survey number to be cross referenced with the surveyors own records after lodgment. <br> Name or number or both.
SURVEY_CLASS       | VARCHAR(4)             | Defines the class of the survey. Values for this field include I, II, III, IV <br> Refer Sys Code Group SURC for valid values.
DESCRIPTION        | VARCHAR(2048)          | Survey Description, e.g. "Lots 1 and 2 being subdivision of Lot 1 DP 1000"
USR_ID_SOL         | VARCHAR(20)            | Identifier used to indicate the solicitor involved with the survey
SURVEY_DATE        | DATE                   | The date the survey was performed.
CERTIFIED_DATE     | DATE                   | The date the survey was certified as correct by the surveyor who performed the survey.
REGISTERED_DATE    | DATE                   | The date the survey was deposit for LT plans <br> The date the survey was approved for SO plans <br> The date the survey was approved by the MLC Judge for ML plans.
CHF_SUR_AMND_DATE  | DATE                   | The date the chief survey signed an amendment.
DLR_AMND_DATE      | DATE                   | The date the DLR signed an amendment.
CADASTRAL_SURV_ACC | CHAR(1)                | Flag indicating whether the cadastral surveyor that performed the survey was accredited or not. <br> Refer Sys Code Group SURR for valid values.
PRIOR_WRK_ID       | INTEGER                | The unit plan selected as a previous stage.
ABEY_PRIOR_STATUS  | VARCHAR(4)             | Status Prior to survey being placed on abeyance. <br> This is used to restore the survey to the original status prior to being placed in abeyance. <br> Refer Sys Code Group WRKC & WRKG for valid values.
FHR_ID             | INTEGER                | The identifier that will relate the invoice to the service provided.
PNX_ID_SUBMITTED   | INTEGER                | pnx_id that submitted this survey
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.


## Survey Admin Area [(https://data.linz.govt.nz/table/51746)](https://data.linz.govt.nz/table/51746)
### Description:
This entity records the Territorial Authorities required to authorise a survey.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__SUR_WRK_ID__     | INTEGER                | Survey id
__STT_ID__         | INTEGER                | Link to Territorial Authority (stored in the Statistical Area table).
XSTT_ID            | INTEGER                | Link to the Statistical Area staging area table (XSTT). This table stores temporary edit information and is not available to BDE.
EED_REQ_ID         | INTEGER                | Electoral Edit Request ID. The Electoral Edit table (EED) is not available to BDE.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Survey Plan Reference [(https://data.linz.govt.nz/layer/51747)](https://data.linz.govt.nz/layer/51747)
### Description:
This is required to spatially position survey plan references for display within Landonline. <br>
The plan reference itself is stored in the Survey table.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier for the plan label. (Primary Key)
WRK_ID             | INTEGER                | The work id for the survey that the label is related to.
SHAPE              | GEOMETRY(POINT)        | Position of the survey label
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by the ArcSDE datablade. NB the geometry stored at this loc


## Survey Plan Image Revision [(https://data.linz.govt.nz/table/52069)](https://data.linz.govt.nz/table/52069)
### Description:
This table provides the last updated date for survey plan images that are held in Landonline. Survey plans images typically remain unchanged after approval. However plan images are sometime replaced with a new copy when the original scanned is corrupt, is of a low quality or is found to be in error. <br>
Each survey plan can have more than one survey plan image. E.g. Imperial plan black and white, Imperial plan colour or Digital Title Plan, Digital Survey Plan. <br>
__Note__: This table does not contain the actual survey images which are available via the Landonline application.

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
__*ID*__           |INTEGER                 |The image ID (Primary Key)
__SUR_WRK_ID__     |INTEGER                 | The unique system identifier for a survey
SURVEY_REFERENCE   | VARCHAR(100)           | The survey dataset number e.g. SO 12345, DP 12345
LAND_DISTRICT      | VARCHAR(100)           | The name of the land district the plan is in. e.g. "North Auckland", "Southland" See https://data.linz.govt.nz/layer/785-nz-land-districts/ for more details
PLAN_TYPE          | VARCHAR(100)           | The type of plan image. Possible values are: <br> -Imperial Plan <br> -Imperial Plan (Colour) <br> -Survey Plan (Colour) <br> -Survey Plan <br> -Title Plan (Colour) <br> -Title Plan <br> -Paper Title Diagram <br> -Digital Title Diagram <br> -Digital Survey Diagram <br> -Digital Title Plan <br> -Digital Survey Plan
PAGES              | INTEGER                | The number of sheets for the plan image
LAST_UPDATED       | DATETIME               | The date the latest image is saved into the Landonline system.

### Relationships

 __Parent Entity__ | __Child Entity__ | __Relating Parent Attribute__ | __Relating Child Attribute__
:-----------------|:---------------|:-----------------------------|:----------------------------
Survey             | Survey Plan Image Revision     | WRK_ID          | SUR_WRK_ID

## System Code [(https://data.linz.govt.nz/table/51648)](https://data.linz.govt.nz/table/51648)
### Description:
This entity contains a maintainable list of values and parameters etc used for configuring the system. <br>
For a full listing, current as at the time of the original publication of this document, refer to Section 3 of this document. For update to date entries refer to the System Code table.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__SCG_CODE__       | VARCHAR(4)             | Unique identifier of groups. The normal naming convention is the three letter acronym for the associated table followed by another letter e.g. MRKS - Is the list of all available Mark Statuses.
__CODE__           | VARCHAR(4)             | This code is unique within a reference code group.
DESC               | VARCHAR(2048)          | Description of what the code represents.
STATUS             | VARCHAR(4)             | The status of the system code. <br> Refer Sys Code Group SYSS for valid values.
DATE_VALUE         | DATETIME               | Date and time value.
CHAR_VALUE         | VARCHAR(2048)          | Character value
NUM_VALUE          | DECIMAL(22,12)         | Number Value
START_DATE         | DATE                   | Date the code becomes valid, Only used for business rules codes.
END_DATE           | DATE                   | Date the code expires. Only used for business rules codes.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)


## System Code Group [(https://data.linz.govt.nz/table/51593)](https://data.linz.govt.nz/table/51593)
### Description:
This entity contains all the different groups of system codes. <br>
For update to date entries refer to the System Code Group table.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
DESC               | VARCHAR(100)           | Description of the reference code group.
USER_CREATE_FLAG   | CHAR(1)                | Can new codes be created within this reference code group. <br> Valid values are "Y" or "N".
USER_MODIFY_FLAG   | CHAR(1)                | Can existing codes be modified within this reference code group. <br> Valid values are "Y" or "N".
USER_DELETE_FLAG   | CHAR(1)                | Can existing codes be deleted from this reference code group. <br> Valid values are "Y" or "N".
USER_VIEW_FLAG     | CHAR(1)                | Can codes be displayed from this reference code group. <br> Valid values are "Y" or "N".
DATA_TYPE          | CHAR(1)                | The data type stored within the system reference code group. <br> Refer Sys Code Group SCGD for valid values.
GROUP_TYPE         | VARCHAR(1)             | Type of the system code group e.g. Sytem code or Business Rule <br> Refer Sys Code Group SCGG for valid values.
__CODE__           | VARCHAR(4)             | Unique identifier. The normal naming convention is the three letter acronym for the associated table followed by another letter e.g. MRKS - Is the list of all available Mark Statuses. (Primary Key)
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## Title [(https://data.linz.govt.nz/table/52067)](https://data.linz.govt.nz/table/52067)
### Description:
A title is a record of all estates, encumbrances and easements that affect a piece of land. <br>
This table will also hold Computer Interest Registers (or non-title titles or instruments embodied in the register).

__Data Element__   | __Type (max. size)__   | __Notes__
:----------------|:-----------|:-----------------------------------
__TITLE_NO__       | VARCHAR(20)            | The title number that uniquely identifies each title. <br> Pre Landonline title numbers will usually be in the form of "nnnx/nn" (Eg, "203B/12" or "1A/1"). They will be converted with the land district prefix at the beginning to make them unique eg “OT1A/1”. <br> New title numbers created in Landonline will be numbers only.
LDT_LOC_ID         | INTEGER                | The id of the land district the title is in.
STATUS             | VARCHAR(4)             | The status of the title. <br> See Reference Code Group TTLS for valid values
ISSUE_DATE         | DATETIME YEAR          | The date on which the title was issued.
REGISTER_TYPE      | VARCHAR(4)             | Indicates the register the title is contained in (eg, the Computer Freehold Register, Computer Interest Register) <br>  See Reference Code Group TTLR for valid values.
TYPE               | VARCHAR(4)             | Indicates the type of title. Examples of title type include Freehold, Leasehold, Composite and Supplementary Record Sheet. <br> See Reference Code Group TTLT for valid values.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.
STE_ID             | INTEGER                | The id of the statute that the title is issued under. This will be the Unit Titles Act for supplementary record sheets and the Land Transfer Act for all other titles. <br> This is displayed on the title views.
GUARANTEE_STATUS   | VARCHAR(4)             | The status of the State guarantee relating to a title. <br> A title may be fully guaranteed or "Limited as to parcels" which means that a fully guaranteed title will not be issued for the land until a survey plan of the land has been deposited. See Reference Code Group TTLG for valid values.
PROVISIONAL        | CHAR(1)                | A flag indicating if the title is provisional. Used for display in the title view header.
SUR_WRK_ID         | INTEGER                | Titles of type Supplementary Record Sheet display a plan id in the title view. This contains the link to the corresponding work id of the SRS plan.
MAORI_LAND         | CHAR(1)                | ‘Y’ or ‘null’. Identifies titles which may potentially be Maori Land. It is known to contain omissions and errors and is indicative only. In many cases this is set to ‘null’ (no information)
TTL_TITLE_NO_SRS   | VARCHAR(20)            | Unit titles are linked to a single Supplementary Record Sheet title. <br>  This contains the SRS title number if the current title is a unit title.
TTL_TITLE_NO_HEAD_SRS | VARCHAR(20)         | Titles of type Supplementary Record Sheet, where it is a subsidiary unit title development (subdivision of a principal unit), are linked back to the very first SRS in the development. This contains the head SRS title number if the current title is a SRS title for a subsidiary unit title development.

## Title Action [(https://data.linz.govt.nz/table/52002)](https://data.linz.govt.nz/table/52002)
### Description:
Records the title that are affected by an action.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)
__TTL_TITLE_NO__   | VARCHAR(20)            | The number of the title that is affected by the action. (FK)
__ACT_TIN_ID__     | INTEGER                | The instrument the action belongs to. (FK)
__ACT_ID__         | INTEGER                | The actio nid. (FK)

### Relationships

 __Parent Entity__ | __Child Entity__ | __Relating Parent Attribute__ | __Relating Child Attribute__
:-----------------|:---------------|:-----------------------------|:----------------------------
Action             | Title Action     | TIN_ID <br> ID            | ACT_TIN_ID <br> ACT_ID
Title              | Title Action     | TITLE_NO                      | TTL_TITLE_NO

## Title Document Reference [(https://data.linz.govt.nz/table/52004)](https://data.linz.govt.nz/table/52004)
### Description:
Stores references to existing title documents or deeds indexes that are affected by instruments.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
TYPE               | VARCHAR(4)             | The type of the title document reference.
REFERENCE_NO       | VARCHAR(15)            | The number of the deeds index or title document.
__*ID*__           | INTEGER                | The unique identifier for row. (Primary Key)
TIN_ID             | INTEGER                | The title instrument that created (affects) the title document reference. <br> This will only have a value for title document references created in CRS.


## Title Encumbrance [(https://data.linz.govt.nz/table/52010)](https://data.linz.govt.nz/table/52010)
### Description:
This entity is used to link an encumbrance to the titles it affects.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
TTL_TITLE_NO       | VARCHAR(20)            | The title that is linked to the encumbrance.
ENC_ID             | INTEGER                | The id of the encumbrance the title is linked to.
STATUS             | VARCHAR(4)             | The status of the title encumbrance record. <br> See Reference Code Group TSDS for valid values.
__*ID*__           | INTEGER                | A unique identifier for the title encumbrance record. (Primary Key)
ACT_TIN_ID_CRT     | INTEGER                | The id of the instrument that created this title encumbrance row.
ACT_ID_CRT         | INTEGER                | The id of the action that created this title encumbrance row.

## Title Estate [(https://data.linz.govt.nz/table/52068)](https://data.linz.govt.nz/table/52068)
### Description:
An estate is a type of ownership of a piece of land e.g. fee simple estate, leasehold estate. <br>
Estates are used to link the registered owner(s) to the title. A title can have more than 1 estate and type.

__Data Element__   | __Type (max. size)__   | __Notes__
:--------------|:-----------|:-----------------------------------
TTL_TITLE_NO       | VARCHAR(20)            | The number of the title that this estate belongs to.
TYPE               | VARCHAR(4)             | Defines the type of the estate for which the title was issued. See Reference Code Group ETTT for valid values
STATUS             | VARCHAR(4)             | The status of the title estate. <br> See Reference Code Group TSDS for valid values
SHARE              | VARCHAR(100)           | The share of the estate held by this title. This field will normally be a whole share, however, it is possible for two different titles to contain a half (or other) share of the same area of land (eg, for access lots or composite cross-lease titles).
PURPOSE            | VARCHAR(255)           | The description of the purpose that the land is held for (if applicable). Eg, a piece of land vested in the council during a subdivision may have a purpose "Local purpose recreation reserve". The purpose restricts the use of the land and the title. Used for display in the title view.
TIMESHARE_WEEK_NO  | VARCHAR(20)            | If the title is a timeshare title, this contains the timeshare week that the title is for.
LGD_ID             | INTEGER                | The id of the Legal Description for this title estate.
__*ID*__           | INTEGER                | The unique identifier for the estate. (Primary Key)
ACT_TIN_ID_CRT     | INTEGER                | For new estates created in Landonline this will contain the id of the instrument that created the estate.
ORIGINAL_FLAG      | CHAR(1)                | This flag is set to "Y" if this is estate was one of the original estates on the title. This is required for printing the historic view of the title which shows the original header data.
TIN_ID_ORIG        | INTEGER                | The instrument number that originally created the estate. This column only requires a value for leasehold estates and computer interest registers. It is used to display on the title views of titles with a leasehold estate, or titles in the Computer Interest Register.
TERM               | VARCHAR(255)           | Description of the term of the estate. Only valid for time limited estates for example Lease Hold estates. Their term is held as a textual description only for display (ie, no automatic processing is performed based on the term).
ACT_ID_CRT         | INTEGER                | For new estates created in CRS this will contain the id of the action that created the estate.

## Title Hierarchy [(https://data.linz.govt.nz/table/52011)](https://data.linz.govt.nz/table/52011)
### Description:
Lists all the prior references for the current title, which may be other prior titles or title document references.

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | The unique identifier for this row. (Primary Key)
STATUS             | VARCHAR(4)             | The status of the current prior reference. <br> See Reference Code Group TSDS for valid values.
TTL_TITLE_NO_PRIOR | VARCHAR(20)            | If the prior reference is a title, this will contain the prior title reference.
TTL_TITLE_NO_FLW   | VARCHAR(20)            | The current title reference.
TDR_ID             | INTEGER                | If the prior reference is a title document, this will contain the id of the title document.
ACT_TIN_ID_CRT     | INTEGER                | The instrument id that created this new title hierarchy row.
ACT_ID_CRT         | INTEGER                | The action id that created this new title hierarchy row.

## Title Instrument [(https://data.linz.govt.nz/table/52012)](https://data.linz.govt.nz/table/52012)
### Description:
A Titles Instrument is a document relating to the transfer of, or other dealing with land.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
DLG_ID             | INTEGER                | The id of the dealing the instrument belongs to. Only new instruments created through Landonline will be linked to a dealing.
INST_NO            | VARCHAR(30)            | The number of the instrument. Instrument numbers can have a number of formats, however all instruments created in Landonline will be unique and have a number in the format: <br> <dealing id>.<instrument priority> <br> Instrument numbers prior to Landonline are not necessarily unique.
PRIORITY_NO        | INTEGER                | The order of the current instrument within the dealing. This column will always have a value for new instruments created in Landonline. It may sometimes have a value for instruments created during data conversion if it could be identified.
LDT_LOC_ID         | INTEGER                | The id of the land district containing the land that the instrument affects.
LODGED_DATETIME    | DATETIME YEAR TO FRACTION  | The date and time the instrument was lodged for registration.
STATUS             | VARCHAR(4)             | The status of the instrument. <br> See Reference Code Group TINS for valid values.
__*ID*__           | INTEGER                | The unique identifier for the instrument. (Primary Key)
TRT_GRP            | VARCHAR(4)             | The Transaction Type Group (Instrument).
TRT_TYPE           | VARCHAR(4)             | The Instrument type.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
TIN_ID_PARENT      | INTEGER                | This field will contain the id of the title instrument that is the parent of this child instrument. An instrument is the child instrument to another if the memorial it created should be removed from the title view at the same time as the memorial created by the parent instrument (eg, a variation of mortgage instrument is a child to the mortgage instrument, as the variation memorial should be removed from the title view when the mortgage is removed).

## Title Instrument Title [(https://data.linz.govt.nz/table/52013)](https://data.linz.govt.nz/table/52013)
### Description:
Links an instrument to the titles that are affected by the instrument.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)
__TIN_ID__         | INTEGER                | The id of the instrument.
__TTL_TITLE_NO__   | VARCHAR(20)            | The title reference affected by the instrument.

## Title Memorial [(https://data.linz.govt.nz/table/52006)](https://data.linz.govt.nz/table/52006)
### Description:
This table contains one row for each current or historical memorial for a title. <br>
All historical memorials for all titles are kept. Current memorials are deleted when they are no longer valid on the title. <br>
Note : Titles that existed prior to Landonline only had memorials converted when that title was live and they were current memorials.

__Data Element__   | __Type (max. size)__   | __Required__   | __Notes__
:-----------------|:-------------|:-------|:---------------------------------------
__*ID*__           | INTEGER                | Yes            | The unique identifier for this title memorial. (Primary Key)
TTL_TITLE_NO       | VARCHAR(20)            | Yes            | The title the memorial appears on. (FK)
MMT_CODE           | VARCHAR(10)            | Yes            | The memorial template code used to generate the memorial. (FK)
ACT_ID_ORIG        | INTEGER                | Yes            | The id of the action that originally created the memorial. (FK)
ACT_TIN_ID_ORIG    | INTEGER                | Yes            | The id of the instrument that originally created the memorial. (FK)
ACT_ID_CRT         | INTEGER                | Yes            | The id of the action that created the memorial. (FK)
ACT_TIN_ID_CRT     | INTEGER                | Yes            | The id of the instrument that created the memorial. (FK)
STATUS             | VARCHAR(4)             | Yes            | The status of the title memorial. See Reference Code Group TSDS for valid values.
USER_CHANGED       | CHAR(1)                | Yes            | This flag indicates if the user has changed the memorial text that the system generated. This is used to determine whether or not the memorial should be automatically regenerated or not.
TEXT_TYPE          | VARCHAR(4)             | Yes            | Indicates whether or not the memorial contains text only, or contains a table. See Reference Code Group TTMT for valid values.
REGISTER_ONLY_MEM  | CHAR(1)                | No             | Indicates whether the memorial should appear on the register copy of the title only, or if it should appear on the duplicate title as well.
PREV_FURTHER_REG   | CHAR(1)                | No             | Indicates whether the current memorial may prevent further registration on the title, as long as it remains on thecurrent title view.
CURR_HIST_FLAG     | VARCHAR(4)             | Yes            | This field indicates whether this memorial should be shown on the current or historic view of the title. See Reference Code Group TTMC for valid values.
DEFAULT            | CHAR(1)                | Yes            | Flag used to determine whether the memorial was created as a default memorial. I.e. from the Instrument Detail screen. Yes/No Default: N
NUMBER_OF_COLS     | INTEGER                | No             | If the memorial contains a table, this indicates the number of columns in the table.
COL_1_SIZE         | INTEGER                | No             | If the memorial is a table, this indicates the size (in Powerbuilder units) of column 1.
COL_2_SIZE         | INTEGER                | No             | If the memorial is a table, this indicates the size (in Powerbuilder units) of column 2.
COL_3_SIZE         | INTEGER                | No             | If the memorial is a table, this indicates the size (in Powerbuilder units) of column 3.
COL_4_SIZE         | INTEGER                | No             | If the memorial is a table, this indicates the size (in Powerbuilder units) of column 4.
COL_5_SIZE         | INTEGER                | No             | If the memorial is a table, this indicates the size (in Powerbuilder units) of column 5.
COL_6_SIZE         | INTEGER                | No             | If the memorial is a table, this indicates the size (in Powerbuilder units) of column 6.
COL_7_SIZE         | INTEGER                | No             | If the memorial is a table, this indicates the size (in Powerbuilder units) of column 7.
ACT_ID_EXT         | INTEGER                | No             | The id of the action that will remove this memorial from the title. (FK)
ACT_TIN_ID_EXT     | INTEGER                | No             | The id of the instrument that will remove this memorial from the title. (FK)

### Relationships

 __Parent Entity__ | __Child Entity__ | __Relating Parent Attribute__ | __Relating Child Attribute__
:-----------------|:---------------|:-----------------------------|:----------------------------
Title Memorial     | Title Memorial Text | ID                         | TTM_ID
Title              | Title Memorial      | TITLE_NO                   | TTL_TITLE_NO
Action             | Title Memorial      | TIN_ID <br> ID         | ACT_TIN_ID_CRT <br> ACT_ID_CRT
Action             | Title Memorial      | TIN_ID <br> ID         | ACT_TIN_ID_EXT <br> ACT_ID_EXT
Action             | Title Memorial      | TIN_ID <br> ID         | ACT_TIN_ID_ORIG <br> ACT_ID_ORIG
Memorial Template  | Title Memorial      | CODE                       | MMT_CODE

## Title Memorial Text [(https://data.linz.govt.nz/table/52007)](https://data.linz.govt.nz/table/52007)
### Description:
Contains the actual text of the title memorial.  <br>
Note: Titles that existed prior to Landonline only had memorials converted when that title was live and they were current memorials. <br>
__IMPORTANT__: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the [LINZ License For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
__Please ensure your use of this data does not breach any conditions of the Act.__

__Data Element__   | __Type (max. size)__   | __Required__   | __Notes__
:------------|:-----------|:-------|:---------------------------------------
__*AUDIT_ID*__     | INTEGER                | Yes            | Id used to link to the associated audit details. (Primary Key)
__TTM_ID__         | INTEGER                | Yes            | The id of the title memorial this text belongs to. (FK)
__SEQUENCE_NO__    | INTEGER                | Yes            | The sequence of this row of text within the one memorial. There can only be one row of text for memorials that do not contain a table. All memorials that have a table must contain one row of "standard text" before the rows that contain the columns
CURR_HIST_FLAG     | VARCHAR(4)             | Yes            | This field indicates whether this memorial should be shown on the current or historic view of the title. See Reference Code Group TTMC for valid values.
STD_TEXT           | VARCHAR(18000)         | No             | Contains the actual text part of a memorial.
COL_1_TEXT         | VARCHAR(2048)          | No             | Contains the text for column one of a memorial.
COL_2_TEXT         | VARCHAR(2048)          | No             | Contains the text for column two of a memorial.
COL_3_TEXT         | VARCHAR(2048)          | No             | Contains the text for column three of a memorial.
COL_4_TEXT         | VARCHAR(2048)          | No             | Contains the text for column four of a memorial.
COL_5_TEXT         | VARCHAR(2048)          | No             | Contains the text for column five of a memorial.
COL_6_TEXT         | VARCHAR(2048)          | No             | Contains the text for column six of a memorial.
COL_7_TEXT         | VARCHAR(2048)          | No             | Contains the text for column seven of a memorial.

### Relationships

 __Parent Entity__ | __Child Entity__ | __Relating Parent Attribute__ | __Relating Child Attribute__
:-----------------|:---------------|:-----------------------------|:----------------------------
Title Memorial     | Title Memorial Text | ID                         | TTM_ID

## Title Parcel Association [(https://data.linz.govt.nz/table/52008)](https://data.linz.govt.nz/table/52008)
### Description:
This entity is used to associate current titles to current spatial parcels.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__*ID*__           |INTEGER                 |Id used to link to the associated audit details. (Primary Key)
__TTL_TITLE_NO__   |VARCHAR(20)             |The title that is associated to the spatial parcel.
__PAR_ID__         |INTEGER                 |The id of the spatial parcel.
SOURCE             |VARCHAR(4)              |The source of the association. <br> See Reference Code Group TPDS for valid values. <br> LOL - sourced from Landonline Legal Description associations.<br> LINZ - sourced from other Landonline relationships eg Unit title to spatial parcel(s).<br> EXTL – sourced external to Landonline (from external agenciesand LINZ staff). These will be of variable quality.

## Transaction Type [(https://data.linz.govt.nz/table/52009)](https://data.linz.govt.nz/table/52009)
### Description:
This entity contains the different types of transactions managed through workflow, restricted to those used in titles instruments (GRP = ‘TINT’) and survey purpose (GRP = ‘WRKT’).

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__GRP__            | VARCHAR(4)             | Restricted to the Group for Instruments as used in the Ttl Inst (TIN) table and Work as used in the (WRK) table for survey purpose.
__TYPE__           | VARCHAR(4)             | Code used to identify the instrument type.
DESCRIPTION        | VARCHAR(100)           | Description of the instrument type.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details

## Unit Of Measure [(https://data.linz.govt.nz/table/51748)](https://data.linz.govt.nz/table/51748)
### Description:
This entity contains all units of measurement that are accepted into the CRS system.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__CODE__           | VARCHAR(4)             | Code to identify a unit of measurement. (Primary Key)
DESCRIPTION        | VARCHAR(100)           | Description of the unit of measurement eg Metre S.I., Links, Feet, Radians, etc.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details. (Primary Key)

## User [(https://data.linz.govt.nz/table/52062)](https://data.linz.govt.nz/table/52062)
### Description:
Landonline user details for surveyors or survey firms who have updated data in Landonline. <br>
__IMPORTANT__: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the [LINZ Licence For Personal Data 2.1](https://data.linz.govt.nz/license/linz-licence-personal-data-21/)
__Please ensure your use of this data does not breach any conditions of the Act.__

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
__ID__             | VARCHAR(20)            | Unique identifier of the user. (Primary Key)
TYPE               | VARCHAR(4)             | Type of user. Either Corporate or Person. <br> Refer Sys Code Group USRT for valid values.
STATUS             | VARCHAR(4)             | Status of user. <br> Refer Sys Code Group USRS for valid values.
TITLE              | VARCHAR(4)             | Title. Mr, Miss etc.
GIVEN_NAMES        | VARCHAR(30)            | User Given Names.
SURNAME            | VARCHAR(30)            | Users Surname.
CORPORATE_NAME     | VARCHAR(100)           | Corporation that user is associated with.
__*AUDIT_ID*__     | INTEGER                | Id used to link to the associated audit details.

## Vector [(https://data.linz.govt.nz/layer/51979)](https://data.linz.govt.nz/layer/51979)
### Description:
This entity stores the details required to draw and index observations spatially. Only records with linestring or null geometries are held in this table.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
TYPE               | VARCHAR(4)             | The type of vector Valid value is LINE (line). Refer Sys Code Group OBTV for valid values.
NOD_ID_START       | INTEGER                | The start node of the vector. <br>  This may be different from the local setup as the same vector will be used for all observations between the same two nodes.
NOD_ID_END         | INTEGER                | The end node of the vector. <br> This may be different from the remote setup as the same vector will be used for all observations between the same two nodes.
SOURCE             | INTEGER                | Used to determine the source of the vector. <br> Valid values for this field are: 0 - Pseudo observations only; 1 - At least  ne cadastral observation; 2 - At least one geodetic observation; 3 - At least one cadastral and one geodetic observation
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by Landonline. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__*ID*__           | INTEGER                | Primary Key
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
LENGTH             | DECIMAL(22,12)         | The approximate straight-line distance between the official co-ordinates of the end-points. Length is 0 if the vector is a point.
SHAPE              | GEOMETRY(LINE)         | The spatial representation of the vector.

## Vector Point [(https://data.linz.govt.nz/layer/51980)](https://data.linz.govt.nz/layer/51980)
### Description:
This entity stores the details required to draw and index observations spatially. <br>
Only records with point geometries are held in this table.

__Data Element__   | __Type (max. size)__   | __Notes__
:-----------|:-----------|:-----------------------------------
TYPE               | VARCHAR(4)             | The type of vector Valid value is POINT (point). Refer Sys Code Group OBTV for valid values.
NOD_ID_START       | INTEGER                | The start node of the vector. <br> This may be different from the local setup as the same vector will be used for all observations between the same two nodes.
NOD_ID_END         | INTEGER                | The end node of the vector. <br>  This may be different from the remote setup as the same vector will be used for all observations between the same two nodes.
SOURCE             | INTEGER                | Used to determine the source of the vector. <br> Valid values for this field are: 0 - Pseudo observations only; 1 - At least one cadastral observation; 2 - At least one geodetic observation; 3 - At least one cadastral and one geodetic observation
SE_ROW_ID          | INTEGER                | SE_ROW_ID is a unique key used internally by Landonline. NB the geometry stored at this location has been extracted into the SHAPE data element (below).
__*ID*__           | INTEGER                | Primary Key
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
LENGTH             | DECIMAL(22,12)         | The approximate straight-line distance between the official co-ordinates of the end-points. Length is 0 if the vector is a point.
SHAPE              | GEOMETRY(POINT)        | The spatial representation of the vector.

## Work [(https://data.linz.govt.nz/table/52014)](https://data.linz.govt.nz/table/52014)
### Description:
Provides details of the type of work being undertaken for, or supplied to Land Information NZ which has an impact on the Spatial Record.

__Data Element__   | __Type (max. size)__   | __Notes__
:-------------|:-----------|:-----------------------------------
__*ID*__           | INTEGER                | Unique identifier supplied by the system. (Primary Key)
TRT_GRP            | VARCHAR(4)             | The Group of Transaction e.g. Work, Instrument, Supporting Document or Request. <br> Refer Sys Code Group TRTG for valid values.
TRT_TYPE           | VARCHAR(4)             | Code used to identify a transaction Sub Type. <br> For work this will either be Mark Works, Network Scheme or the purpose of survey. See
STATUS             | VARCHAR(4)             | Defines the status of a piece of work. <br> Refer Sys Code Groups WRKC & WRKG for valid values.
CON_ID             | INTEGER                | The id of the contract related to the work
PRO_ID             | INTEGER                | Uniquely identifies a process. <br> This is used to integrate with workflow.
USR_ID_FIRM        | VARCHAR(20)            | The id of the firm that undertook the work
USR_ID_PRINCIPAL   | VARCHAR(20)            | The id of the external user that is considered to be responsible for the work. <br>  In the case of a geodetic works this will generally be the external approver of the work. In the case of the cadastral works, this will generally be the surveyor.
CEL_ID             | INTEGER                | The locality that the geodetic work relates to.
PROJECT_NAME       | VARCHAR(100)           | Project Name, used for Geodetic Work.
INVOICE            | VARCHAR(20)            | The invoice may be supplied as part of the work transaction (geodetic) and before authorisation can occur, the work's invoice must be supplied for payment to be initiated.
EXTERNAL_WORK_ID   | INTEGER                | External reference identifier
VIEW_TXN           | CHAR(1)                | This indicates whether a user sees a transaction in their transaction listing when preparing survey's and the transaction has been authorised. <br> Valid values are "Y" or "N". Default= "Y".
RESTRICTED         | CHAR(1)                | Whether access to this record is restricted. (Restricted records will have been filtered out by BDE)
LODGED_DATE        | DATETIME               | Date of lodgment of the work with Land Information NZ.
AUTHORISED_DATE    | DATETIME               | Date work was Authorised (i.e. date of approval).
USR_ID_AUTHORISED  | VARCHAR(20)            | Authorisor
VALIDATED_DATE     | DATE                   | Date of validation
USR_ID_VALIDATED   | VARCHAR(20)            | Validator
COS_ID             | INTEGER                | The coordinate system that the piece of work was performed in.
DATA_LOADED        | CHAR(1)                | Indicates whether the geodetic data file has been loaded
RUN_AUTO_RULES     | CHAR(1)                | Indicates when automatic business rules should be performed <br> Valid values are "Y" or "N".
ALT_ID             | INTEGER                | Where present, this is a transaction id that has established a lock on the record. Can be used as a warning that changes may be pending.
__AUDIT_ID__       | INTEGER                | Id used to link to the associated audit details.
USR_ID_PRIN_FIRM   | VARCHAR(20)            | Firm of the usr_id_principal that has lodged the work.












