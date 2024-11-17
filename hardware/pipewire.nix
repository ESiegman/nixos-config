{ ... }:

{
    sound.enable = true;
    security.rtKit.enable = true;
    service.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
}
