#! /bin/bash
# ===== PBS OPTIONS =====
### Set the job name
#PBS -N "JobSFM"
### Run in the queue named "copperhead"
#PBS -q copperhead
### Specify the number of cpus for your job.
#PBS -l nodes=1:ppn=16:gpus=1
#PBS -l mem=64GB
#PBS -l walltime=24:00:00
# ==== Main ======
module load intel openmpi
module load cuda
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/users/sagarw10/opt/CGAL-4.9/lib

export MVS_DIR="/users/sagarw10/opt/openMVS_updated/openmvs_build/bin"
export DATA_DIR="/users/sagarw10/opt/openSFM/OpenSfM/data/dataset1_gdrive/openmvs"
SECONDS=0
$MVS_DIR/DensifyPointCloud $DATA_DIR/scene.mvs
dpc_time=$SECONDS
$MVS_DIR/ReconstructMesh $DATA_DIR/scene_dense.mvs
recm_time=`expr $SECONDS - $dpc_time`
$MVS_DIR/RefineMesh $DATA_DIR/scene_dense_mesh.mvs
refm_time=`expr $SECONDS - $recm_time`
$MVS_DIR/TextureMesh $DATA_DIR/scene_dense_mesh_refine.mvs
tm_time=`expr $SECONDS - $refm_time`

echo "Dataset path: $DATA_DIR"
echo "Time taken for DensifyPointCloud: $dpc_time"
echo "Time taken for ReconstructMesh: $recm_time"
echo "Time taken for RefineMesh: $refm_time"
echo "Time taken for TextureMesh: $tm_time"
echo "Total time taken is: $SECONDS"
