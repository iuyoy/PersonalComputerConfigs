import sys
import os

ps = """
cp `$PROFILE` ''

"""

END_SYNC_SIGNAL = "# Do not Sync Below #"
REPLACE_SYNC_SIGNAL = "# Used to Sync:"

def syncWindowsProfile(save_path = '../windows/profile.ps1'):
    cmd = "powershell echo $PROFILE"
    profile_path = os.popen(cmd).read()[:-1]
    print(f"Powershell Profile location: {profile_path}")
    with open(profile_path, 'r') as rp, open(save_path, 'w') as wp:
        for line in rp:
            if line.startswith(END_SYNC_SIGNAL):
                break
            if REPLACE_SYNC_SIGNAL in line:
                line = line.split(REPLACE_SYNC_SIGNAL)[-1]
            wp.write(line)

    
if __name__ == "__main__":
    syncWindowsProfile()
