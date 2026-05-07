# 📊 Student Performance Dashboard – Academic & Behavioral Insights

An interactive Power BI Dashboard designed to analyze academic performance, attendance trends, and behavioral patterns of students across different grades, subjects, and terms. This project showcases end-to-end Power BI skills — from data modeling and DAX to drillthrough pages, custom tooltips, bookmarks, and mobile layout.

---

## 🚀 Project Overview

Built as part of a Power BI exam assignment (2.5–3 hours, 50 marks), this multi-tab interactive report helps educators and analysts explore student data from both an academic and behavioral lens — complete with individual student drillthrough profiles and full mobile responsiveness.

---

## 📁 Project Files

| File | Description |
|------|-------------|
| 📄 `student_performance.pbix` | Main Power BI report file |
| 📁 `data.xlsx/` | Source CSV datasets |
| 📘 `readme.md` | Project documentation |

---

## 📂 Data Sources

| File | Key Columns |
|------|-------------|
| 👥 `Students.csv` | StudentID, Name, Gender, Class, Section |
| 📊 `Scores.csv` | StudentID, Subject, ExamType, Score, MaxScore, Term |
| 📅 `Attendance.csv` | StudentID, Date, Status (Present/Absent), Reason |
| 🧠 `Behavior.csv` | StudentID, Date, BehaviorType, Notes |

---

## 🧩 Task Breakdown

### 🔹 1. Data Modeling & Cleaning

- Imported all four datasets into Power BI using Power Query
- Established relationships between tables using `StudentID`
- Cleaned column names, fixed data types, and handled null/missing values

**Schema (Star Model):**

| From Table | Cardinality | To Table | Join Key |
|------------|-------------|----------|----------|
| Students.csv | 1 | Attendance.csv (Many) | StudentID |
| Students.csv | 1 | Behavior.csv (Many) | StudentID |
| Students.csv | 1 | Scores.csv (Many) | StudentID |

`Students.csv` acts as the central dimension table. All fact tables connect to it in a one-to-many relationship.

---

### 🔹 2. DAX Measures

All measures are organized inside a dedicated `Measure Management` table for clean access via the Fields Pane.

```DAX
% Score = DIVIDE(SUM('Scores csv'[Score]), SUM('Scores csv'[MaxScore]))

Avg Score per Subject = AVERAGEX(VALUES('Scores csv'[Subject]), [% Score])

Attendance % =
DIVIDE(
    COUNTROWS(FILTER('Attendance csv', 'Attendance csv'[Status] = "Present")),
    COUNTROWS('Attendance csv')
)

Behavior Count = COUNTROWS('Behavior csv')

Performance Category =
SWITCH(
    TRUE(),
    [% Score] >= 0.80, "High",
    [% Score] < 0.40, "Low",
    "Medium"
)
```

---

### 🔹 3. Report Pages & Visualizations

#### 📌 Home Page
Entry point of the report with navigation to other views.

#### 📌 Academic View
- **KPI Cards:** Total Students, Avg Score per Subject, Attendance %
- **Bar Chart:** Average Score by Subject (subject-level vs class-level)
- **Line Chart:** Performance trend across Term 1, 2, and 3
- **Table:** Student-wise scores with conditional formatting
  - 🟢 Green → % Score > 80%
  - 🔴 Red → % Score < 40%

#### 📌 Behavioral View
- **KPI Cards:** Total Incidents, Disruptive, Helpful, Participative counts
- **Clustered Bar Chart:** Behavior Count by BehaviorType
- **Donut Chart:** Behavior distribution breakdown
- **Slicer:** BehaviorType filter (Tile style)

#### 📌 Student Profile (Drillthrough)
- **KPI Cards:** % Score, Attendance %, Name, Performance Category, Section
- **Bar Chart:** % Score by Subject for the selected student
- **How to use:** In the Academic View table → Right-click any student → Drillthrough → Student Profile

#### 📌 Tooltip Page
A custom tooltip page that appears on hover over the Average Score by Subject chart. Shows a mini bar chart (Subject vs % Score) and a Class Avg card.

#### 📌 Storytelling Page
Narrative summary page tying together key insights from the data.

---

### 🔹 4. Interactivity Features

| Feature | Details |
|---------|---------|
| Slicers | Class (Range), Section (Tiles), Subject (Tiles), Term (Tiles) |
| Bookmarks | Two bookmarks for Academic and Behavioral views, used with navigation buttons |
| Drillthrough | Student Profile page as drillthrough destination from Academic View |
| Tooltip | Custom tooltip on hover over Average Score bar chart |
| Conditional Formatting | % Score column: Green > 80%, Red < 40% |

---

### 🔹 5. Measure Management

All DAX measures are stored in a single dedicated table called `Measure Management` inside the Fields Pane — keeping the model organized and easy to navigate.

---

### 🔹 6. Mobile Layout *(Completed)*

A mobile-optimized layout was built for the Academic View page — visuals rearranged vertically for the Power BI mobile app. KPI cards, bar chart, and line chart are all accessible in a clean scrollable single-column layout.

---

## 📊 Report Tab Summary

| Tab | Contents |
|-----|----------|
| Academic View | KPI Cards, Bar Chart, Line Chart, Conditional Table, Slicers |
| Behavioral View | KPI Cards, Bar Chart, Donut Chart, Slicer |
| Student Profile | Drillthrough page — individual KPIs + subject-wise chart |
| Tooltip | Custom hover tooltip — mini chart + Class Avg card |
| Storytelling | Insight narrative page |

---

## 📈 How to Use

1. Download or clone this repository
2. Open `Student_Performance_Dashboard.pbix` in Microsoft Power BI Desktop
3. Switch between views using the **Academic View** and **Behavioral View** bookmark buttons
4. Use slicers to filter by Class, Section, Subject, or Term
5. In the Academic View table, **right-click any student → Drillthrough → Student Profile**
6. Hover over bars in the Average Score chart to see the **custom Tooltip**
7. Open **Table View** to inspect DAX measures
8. Browse the **Fields Pane** to explore the Measure Management table

---

## 🛠️ Tools & Technologies

| Tool | Features Used |
|------|--------------|
| Power BI Desktop | Report View, Table View, Model View, Mobile Layout |
| DAX | Measures — SWITCH, DIVIDE, AVERAGEX, CALCULATE, FILTER, COUNTROWS |
| Power Query | Data import, type casting, null handling, column renaming |
| Bookmarks | Page navigation between Academic and Behavioral views |
| Drillthrough | Individual student profile page |
| Tooltips | Custom hover tooltip with mini visuals |
| Fields Pane | Organized Measure Management table |