#!/bin/bash

# =============================================
# W4R PENETRATION TOOLKIT - PARROT OS 6.3
# =============================================
# Author: W4rm4st3r
# Version: 2.1
# Last Updated: 2025-01-15
# =============================================

# Color Definitions
RED='\033[0;31m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;36m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Check root privileges
if [ "$(id -u)" != "0" ]; then
   echo -e "${RED}[!] This script must be run as root${NC}" 1>&2
   exit 1
fi

# Banner
function show_banner() {
    clear
    echo -e "${ORANGE}=====================================================${NC}"
    echo -e "${RED}╦ ╦┌─┐┬─┐  ╦ ╦╦ ╦  ${NC}   ${YELLOW}By: W4rm4st3r${NC}"
    echo -e "${RED}║║║├─┤├┬┘  ║ ║║ ║  ${NC}   ${LIGHT_BLUE}Penetration Framework${NC}"
    echo -e "${RED}╚╩╝┴ ┴┴└─  ╚═╝╩═╝  ${NC}   ${GREEN}v2.1${NC}"
    echo -e "${ORANGE}=====================================================${NC}"
    echo -e "${GREEN}   Red Team  ${NC}|${PURPLE}  Blue Team  ${NC}|${YELLOW} Forensics${NC}"
    echo -e "${ORANGE}=====================================================${NC}"
}

# Pause function
function pause() {
    echo -e ""
    echo -e -n "${LIGHT_BLUE}[*] Press [Enter] to continue...${NC}"
    read -r
}

# Main Menu
function main_menu() {
    while true; do
        show_banner
        echo -e "${GREEN} MAIN MENU${NC}"
        echo -e ""
        echo -e "${ORANGE} 1.${NC} ${YELLOW}Red Team Tools${NC}       ${ORANGE}4.${NC} ${YELLOW}Forensic Tools${NC}"
        echo -e "${ORANGE} 2.${NC} ${YELLOW}Blue Team Tools${NC}      ${ORANGE}5.${NC} ${YELLOW}System Utilities${NC}"
        echo -e "${ORANGE} 3.${NC} ${YELLOW}Wireless Assessment${NC}  ${ORANGE}6.${NC} ${YELLOW}Exit${NC}"
        echo -e ""
        echo -e "${ORANGE}=====================================================${NC}"
        echo -e -n "${LIGHT_BLUE}[+] Select option [1-6]: ${NC}"
        read -r choice

        case $choice in
            1) redteam_menu ;;
            2) blueteam_menu ;;
            3) wireless_menu ;;
            4) forensic_menu ;;
            5) utilities_menu ;;
            6) echo -e "${YELLOW}[+] Exiting...${NC}"; exit 0 ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; pause ;;
        esac
    done
}

# Red Team Menu
function redteam_menu() {
    while true; do
        show_banner
        echo -e "${RED} RED TEAM TOOLS${NC}"
        echo -e ""
        echo -e "${ORANGE} 1.${NC} ${YELLOW}Reconnaissance${NC}       ${ORANGE}    5.${NC} ${YELLOW}Password Attacks${NC}"
        echo -e "${ORANGE} 2.${NC} ${YELLOW}Vulnerability Scanning${NC} ${ORANGE}  6.${NC} ${YELLOW}Post-Exploitation${NC}"
        echo -e "${ORANGE} 3.${NC} ${YELLOW}Exploitation Tools${NC}    ${ORANGE}   7.${NC} ${YELLOW}Social Engineering${NC}"
        echo -e "${ORANGE} 4.${NC} ${YELLOW}Web Application Testing${NC} ${ORANGE} 8.${NC} ${YELLOW}Return to Main Menu${NC}"
        echo -e ""
        echo -e "${ORANGE}=================================================================================================${NC}"
        echo -e -n "${LIGHT_BLUE}[+] Select option [1-8]: ${NC}"
        read -r choice

        case $choice in
            1) 
                echo -e "${YELLOW}[*] Launching Reconnaissance Tools...${NC}"
                recon_menu
                ;;
            2)
                echo -e "${YELLOW}[*] Launching Vulnerability Scanners...${NC}"
                vulnscan_menu
                ;;
            3)
                echo -e "${YELLOW}[*] Launching Exploitation Framework...${NC}"
                exploit_menu
                ;;
            4)
                echo -e "${YELLOW}[*] Launching Web Application Tools...${NC}"
                webapp_menu
                ;;
            5)
                echo -e "${YELLOW}[*] Launching Password Attack Tools...${NC}"
                password_menu
                ;;
            6)
                echo -e "${YELLOW}[*] Launching Post-Exploitation Tools...${NC}"
                postexploit_menu
                ;;
            7)
                echo -e "${YELLOW}[*] Launching Social Engineering Toolkit...${NC}"
                setoolkit
                pause
                ;;
            8) return ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; pause ;;
        esac
    done
}

