# pr_2.pbix — Power BI Data Model Project

**Tool:** Power BI Desktop (Cloud) | **Version:** 2026.03 | **Schema:** Star Schema

---

## Tables in the Model

| Table | Type | Est. Columns |
|---|---|---|
| `Sales_Fact` | Fact Table (Central) | 8 |
| `Returns_Fact` | Fact Table (Secondary) | 4 |
| `Customer_Dim` | Dimension | 5 |
| `Product_Dim` | Dimension | 5 |
| `Date_Dim` | Dimension | 6 |
| `Region_Dim` | Dimension | 4 |

---

## Schema Design

**Star Schema** — `Sales_Fact` is the central fact table connected to four dimension tables. `Returns_Fact` is a secondary fact table linked to `Sales_Fact`, forming a Snowflake extension on one arm.

---

## Relationships

| From | To | Cardinality | Filter Direction | Status |
|---|---|---|---|---|
| `Sales_Fact` | `Customer_Dim` | Many : 1 | Single | ✅ Active |
| `Sales_Fact` | `Product_Dim` | Many : 1 | Single | ✅ Active |
| `Sales_Fact` | `Region_Dim` | Many : 1 | Single | ✅ Active |
| `Sales_Fact` | `Date_Dim` | Many : 1 | Single | ✅ Active |
| `Returns_Fact` | `Sales_Fact` | Many : 1 | Single | ✅ Active |
| `Returns_Fact` | `Date_Dim` | Many : 1 | Single | ❌ Inactive (ReturnDateKey) |

> The `Returns_Fact → Date_Dim` relationship on `ReturnDateKey` is kept **inactive** to avoid filter ambiguity — `Date_Dim` is already connected through `Sales_Fact`. Activated via `USERELATIONSHIP()` in DAX when needed.

---

## Hierarchies Confirmed in File

- **Region_Dim — Country Hierarchy:** `Country` → `State` → `City`
  - Data categories: Country (6), StateOrProvince (16), City (2)
- **Date_Dim:** includes `Fiscal Year` column (confirmed from visual queries)
- **Product_Dim:** `Category` confirmed; subcategory/product hierarchy also defined

---

## Confirmed Columns (from Visual Queries)

| Table | Column | Type | Format |
|---|---|---|---|
| `Product_Dim` | `Category` | Text | — |
| `Region_Dim` | `Country` | Text (Geographic) | — |
| `Region_Dim` | `State` | Text (StateOrProvince) | — |
| `Region_Dim` | `City` | Text (City) | — |
| `Sales_Fact` | `Revenue` | Currency (Decimal) | `$#,0.##` |
| `Date_Dim` | `Fiscal Year` | Text | — |
| `Returns_Fact` | `Reason` | Text | — |
| `Returns_Fact` | `ReturnID` | Whole Number | — |
| `Customer_Dim` | `Segment` | Text | — |

---

## Verification — Page 1 (3 Matrix Visuals)

### Matrix 1 — Sales by Product Category & Region
- **Rows:** `Product_Dim.Category`
- **Columns:** `Region_Dim` Country Hierarchy → `Country` > `State` > `City`
- **Values:** `Sum of Revenue` (formatted as `$`)
- **Tables joined:** `Product_Dim`, `Region_Dim`, `Sales_Fact`

### Matrix 2 — Return Reasons by Fiscal Year
- **Rows:** `Returns_Fact.Reason`
- **Columns:** `Date_Dim.Fiscal Year`
- **Values:** `Count of ReturnID`
- **Tables joined:** `Returns_Fact`, `Date_Dim`

### Matrix 3 — Revenue by Customer Segment
- **Rows:** `Customer_Dim.Segment`
- **Values:** `Sum of Revenue` (formatted as `$`)
- **Tables joined:** `Customer_Dim`, `Sales_Fact`

---

## Advanced Settings Applied

- All relationships use **Single cross-filter direction** (no bidirectional filters)
- `Returns_Fact → Date_Dim` deliberately set to **Inactive** to prevent ambiguous filter paths
- Geographic **Data Categories** confirmed: `Country`, `StateOrProvince`, `City` on `Region_Dim`
- `Revenue` formatted as **currency** (`$#,0.###############`)


<img width="1847" height="692" alt="Screenshot 2026-04-17 155347" src="https://github.com/user-attachments/assets/f176c4a1-8c9b-4be4-baad-db7c794d95c3" />

<img width="972" height="536" alt="image" src="https://github.com/user-attachments/assets/7ef115c2-d9fa-4afe-b2d7-67d2b1ae671c" />
