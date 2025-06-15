# Simple Python Web Server

A minimal static web server built using Python's `http.server` module, running on a custom port (8080). This project taught me how to manage Linux firewalls from the command line to open custom ports for applications, ensuring accessibility for HTTP traffic.

## Features
- Serves static files (e.g., HTML, CSS, JS) from the current directory.
- Configurable to run on a custom port (8080 in this project).
- Demonstrates firewall management with `firewall-cmd` to allow HTTP traffic.

## Getting Started

### Prerequisites
- Python 3.x installed.
- Linux system with `firewalld` (common on RHEL based distros like Rocky Linux).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/emeka-iwu/Custom-Port-http-Server.git
   cd Custom-Port-http-Server

### Quick Firewall Setup
2. Run the included script to configure the firewall:
   ```bash
   ./firewall.sh

### Run a Simple HTTP Server on Port 8080 Using Python

3. To start the server, run:

```bash
python3 -m http.server 8080