# Reconnaissance Submenu
function recon_menu() {
    while true; do
        show_banner
        echo -e "${RED} RECONNAISSANCE TOOLS${NC}"
        echo -e ""
        echo -e "${ORANGE} 1.${NC} ${YELLOW}Nmap - Network Mapper${NC}"
        echo -e "${ORANGE} 2.${NC} ${YELLOW}Recon-ng - Web Recon${NC}"
        echo -e "${ORANGE} 3.${NC} ${YELLOW}Maltego - Visual Intel${NC}"
        echo -e "${ORANGE} 4.${NC} ${YELLOW}theHarvester - Email/Subdomain${NC}"
        echo -e "${ORANGE} 5.${NC} ${YELLOW}DNS Enumeration${NC}"
        echo -e "${ORANGE} 6.${NC} ${YELLOW}Return to Previous Menu${NC}"
        echo -e ""
        echo -e "${ORANGE}=============================================${NC}"
        echo -e -n "${LIGHT_BLUE}[+] Select option [1-6]: ${NC}"
        read -r choice

        case $choice in
            1)
                echo -e -n "${YELLOW}[+] Enter target IP/range: ${NC}"
                read -r target
                nmap -sV -sC -A -T4 "$target"
                pause
                ;;
            2)
                recon-ng
                pause
                ;;
            3)
                maltego
                pause
                ;;
            4)
                echo -e -n "${YELLOW}[+] Enter domain to harvest: ${NC}"
                read -r domain
                theHarvester -d "$domain" -b all
                pause
                ;;
            5)
                echo -e -n "${YELLOW}[+] Enter domain for DNS enum: ${NC}"
                read -r domain
                dnsenum "$domain"
                pause
                ;;
            6) return ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; pause ;;
        esac
    done
}

# Blue Team Menu (similar structure with defensive tools)
function blueteam_menu() {
    while true; do
        show_banner
        echo -e "${PURPLE} BLUE TEAM TOOLS${NC}"
        echo -e ""
        echo -e "${ORANGE} 1.${NC} ${YELLOW}Network Monitoring${NC}     ${ORANGE} 4.${NC} ${YELLOW}Log Analysis${NC}"
        echo -e "${ORANGE} 2.${NC} ${YELLOW}Intrusion Detection${NC}    ${ORANGE} 5.${NC} ${YELLOW}Malware Analysis${NC}"
        echo -e "${ORANGE} 3.${NC} ${YELLOW}System Hardening${NC}      ${ORANGE}  6.${NC} ${YELLOW}Return to Main Menu${NC}"
        echo -e ""
        echo -e "${ORANGE}============================================================================================${NC}"
        echo -e -n "${LIGHT_BLUE}[+] Select option [1-6]: ${NC}"
        read -r choice

        case $choice in
            1)
                echo -e "${YELLOW}[*] Launching Network Monitoring Tools...${NC}"
                netmon_menu
                ;;
            2)
                echo -e "${YELLOW}[*] Launching IDS/IPS Tools...${NC}"
                ids_menu
                ;;
            3)
                echo -e "${YELLOW}[*] Launching Hardening Tools...${NC}"
                hardening_menu
                ;;
            4)
                echo -e "${YELLOW}[*] Launching Log Analysis Tools...${NC}"
                loganalysis_menu
                ;;
            5)
                echo -e "${YELLOW}[*] Launching Malware Analysis Tools...${NC}"
                malware_menu
                ;;
            6) return ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; pause ;;
        esac
    done
}

