#! /bin/bash
export SFM_DIR="/opt/openSFM/OpenSfM"
export DATASET_DIR="$SFM_DIR/data/dataset1_gdrive"
cd $SFM_DIR
SECONDS=0
./bin/run_all $DATASET_DIR
runall_time=$SECONDS
./bin/opensfm undistort $DATASET_DIR
undistort_time=`expr $SECONDS - $runall_time`
./bin/opensfm compute_depthmaps $DATASET_DIR
depthmaps_time=`expr $SECONDS - $undistort_time`
./bin/opensfm export_openmvs $DATASET_DIR
export_time=`expr $SECONDS - $depthmaps_time`

echo "Dataset path: $DATASET_DIR"
echo "Time taken for run_all: $runall_time"
echo "Time taken for undistort: $undistort_time"
echo "Time taken for depthmamps: $depthmaps_time"
echo "Time taken for exporting: $export_time"
echo "Total time taken: $SECONDS"
