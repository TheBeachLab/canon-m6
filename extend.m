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
