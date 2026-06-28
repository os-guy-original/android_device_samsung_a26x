#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:6e2552dd8fe7317618f956748cd173d252b40710; then
  applypatch \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):67108864:c79428777dc8923a68424d4952245596aa69953d \
          --target EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:6e2552dd8fe7317618f956748cd173d252b40710 && \
      (log -t install_recovery "Installing new recovery image: succeeded" && setprop vendor.ota.recovery.status 200) || \
      (log -t install_recovery "Installing new recovery image: failed" && setprop vendor.ota.recovery.status 454)
else
  log -t install_recovery "Recovery image already installed" && setprop vendor.ota.recovery.status 200
fi

