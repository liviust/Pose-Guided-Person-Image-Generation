source ~/.bashrc

#######################################################################
################################ Testing ##############################
gpu=0
D_arch='DCGAN'
stage=2

model_dir=path_to_directory_of_model
start_step=0
pretrained_path=${model_dir}'/model.ckpt-'${start_step}

## Make sure dataset name appear in  --dataset  (i.e. 'Market' or 'DF')
python main.py --dataset=DF_test_data \
             --img_H=256  --img_W=256 \
             --batch_size=1 \
             --is_train=False \
             --model=11 \
             --D_arch=${D_arch} \
             --gpu=${gpu} \
             --z_num=64 \
             --model_dir=${model_dir} \
             --start_step=${start_step} --pretrained_path=${pretrained_path} \

## Score
python score.py ${stage} ${gpu} ${model_dir} 'test_result'
python score_mask.py ${stage} ${gpu} ${model_dir} 'test_result'
