from pathlib import Path
import pandas as pd
# Project paths
project_root = Path(__file__).resolve().parent.parent
warehouse_path = project_root / "warehouse"
sql_path = project_root / "sql"
# Load warehouse tables
dim_provider = pd.read_csv(
    warehouse_path / "dim_provider.csv",
    low_memory=False
)
dim_location = pd.read_csv(
    warehouse_path / "dim_location.csv",
    low_memory=False
)
dim_date = pd.read_csv(
    warehouse_path / "dim_date.csv",
    low_memory=False
)
fact_provider_utilization = pd.read_csv(
    warehouse_path / "fact_provider_utilization.csv",
    low_memory=False
)
print("Loaded Successfully")
print()
print("dim_provider")
print(dim_provider.shape)
print("\ndim_location")
print(dim_location.shape)
print("\ndim_date")
print(dim_date.shape)
print("\nfact_provider_utilization")
print(fact_provider_utilization.shape)