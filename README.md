> [!CAUTION]
> Configuration and images in this repository are intended for my personal usage only, I strongly recommend not using them directly as they may change in unpredictable ways. The same currently applies to the repository itself.

The images live at registry.uncontrol.me/ver4a/onc-kde

These tags are currently used:

- `:main` latest base image
- `:main-nvidia` latest base image with nvidia drivers layered
- `:main-ver4a` latest base image with my own personal customizations layared
- `:main-nvidia-ver4a` same as `:main-ver4a` but based on nvidia layer

For all tags above, there is a corresponding full-versioned variant, the general format is `:BASE_IMAGE_VERSION-LAYERS`, so for example `:42.20250429.0-nvidia`.

These tags are not immutable, they might (and do) change, usually if builds are done out of schedule by commits. These versioned tags also expire after 4 weeks.
