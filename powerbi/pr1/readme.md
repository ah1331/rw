# Power Query Practice — abc.pbix


## Data Sources (Actual Tables in Model)

| Table | Est. Columns | Description |
|---|---|---|
| `Sales Data 2020 csv` | ~15 | Sales transactions for 2020 |
| `Sales Data 2021 csv` | ~15 | Sales transactions for 2021 |
| `Sales Data 2022 csv` | ~15 | Sales transactions for 2022 |
| `Calendar Lookup csv` | ~4 | Date dimension table |
| `Product Lookup csv` | ~16 | Product master data |
| `1_Raw_Data` | ~16 | Raw combined/base dataset |
| `sales_product_merge` | ~16 | Merged sales + product query |
| `GDP forecast or estimate (million US$) by country` | ~9 | HTML web source (Wikipedia-style GDP data) |

---

## Transformations Performed

### 1. Data Extraction
- Loaded HTML table from the web (GDP forecast by country)
- Loaded 3 CSV sales files (2020, 2021, 2022) via Append Queries from Folder
- Loaded Calendar Lookup and Product Lookup from CSV

### 2. Basic Transformations
- Removed blank rows/columns, promoted headers, renamed columns
- Set correct data types (locale-aware for currency & dates)
- Removed duplicates and filtered null values

### 3. Text Tools
- Applied `UPPER()`, `LOWER()`, `TRIM()`, `CLEAN()`, `REPLACE()`
- Split name/address fields using **Split Column by Delimiter**

### 4. Numeric Tools
- Rounded revenue to 2 decimal places
- Added calculated column: `Profit = Revenue - Cost`

### 5. Date & Time Tools
- Extracted Day, Month, Year, Quarter from Order Date
- Created custom Fiscal Month column
- Calculated age from Birthdate

### 6. Conditional Columns & Indexing
- Added `Sales Category`: High (≥10,000) / Medium (5,000–9,999) / Low (<5,000)
- Added 0-based and 1-based Index columns

### 7. Pivoting & Unpivoting
- Pivoted monthly columns into a single column
- Unpivoted back to normalized form

### 8. Merging & Appending
- **Merged** Sales + Product Lookup → `sales_product_merge`
- **Appended** 2020, 2021, 2022 sales → `1_Raw_Data`

### 9. Grouping & Aggregation
- Grouped by Region → Total Sales, Avg Order Value, Transaction Count

### 10. Data Profiling & Quality
- Used Column Profile, Column Distribution, Column Quality
- Checked for missing values, errors, distinct/unique counts

### 11. Source Settings & Parameters
- Dynamic folder path configured via Parameters
- Credentials updated via Data Source Settings

### 12. Refresh Simulation
- Simulated adding a new monthly file to verify auto-load
- Confirmed all transformations persist after refresh
