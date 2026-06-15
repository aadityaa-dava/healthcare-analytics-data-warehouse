from pathlib import Path
import pandas as pd
project_root = Path(__file__).resolve().parent.parent
warehouse_path = project_root / "warehouse"
def load_table(file_name):
    file_path = warehouse_path / file_name
    df = pd.read_csv(
        file_path,
        low_memory=False
    )
    print(f"Loaded: {file_name}")
    print(f"Shape : {df.shape}")
    return df
def main():
    dim_provider = load_table(
        "dim_provider.csv"
    )
    dim_location = load_table(
        "dim_location.csv"
    )
    dim_date = load_table(
        "dim_date.csv"
    )
    fact_provider_utilization = load_table(
        "fact_provider_utilization.csv"
    )
    print("\nWarehouse loaded successfully.")
    print("\nSummary")
    print("-" * 40)
    print(
        f"Providers : {len(dim_provider):,}"
    )
    print(
        f"Locations : {len(dim_location):,}"
    )
    print(
        f"Fact Rows : {len(fact_provider_utilization):,}"
    )
if __name__ == "__main__":
    main()