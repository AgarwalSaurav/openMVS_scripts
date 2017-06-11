#!/bin/bash

command -v mogrify >/dev/null 2>&1 || { echo >&2 "I require imagemagick but it's not installed.  Aborting."; exit 1; }

FILE_NAME_PNG=~/Downloads/mvs_runs/dataset1/scene_dense_mesh_refine_texture.png

cp $FILE_NAME_PNG $FILE_NAME_PNG.org

mogrify -resize 50% $FILE_NAME_PNG
