# PortHunter  

PortHunter is a tool that utilizes **Nmap** to perform a structured scan of open ports on a target. Its goal is to simplify the identification of accessible services by presenting organized and clear results, making network analysis and security auditing more efficient.  

Designed for both **CTFs** and real-world offensive scenarios where time management is critical, PortHunter automates the port scanning process, eliminating the need to manually input commands or memorize parameters. While PortHunter gathers and structures the data into readable tables, users can focus on other essential tasks, maximizing productivity and saving valuable time. 🚀  


## 🛠️ Why Use PortHunter?  

PortHunter is designed to **save time and streamline** the port scanning process. Instead of manually entering commands, adjusting parameters, and interpreting raw output, PortHunter **automates the workflow** and presents results in a clear, structured format.  

### 🔥 Key Advantages  

✅ **Efficient & Automated** – No need to memorize complex `nmap` parameters; just run **PortHunter** and let it handle everything.  

✅ **Focus on What Matters** – While PortHunter scans and organizes port information, **you can focus on analyzing results**, identifying vulnerabilities, and planning your next steps.  

✅ **Ideal for CTFs & Pentests** – Whether in **Hack The Box, TryHackMe**, or real-world engagements, PortHunter **optimizes your enumeration phase**, helping you act faster.  

✅ **Readable & Organized Output** – Results are presented in a structured table format, making it easier to analyze.  

✅ **Simple & Lightweight** – No unnecessary dependencies, just a powerful script that enhances your workflow.  

With PortHunter, **speed and efficiency** become your advantage. Get ahead in your **CTF challenges** and **pentests** with automation that works for you! 🚀  


## 📌 Prerequisites  

Before installing **PortHunter**, make sure you have the necessary dependencies:  

```bash
sudo apt install nmap xsltproc wget python3 lolcat figlet xclip firefox-esr -y
```  

📢 **Important Notes:**  
- **PortHunter depends on Firefox.** Ensure it is installed before running the script.  
- The script **must be executed as a normal user**—running it as `root` will cause errors.  


## ⚙️ Installation  

To install **PortHunter**, follow these steps:  

```bash
wget https://github.com/CyberR8x/portHunter.git
cd portHunter
sudo mv portHunter /usr/bin
sudo chown -R cyberr8x:cyberr8x /usr/bin/portHunter
chmod +x /usr/bin/PortHunter
```  

After installation, reset your terminal and you will be able to run **PortHunter** from anywhere in the system.  


## 🚀 Running PortHunter  

PortHunter organizes scan results in a structured and easy-to-read format. Below is an example of its output:  

![PortHunter in action](https://github.com/user-attachments/assets/815590da-3c6b-4e29-808f-d3da310e4cd0)  
