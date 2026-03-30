# IPL Matches Analysis — Excel Project

Dataset: IPL matches (2007–2022) | 1095 records | 20 columns

---

## Sheets

| Sheet | What's in it |
|---|---|
| 6_Dashboard | KPIs, team table, venue table, summary chart |
| 1_Raw_Data | Full cleaned dataset |
| 2_Data_Cleaning | Log of every fix made to raw data |
| 3_Pivot_Tables | Team wins, toss decision split, season stats |
| 4_Advanced_Formulas | VLOOKUP, INDEX-MATCH, IF, COUNTIF, SUMIF, RANK |
| 5_Charts | Bar + Pie + Line charts, conditional formatting |
| 7_Documentation | Column definitions, sheet index |

---

## Cleaning Done

- Filled missing values: `city`, `player_of_match`, `winner`, `method`
- Filled missing numerics with `0`: `result_margin`, `target_runs`, `target_overs`
- Standardized `date` to datetime, `season` to string
- Removed duplicate rows

---

## Files

- `IPL_Simple.xlsx` — main workbook
- `matches.xlsx` — original source data