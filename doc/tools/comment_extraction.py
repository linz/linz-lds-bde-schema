#!/usr/bin/env python3

"""
Python script to extract notes from tables within markdown document to extract
as comments to PostgreSQL comment.

Converts the documentation table name to the stored database table name using
the mappings provided below.

"""
import sys

mappings = {
    "Action": "bde.crs_action",
    "Action_Type": "bde.crs_action_type",
    "Adjustment_Coefficient": "bde.crs_adjust_coef",
    "Adjustment_Method": "bde.crs_adjust_method",
    "Adjustment_Run": "bde_ext.adjustment_run",
    "Adjustment_User_Coefficient": "bde.crs_adj_user_coef",
    "Adoption": "bde.crs_adoption",
    "Affected_Parcel": "bde.crs_affected_parcl",
    "Alias": "bde_ext.alias",
    "Appellation": "bde.crs_appellation",
    "Comprised_In": "bde.crs_comprised_in",
    "Coordinate": "bde_ext.coordinate",
    "Coordinate_Order": "bde.crs_cord_order",
    "Coordinate_Precision": "bde.crs_cor_precision",
    "Coordinate_System": "bde.crs_coordinate_sys",
    "Coordinate_Type": "bde.crs_coordinate_tpe",
    "Datum": "bde.crs_datum",
    "Ellipsoid": "bde.crs_ellipsoid",
    "Electorate_Place": "bde.crs_elect_place",
    "Encumbrance": "bde_ext.encumbrance",
    "Encumbrance_Share": "bde_ext.enc_share",
    "Encumbrancee": "bde_ext.encumbrancee",
    "Estate_Share": "bde_ext.estate_share",
    "Feature_Name_Point": "bde_ext.feature_name_pt",
    "Feature_Name_Polygon": "bde_ext.feature_name_poly",
    "Land_District": "bde.crs_land_district",
    "Legal_Description": "bde_ext.legal_desc",
    "Legal_Description_Parcel": "bde.crs_legal_desc_prl",
    "Line": "bde_ext.line",
    "Locality": "bde.crs_locality",
    "Maintenance": "bde_ext.maintenance",
    "Map_Grid": "bde.crs_map_grid",
    "Mark": "bde_ext.mark",
    "Mark_Name": "bde_ext.mark_name",
    "Mark_Physical_State": "bde_ext.mark_phys_state",
    "Mark_Supporting_Document": "bde.crs_mark_sup_doc",
    "Node": "bde_ext.node",
    "Node_Proposed_Order": "bde_ext.node_prp_order",
    "Node_Works": "bde.crs_node_works",
    "Nominal_Index": "bde_ext.nominal_index",
    "Observation": "bde.crs_observation",
    "Observation_Accuracy": "bde.crs_obs_accuracy",
    "Observation_Element_Type": "bde.crs_obs_elem_type",
    "Observation_Set": "bde.crs_obs_set",
    "Observation_Type": "bde.crs_obs_type",
    "Office": "bde_ext.office",
    "Official_Coordinate_System": "bde.crs_off_cord_sys",
    "Ordinate_Adjustment": "bde.crs_ordinate_adj",
    "Ordinate_Type": "bde.crs_ordinate_type",
    "Parcel": "bde_ext.parcel",
    "Parcel_Boundary": "bde.crs_parcel_bndry",
    "Parcel_Dimension": "bde_ext.parcel_dimen",
    "Parcel_Label": "bde_ext.parcel_label",
    "Parcel_Linestring": "bde_ext.parcel_ls",
    "Parcel_Ring": "bde_ext.parcel_ring",
    "Proprietor": "bde_ext.proprietor",
    "Reduction_Method": "bde.crs_reduct_meth",
    "Reduction_Run": "bde.crs_reduct_run",
    "Reference_Survey": "bde.crs_ref_survey",
    "Road_Centre_Line": "bde.crs_road_ctr_line",
    "Road_Name_Association": "bde.crs_road_name_asc",
    "Setup": "bde.crs_setup",
    "Site": "bde.crs_site",
    "Site_Locality": "bde.crs_site_locality",
    "Statistical_Area": "bde_ext.statist_area",
    "Statistical_Version": "bde_ext.stat_version",
    "Statute": "bde.crs_statute",
    "Statute_Action": "bde.crs_statute_action",
    "Statutory_Action_Parcel": "bde.crs_stat_act_parcl",
    "Survey": "bde_ext.survey",
    "Survey_Admin_Area": "bde.crs_sur_admin_area",
    "Survey_Plan_Image_Revision": "bde_ext.survey_plan_image_revision",
    "Survey_Plan_Reference": "bde.crs_sur_plan_ref",
    "System_Code": "bde.crs_sys_code",
    "System_Code_Group": "bde.crs_sys_code_group",
    "Title": "bde_ext.title",
    "Title_Action": "bde_ext.title_action",
    "Title_Document_Reference": "bde_ext.title_doc_ref",
    "Title_Encumbrance": "bde_ext.ttl_enc",
    "Title_Estate": "bde_ext.title_estate",
    "Title_Hierarchy": "bde_ext.ttl_hierarchy",
    "Title_Instrument": "bde_ext.ttl_inst",
    "Title_Instrument_Title": "bde_ext.ttl_inst_title",
    "Title_Memorial": "bde_ext.title_memorial",
    "Title_Memorial_Text": "bde_ext.title_mem_text",
    "Title_Parcel_Association": "bde_ext.title_parcel_association",
    "Transaction_Type": "bde_ext.transact_type",
    "Unit_Of_Measure": "bde.crs_unit_of_meas",
    "User": "bde_ext.user",
    "Vector": "bde_ext.vector_ls",
    "Vector_Point": "bde_ext.vector_pt",
    "Work": "bde_ext.work",
    "NZ_Parcels": "lds.all_parcels",
    "NZ_Property_Titles_List": "lds.titles_aspatial",
    "NZ_Title_Memorials_List": "lds.title_memorials",
    "NZ_Title_Memorials_Additional_Text_List": "lds.title_memorial_additional_text",
    "NZ_Property_Title_Estates_List": "lds.title_estates",
    "NZ_Property_Title_Owners_List": "lds.title_owners_aspatial",
    "NZ_Title_Parcel_Association_List": "lds.title_parcel_associations",
    "NZ_Survey_Plans": "lds.survey_plans",
    "NZ_Survey_Affected_Parcels_List": "lds.affected_parcel_surveys",
    "NZ_Parcel_Statutory_Actions_List": "lds.parcel_stat_actions",
}

