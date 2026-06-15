from pathlib import Path
def export_table(df, output_path):
    """
    Export dataframe to csv.
    """
    df.to_csv(
        output_path,
        index=False
    )
    print(f"Exported: {output_path}")
def main():
    project_root = Path(__file__).resolve().parent.parent
    warehouse_path = project_root / "warehouse"
    warehouse_path.mkdir(
        parents=True,
        exist_ok=True
    )
    print("Warehouse export process initialized.")
if __name__ == "__main__":
    main()