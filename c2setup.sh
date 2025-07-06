#!/usr/bin/bash

#!/usr/bin/bash
set -e

# --- change these three lines ---
DEFAULT_GITHUB_OWNER="FrogAi"     # GitHub user/org
DEFAULT_GITHUB_REPO="FrogPilot"   # repo name (was “openpilot”)
DEFAULT_GITHUB_BRANCH="v0.8.13"   # tag or branch you want
# --------------------------------

cd /data
rm -rf openpilot
time git clone \
     "https://github.com/${DEFAULT_GITHUB_OWNER}/${DEFAULT_GITHUB_REPO}.git" \
     openpilot -b "${DEFAULT_GITHUB_BRANCH}" \
     --recurse-submodules --depth 1

cd /data/data/com.termux/files
printf '#!/usr/bin/bash\n\ncd /data/openpilot\n./launch_openpilot.sh\n' > continue.sh
chmod +x continue.sh

echo "Install complete, rebooting..."
reboot