TABLE_NAME = "bde.crs"
NEWLINE = "<br>"
TABLE_SECTION = "---|"
DESCRIPTION = "## Description"
SUBHEADING = "## "
HEADING = "# "
COL_NAME_COL_TWO = False

BOLD1 = "__"
BOLD2 = "**"
ITALIC = "*"
NEXTLINE_SEEN = False

NOTES_COLUMN = 3


def wrap_to_character_limit_and_print(limit, line_in):
    excess_line = line_in[:limit][: line_in[:limit].rfind(" ")]
    if "\n" in excess_line:
        excess_line = excess_line[: excess_line.rfind("\n")]
    start = len(excess_line) + 1
    print(excess_line.strip())
    while len(line_in[start:]) > limit:
        excess_line = line_in[start : start + limit]
        excess_line = excess_line[: excess_line.rfind(" ")]
        if "\n" in excess_line:
            excess_line = excess_line[: excess_line.rfind("\n")]
        start += len(excess_line) + 1
        print(excess_line.strip())
    print(line_in[start:].strip())


if len(sys.argv) != 2:
    print("Syntax comment_extraction.py <input_file>", file=sys.stderr)
    sys.exit(1)

with open(sys.argv[1], encoding="utf-8") as fp:
    line = fp.readline()

    while line:
        # Remove bold and italic markdown
        line = (
            line.replace(BOLD1, "")
            .replace(BOLD2, "")
            .replace(ITALIC, "")
            .replace(NEWLINE, "\n")
        )
        # If Description in line, means that next lines are table description.
        if DESCRIPTION in line:
            print("COMMENT ON TABLE " + TABLE_NAME + " IS $comment$")
            COL_NAME_COL_TWO = False
            line = fp.readline()
            while "|" not in line:
                line = (
                    line.replace(BOLD1, "")
                    .replace(BOLD2, "")
                    .replace(ITALIC, "")
                    .replace(NEWLINE, "\n")
                )
                # Wrap lines to 80 characters
                if len(line) < 80:
                    print(line.strip())
                else:
                    wrap_to_character_limit_and_print(80, line)

                ##
                line = fp.readline()
            print("$comment$;\n")
            line = fp.readline()

            # Following description is table to retrieve column comments.
            while "|" not in line:
                line = fp.readline()

            # Use count of '|' to find the last column in table,
            # which will contain notes/description about row.
            NOTES_COLUMN = line.count("|")
            line = fp.readline()
            # While there are still table rows
            while line and line != "\n":
                line = (
                    line.replace(BOLD1, "")
                    .replace(BOLD2, "")
                    .replace(ITALIC, "")
                    .replace(NEWLINE, "\n")
                )
                row = line.split("|")
                if len(row) > NOTES_COLUMN:
                    if "||" in line.replace(" ", ""):
                        COL_NAME_COL_TWO = True
                        note = row[NOTES_COLUMN + 1][: len(row[NOTES_COLUMN + 1]) - 1]
                        note = note.lstrip()
                        print(
                            "COMMENT ON COLUMN "
                            + TABLE_NAME
                            + "."
                            + row[2].strip().lower()
                            + " IS $comment$"
                        )
                    elif COL_NAME_COL_TWO:
                        note = row[NOTES_COLUMN][: len(row[NOTES_COLUMN]) - 1]
                        note = note.lstrip()
                        print(
                            "COMMENT ON COLUMN "
                            + TABLE_NAME
                            + "."
                            + row[1].strip().lower()
                            + " IS $comment$"
                        )
                    else:
                        note = row[NOTES_COLUMN][: len(row[NOTES_COLUMN]) - 1]
                        note = note.lstrip()
                        print(
                            "COMMENT ON COLUMN "
                            + TABLE_NAME
                            + "."
                            + row[0].strip().lower()
                            + " IS $comment$"
                        )
                # Wrap lines to 80 characters
                if len(note) < 80:
                    print(note.strip())
                else:
                    wrap_to_character_limit_and_print(80, note)
                ##
                print("\n$comment$;\n")

                line = fp.readline()

        # If is a subheading then update table name
        elif SUBHEADING in line:
            nextline = fp.readline()
            NEXTLINE_SEEN = True
            if DESCRIPTION in nextline:
                templine = line.split(" ")
                NAME = ""
                for i in templine[1:]:
                    if i.replace("\n", "").isalpha():
                        NAME += i
                        NAME += "_"
                    else:
                        break
                NAME = NAME[: len(NAME) - 1].replace("\n", "")
                if NAME in mappings:
                    TABLE_NAME = mappings[NAME]
                else:
                    TABLE_NAME = NAME.lower()
                    print("Unkown Mappings for " + TABLE_NAME, file=sys.stderr)
                    sys.exit(1)
            line = nextline

        if not NEXTLINE_SEEN:
            line = fp.readline()
        else:
            NEXTLINE_SEEN = False
