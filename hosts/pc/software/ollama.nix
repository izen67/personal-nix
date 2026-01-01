{ config, pkgs, inputs, ... }:

{
  services.ollama = {
    enable = true;

    # Use the ROCm-enabled build of Ollama
    package = pkgs.ollama-rocm;

    # GPU acceleration
    acceleration = "rocm";
    rocmOverrideGfx = "12.0.0";

    # Runtime + networking
    user = "ollama";
    group = "ollama";
    port = 11434;
    host = "127.0.0.1";
    home = "/var/lib/ollama";
    openFirewall = false;

    # Optional model handling
    syncModels = true;
    loadModels = [ ];

    environmentVariables = {
      OLLAMA_NUM_PARALLEL = "1";
      HCC_AMDGPU_TARGET = "gfx1200";
    };
  };
}
