export ANDROID_PLATFORM_TOOLS="$HOME/Library/Android/sdk/platform-tools"
export ANDROID_STUDIO_ROOT="/Applications/Android Studio.app/Contents/MacOS"

path=(
  $HOME/.local/bin
  "$ANDROID_PLATFORM_TOOLS"
  "$ANDROID_STUDIO_ROOT"
  $path
)
