import pandas as pd
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain

# 1️⃣ Load CSV
df = pd.read_csv("sales.csv")

# 2️⃣ Create summary (AI ne raw data nai aapvu ❌)
summary = {
    "columns": list(df.columns),
    "rows": len(df),
    "missing": df.isnull().sum().to_dict(),
    "stats": df.describe(include='all').to_string()
}

# 3️⃣ LLM (Gemini via LangChain)
llm = ChatGoogleGenerativeAI(
    model="gemini-1.5-flash",
    temperature=0.3
)

# 4️⃣ Prompt template (context + question)
template = """
You are a smart data analyst.

Dataset Info:
Columns: {columns}
Total Rows: {rows}
Missing Values: {missing}

Stats:
{stats}

User Question:
{question}

Give clear, short, business-friendly answer with reasoning.
"""

prompt = PromptTemplate(
    input_variables=["columns", "rows", "missing", "stats", "question"],
    template=template
)

# 5️⃣ Chain banavo
chain = LLMChain(llm=llm, prompt=prompt)

# 6️⃣ Ask Anything 🔥
while True:
    q = input("\nAsk about your data (type 'exit' to stop): ")
    if q.lower() == "exit":
        break

    response = chain.run({
        "columns": summary["columns"],
        "rows": summary["rows"],
        "missing": summary["missing"],
        "stats": summary["stats"],
        "question": q
    })

    print("\n🤖 AI Answer:\n", response)