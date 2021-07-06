# Really stupid script to install clyrics on ubuntu
# this script installs clyrics for all users
# Can also update
#
# @author: ThePotatoChronicler

# If any of the commands fails, exits the script,
# to prevent any possible further damage
set -e

# Clears old plugins, if they exist
sudo rm -rf '/usr/share/clyrics'

# Makes sure the folder we need for installation exist
# it will probably exist already, but you never know
sudo mkdir -p '/usr/local/bin/'

# We need git to clone the source/program
sudo apt-get -y install git

# Perl to run the program
sudo apt-get -y install perl
# cpan to install dependencies
sudo apt-get -y install cpanminus

# clyrics dependencies
sudo cpan WWW::Mechanize LWP::Protocol::https

# Clones clyrics source into /tmp
CLYRS='/tmp/clyrics-source'
git clone git://github.com/trizen/clyrics "$CLYRS"

# Moves the program into /usr/local/bin
# which is usually in PATH
sudo mv -f "$CLYRS/clyrics" '/usr/local/bin/clyrics'
# Moves clyrics plugins into default directory
sudo mv -f "$CLYRS/plugins" '/usr/share/clyrics'
# Makes clyrics executable by everyone
sudo chmod +x "/usr/local/bin/clyrics"

# Removes clyrics source, we don't need it anymore
rm -rf "$CLYRS"

# A nice message assuring the user that they haven't just given up their life
printf "\n\e[92mEverything should hopefully be fine, since the program got all the way here\e[39m\n"
