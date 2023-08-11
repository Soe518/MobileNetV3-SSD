# To download the dataset

python3 open_images_downloader.py --root /media/data1/yanran/MobileNetV3-SSD/media/santiago/data/open_images --class_names "Cake,Bread" --num_workers 20

# First training the model

python3 train_ssd.py --dataset_type open_images --datasets /media/data1/yanran/MobileNetV3-SSD/media/santiago/data/open_images --net mb3-ssd-lite --scheduler cosine --lr 0.01 --t_max 100 --validation_epochs 5 --num_epochs 100 --base_net_lr 0.001 --batch_size 5

# Add the pretrained Model

python3 train_ssd.py --dataset_type open_images --datasets /media/data1/yanran/MobileNetV3-SSD/media/santiago/data/open_images --net mb3-ssd-lite --pretrained_ssd models/mb3-ssd-lite-Epoch-100-Loss-2.546770755521852.pth --scheduler cosine --lr 0.01 --t_max 100 --validation_epochs 5 --num_epochs 200 --base_net_lr 0.001 --batch_size 5

# Test on a video demo

python3 run_ssd_live_demo.py mb3-ssd-lite models/mb3-ssd-lite-Epoch-100-Loss-2.546770755521852.pth models/open-images-model-labels.txt

# Test on an Image

python3 run_ssd_example.py mb3-ssd-lite models/mb3-ssd-lite-Epoch-100-Loss-2.546770755521852.pth models/open-images-model-labels.txt /media/data1/yanran/MobileNetV3-SSD/picture/test.jpg