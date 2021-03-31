# Canon M6 Clean HDMI Overlay and Display ON indefinitely

Instructions for Linux

- Step 1: Format a SD card in the camera with the low level flag checked
- Step 2: Insert the SD card in the computer and check the device name with `lsblk`
- Step 3: Make sure the SD card is formatted as FAT32 with `sudo fdisk -l`
- Step 4: Run the script. I assume the SD is in `/dev/sda1` so `sudo ./makeScriptCard.sh /dev/sda1`
- Step 6: Check for files `extend.m` and `script.req` in `/mnt` with `ls /mnt`
- Step 7: Copy the new `extend.m` to `/mnt` with `sudo cp extend.m /mnt`
- Step 8: Make sure the script is there with `cat /mnt/extend.m` you should see

```
DIM palette_buffer_ptr = 0x11d4c
DIM active_palette_buffer = 0x11d44
DIM palette_to_zero = 0
 
private sub RegisterProcs()
    System.Create()
    ExecuteEventProcedure("UI.CreatePublic")
end sub
 
private sub Initialize()
    RegisterProcs()
    LockMainPower()
    adr = *palette_buffer_ptr
    adr = adr + (palette_to_zero * 4)
    if *adr <> 0 then
        adr = *adr + 4
        memset(adr, 0, 256 * 4)
    end if
end sub
```

- Step 9: Unmount the card `sudo umount /mnt`
- Step 10: Place the SD card back in the camera and switch the camera ON. If you see `No memory card` switch the camera OFF and back ON **while pressing SET**. After switching ON the camera, enter playback mode and press SET. If the card is correctly prepared, that should cause the script to execute. Go back to shooting mode and check whether the overlay is there. If you see no overlay, the script has successfully run. The script should have been executed and you should have clean overlay and the display should stay ON indefinitely.

> NOTE: You have to execute step 10 **every time** you switch ON the camera!

Information obtained from <https://chdk.setepontos.com/index.php?topic=13489.0>
