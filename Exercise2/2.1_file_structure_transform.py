import os
import shutil

source_directory = "af-xpend-cost-etl-acc-wcavmhyp-afetlcost/costetl/v1"
destination_directory = "af-xpend-cost-etl-acc-wcavmhyp-afetlcost/costetl/v2"

for root, dirs, files in os.walk(source_directory):
    for file in files:
        date, batch, table, data = file.split("/")
        dest_dir = os.path.join(destination_directory, date, table)
        os.makedirs(dest_dir, exist_ok=True)
        shutil.move(os.path.join(root, file), os.path.join(dest_dir, f"{table}/{batch}/{data}"))
