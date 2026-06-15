import pandas as pd
df = pd.read_csv("data/raw/claims.csv")
sample_df = df.sample(
    n=1000,
    random_state=42
)
sample_df.to_csv("data/sample/claims_sample.csv", index=False)
print("Sample dataset created.")
print(sample_df.shape)
