#! /bin/bash

# choose other inputs src img and reference images
#src_path="./assets/samples/src_imgs/men1_256.jpg"
src_path="./assets/samples/src_imgs/009_5_1_000.jpg"
tgt_path="./assets/samples/ref_imgs/024_8_2"

##
gpu=0
gen_name="impersonator"
name="imper_results"
checkpoints_dir="./outputs/checkpoints/"
output_dir="./outputs/results/"

## if use ImPer dataset trained model
#load_path="./outputs/checkpoints/lwb_imper/net_epoch_30_id_G.pth"

## if use ImPer and Place datasets trained model
#load_path="./outputs/checkpoints/lwb_imper_place/net_epoch_30_id_G.pth"

## if use ImPer, DeepFashion, and Place datasets trained model
load_path="./outputs/checkpoints/lwb_imper_fashion_place/net_epoch_30_id_G.pth"

## if use DeepFillv2 trained background inpainting network,
bg_model="./outputs/checkpoints/deepfillv2/net_epoch_50_id_G.pth"
## otherwise, it will use the BGNet in the original LiquidWarping GAN
#bg_model="ORIGINAL"

python demo_imitator.py --gpu_ids ${gpu} \
    --model imitator \
    --gen_name impersonator \
    --image_size 256 \
    --name ${name}  \
    --checkpoints_dir ${checkpoints_dir} \
    --bg_model ${bg_model}      \
    --load_path ${load_path}    \
    --output_dir ${output_dir}  \
    --src_path   ${src_path}    \
    --tgt_path   ${tgt_path}    \
    --bg_ks 11 --ft_ks 3         \
    --has_detector  --post_tune  --save_res \
    --ip http://10.10.10.100 --port 31102
