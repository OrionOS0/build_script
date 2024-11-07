#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
# remove device
rm -rf device/xiaomi/mojito
rm -rf device/xiaomi/sm6150-common
# remove kernel
rm -rf kernel/xiaomi/mojito
# remove hardware
rm -rf hardware/xiaomi
# remove vendor
rm -rf vendor/xiaomi/mojito
rm -rf vendor/xiaomi/sm6150-common
# Initialize ROM manifest
repo init -u https://github.com/OrionOS-prjkt/android -b 14.0 --git-lfs
# repo sync
/opt/crave/resync.sh
# cloning DT
# remove vendor/qcom/opensource/libfmjni
rm -rf vendor/qcom/opensource/libfmjni
# remove packages/apps/FMRadio
rm -rf packages/apps/FMRadio
# device tree
git clone https://github.com/OrionOS0/device_xiaomi_mojito.git --depth 1 -b mojito-universe device/xiaomi/mojito
git clone https://github.com/OrionOS0/android_device_xiaomi_sm6150-common.git --depth 1 -b mojito-universe device/xiaomi/sm6150-common
# kernel tree
git clone https://github.com/OrionOS0/kernel_xiaomi_mojito.git --depth 1 -b inline-rom kernel/xiaomi/mojito
# vendor tree
git clone https://gitlab.com/Sepidermn/android_vendor_xiaomi_mojito.git --depth 1 -b 14 vendor/xiaomi/mojito
git clone https://gitlab.com/Sepidermn/android_vendor_xiaomi_sm6150-common.git --depth 1 -b 14 vendor/xiaomi/sm6150-common
# hardware tree
git clone https://github.com/OrionOS0/android_hardware_xiaomi.git --depth 1 -b mojito hardware/xiaomi
# add vendor/qcom/opensource/libfmjni
git clone https://github.com/OrionOS0/android_vendor_qcom_opensource_libfmjni.git --depth 1 -b lineage-21.0 vendor/qcom/opensource/libmjni
# add packages/apps/FMRadio
git clone https://github.com/OrionOS0/android_packages_apps_FMRadio.git --depth 1 -b lineage-21.0 packages/apps/FMRadio
# set build environment
. build/envsetup.sh
# lunch
lunch orion_mojito-ap2a-userdebug
# bacon
mka space