# Wireless Assessment Menu
function wireless_menu() {
    while true; do
        show_banner
        echo -e "${LIGHT_BLUE} WIRELESS ASSESSMENT TOOLS${NC}"
        echo -e ""
        echo -e "${ORANGE} 1.${NC} ${YELLOW}WiFi Scanning${NC}         ${ORANGE}4.${NC} ${YELLOW}WPS Attacks${NC}"
        echo -e "${ORANGE} 2.${NC} ${YELLOW}Packet Capture${NC}        ${ORANGE}5.${NC} ${YELLOW}RFID Tools${NC}"
        echo -e "${ORANGE} 3.${NC} ${YELLOW}WPA/WPA2 Cracking${NC}     ${ORANGE}6.${NC} ${YELLOW}Return to Main Menu${NC}"
        echo -e ""
        echo -e "${ORANGE}==========================================================================================${NC}"
        echo -e -n "${LIGHT_BLUE}[+] Select option [1-6]: ${NC}"
        read -r choice

        case $choice in
            1)
                airodump-ng wlan0
                pause
                ;;
            2)
                echo -e -n "${YELLOW}[+] Enter output file name: ${NC}"
                read -r outfile
                airodump-ng -w "$outfile" wlan0
                pause
                ;;
            3)
                echo -e "${YELLOW}[*] Launching WPA Cracking Tools...${NC}"
                wpa_menu
                ;;
            4)
                echo -e -n "${YELLOW}[+] Enter BSSID: ${NC}"
                read -r bssid
                reaver -i wlan0 -b "$bssid" -vv
                pause
                ;;
            5)
                echo -e "${YELLOW}[*] Launching RFID Tools...${NC}"
                rfid_menu
                ;;
            6) return ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; pause ;;
        esac
    done
}

# Forensic Tools Menu
function forensic_menu() {
    while true; do
        show_banner
        echo -e "${YELLOW} FORENSIC TOOLS${NC}"
        echo -e ""
        echo -e "${ORANGE} 1.${NC} ${YELLOW}Memory Analysis${NC}       ${ORANGE}4.${NC} ${YELLOW}File Carving${NC}"
        echo -e "${ORANGE} 2.${NC} ${YELLOW}Disk Analysis${NC}         ${ORANGE}5.${NC} ${YELLOW}Network Forensics${NC}"
        echo -e "${ORANGE} 3.${NC} ${YELLOW}Mobile Forensics${NC}      ${ORANGE}6.${NC} ${YELLOW}Return to Main Menu${NC}"
        echo -e ""
        echo -e "${ORANGE}==========================================================================================${NC}"
        echo -e -n "${LIGHT_BLUE}[+] Select option [1-6]: ${NC}"
        read -r choice

        case $choice in
            1)
                echo -e "${YELLOW}[*] Launching Memory Analysis Tools...${NC}"
                memory_menu
                ;;
            2)
                echo -e "${YELLOW}[*] Launching Disk Analysis Tools...${NC}"
                disk_menu
                ;;
            3)
                echo -e "${YELLOW}[*] Launching Mobile Forensic Tools...${NC}"
                mobile_menu
                ;;
            4)
                echo -e -n "${YELLOW}[+] Enter image file to carve: ${NC}"
                read -r image
                foremost -i "$image"
                pause
                ;;
            5)
                echo -e "${YELLOW}[*] Launching Network Forensic Tools...${NC}"
                netforensic_menu
                ;;
            6) return ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; pause ;;
        esac
    done
}

# System Utilities Menu
function utilities_menu() {
    while true; do
        show_banner
        echo -e "${GREEN} SYSTEM UTILITIES${NC}"
        echo -e ""
        echo -e "${ORANGE} 1.${NC} ${YELLOW}Service Management${NC}    ${ORANGE}4.${NC} ${YELLOW}Package Management${NC}"
        echo -e "${ORANGE} 2.${NC} ${YELLOW}Network Configuration${NC} ${ORANGE}5.${NC} ${YELLOW}System Monitoring${NC}"
        echo -e "${ORANGE} 3.${NC} ${YELLOW}User Management${NC}       ${ORANGE}6.${NC} ${YELLOW}Return to Main Menu${NC}"
        echo -e ""
        echo -e "${ORANGE}==========================================================================================${NC}"
        echo -e -n "${LIGHT_BLUE}[+] Select option [1-6]: ${NC}"
        read -r choice

        case $choice in
            1)
                echo -e "${YELLOW}[*] Launching Service Manager...${NC}"
                systemctl list-unit-files --type=service
                pause
                ;;
            2)
                echo -e "${YELLOW}[*] Network Configuration:${NC}"
                ifconfig -a
                pause
                ;;
            3)
                echo -e "${YELLOW}[*] User Management:${NC}"
                cat /etc/passwd | cut -d: -f1
                pause
                ;;
            4)
                echo -e "${YELLOW}[*] Package Management:${NC}"
                apt list --installed | less
                pause
                ;;
            5)
                htop
                ;;
            6) return ;;
            *) echo -e "${RED}[!] Invalid option${NC}"; pause ;;
        esac
    done
}

# Additional submenus can be added following the same pattern

# Start the main menu
main_menu

