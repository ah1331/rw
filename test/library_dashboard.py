import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


class LibraryDashboard:
    def __init__(self):
        self.df = None

    def load_data(self, file_path):
        try:
            self.df = pd.read_csv(file_path)

            required_columns = [
                "Transaction ID", "Date", "User ID",
                "Book Title", "Genre", "Borrowing Duration (Days)"
            ]

            for col in required_columns:
                if col not in self.df.columns:
                    raise ValueError(f"Missing column: {col}")

            self.df["Date"] = pd.to_datetime(self.df["Date"], errors='coerce')          
            print("Data loaded successfully!")

        except Exception as e:
            print("Error loading data:", e)

    def calculate_statistics(self):
        print("\nSTATISTICS:")

        most_borrowed = self.df["Book Title"].value_counts().idxmax()
        print("Most Borrowed Book:", most_borrowed)

        avg_duration = np.mean(self.df["Borrowing Duration (Days)"])
        print("Average Borrowing Duration:", round(avg_duration, 2), "days")

        busiest_day = self.df["Date"].dt.date.value_counts().idxmax()
        print("Busiest Day:", busiest_day)

    def filter_transactions(self, genre=None, start_date=None, end_date=None):
        filtered = self.df.copy()

        if genre:
            filtered = filtered[filtered["Genre"] == genre]

        if start_date:
            filtered = filtered[filtered["Date"] >= pd.to_datetime(start_date)]

        if end_date:
            filtered = filtered[filtered["Date"] <= pd.to_datetime(end_date)]

        print("\nFiltered Data:")
        print(filtered.head())

        return filtered

    def generate_report(self):
        print("\nREPORT SUMMARY")
        print(self.df.describe(include='all'))

    def visualize_data(self):

        # Bar chart - Top 5 books
        top_books = self.df["Book Title"].value_counts().head(5)
        plt.figure()
        top_books.plot(kind='bar')
        plt.title("Top 5 Most Borrowed Books")
        plt.xlabel("Book Title")
        plt.ylabel("Count")
        plt.xticks(rotation=45)
        plt.show()

        # Line graph - Monthly trends
        self.df["Month"] = self.df["Date"].dt.to_period("M")
        monthly = self.df.groupby("Month").size()

        plt.figure()
        monthly.plot(kind='line')
        plt.title("Monthly Borrowing Trends")
        plt.xlabel("Month")
        plt.ylabel("Transactions")
        plt.show()

        # Pie chart - Genre distribution
        genre_counts = self.df["Genre"].value_counts()
        plt.figure()
        genre_counts.plot(kind='pie', autopct='%1.1f%%')
        plt.title("Genre Distribution")
        plt.ylabel("")
        plt.show()

        # Heatmap - Day vs Hour
        self.df["Day"] = self.df["Date"].dt.day_name()
        self.df["Hour"] = self.df["Date"].dt.hour

        pivot = self.df.pivot_table(index="Day", columns="Hour", aggfunc="size", fill_value=0)

        plt.figure()
        sns.heatmap(pivot)
        plt.title("Borrowing Activity Heatmap")
        plt.show()

# ---------------- MAIN PROGRAM ---------------- #

def main():
    dashboard = LibraryDashboard()

    while True:
        print("\n====== E-Library Dashboard ======")
        print("1. Load Data")
        print("2. View Statistics")
        print("3. Filter Data")
        print("4. Generate Report")
        print("5. Visualize Data")
        print("6. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            path = input("Enter CSV file path: ")
            dashboard.load_data(path)

        elif choice == "2":
            dashboard.calculate_statistics()

        elif choice == "3":
            genre = input("Enter Genre (or leave blank): ")
            start = input("Start Date (YYYY-MM-DD or blank): ")
            end = input("End Date (YYYY-MM-DD or blank): ")

            dashboard.filter_transactions(
                genre if genre else None,
                start if start else None,
                end if end else None
            )

        elif choice == "4":
            dashboard.generate_report()

        elif choice == "5":
            dashboard.visualize_data()

        elif choice == "6":
            print("Exiting...")
            break

        else:
            print("Invalid choice")


if __name__ == "__main__":
    main()