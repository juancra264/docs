#!/bin/sh

# #############################################################################
## Set Colors for echo messages
# #############################################################################
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

# #############################################################################
# ## First script message
# #############################################################################

echo "${blue}Starting script${reset}"
sleep 1

# #############################################################################
# ## Go to the last line to see the main() function
# #############################################################################

# #############################################################################
# ## Functions Declarations
# #############################################################################

# Function check user root
f_check_root() {
    if (($EUID == 0)); then
        # If user is root, continue to function f_sub_main
        f_sub_main
    else
        # If user not is root, print message and exit script
        echo "${red}Please run this script as root !${reset}"
        exit
    fi
}

# Function check user root
f_dummy() {
    echo "${green}Dummy function....${reset}"
}

# #############################################################################
# The sub main function, use to call neccessary functions of installation
# #############################################################################
f_sub_main() {
    f_dummy
    sleep 1
}

# #############################################################################
# The main function
# #############################################################################
f_main() {
    f_check_root
}

# Call the main function.
f_main
exit
