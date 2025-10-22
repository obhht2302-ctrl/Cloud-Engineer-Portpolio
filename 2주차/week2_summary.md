# 🗓️ Week 2 – Web Server 구축 및 운영 실습 요약

## 📘 Day 1 – AWS 계정, IAM, EC2 환경 구축
- **목표:** AWS 환경의 기본 구성 요소(IAM, EC2, 보안 그룹)를 이해하고 안전하게 서버를 생성  
- **핵심 실습:**
  ```bash
  ssh -i mykey.pem ubuntu@<EC2_IP>
  ```
  - AWS 계정 생성 및 루트 계정 보호
  - IAM 사용자 및 그룹 생성, MFA 등록
  - EC2 인스턴스 생성 및 SSH 접속 확인  
- **성과:** EC2 환경과 IAM 권한 구조에 대한 개념 확립  

---

## ⚙️ Day 2 – Linux 관리 및 사용자·서비스·로그
- **목표:** 리눅스 서버의 사용자, 권한, 로그 시스템 이해 및 관리 실습  
- **핵심 명령어:**
  ```bash
  sudo adduser devuser
  sudo chmod 755 /home/devuser
  journalctl -xe
  sudo systemctl status ssh
  ```
- **핵심 개념:**
  - 사용자 및 그룹 관리 (`adduser`, `usermod`)
  - 파일 권한(`chmod`, `chown`) 및 보안 강화
  - `systemctl`과 `journalctl`을 활용한 서비스 제어 및 로그 분석  
- **성과:** SSH 접근 제어 및 서비스 상태 진단 능력 강화  

---

## 🌐 Day 3 – Nginx 설치 및 방화벽(UFW) 설정
- **목표:** 웹 서버(Nginx) 설치 및 기본 페이지 수정, 방화벽 보안 구성  
- **주요 실습 명령어:**
  ```bash
  sudo apt update
  sudo apt install nginx -y
  sudo systemctl enable nginx
  sudo ufw allow 'Nginx HTTP'
  sudo ufw enable
  ```
- **핵심 개념:**
  - `/var/www/html` 기본 경로 이해
  - `index.nginx-debian.html` 수정 후 브라우저 접속 테스트
  - `ss -lntp | grep :80` → 포트 리스닝 확인
- **성과:** EC2 브라우저 접속 시 “Welcome to nginx!” 페이지 확인 완료  

---

## 🔧 Day 4 – Apache 설치 및 포트 분리 구성
- **목표:** Apache 웹 서버를 추가로 설치하고, Nginx와 포트 분리로 병행 운영  
- **주요 명령어:**
  ```bash
  sudo apt install apache2 -y
  sudo nano /etc/apache2/ports.conf
  Listen 8080
  sudo systemctl restart apache2
  curl localhost:8080
  ```
- **핵심 개념:**
  - Nginx (80포트) ↔ Apache (8080포트) 병행 구성  
  - 포트 충돌 방지, 가상 호스트 설정 개념  
  - `systemctl is-active apache2`로 서비스 상태 확인  
- **성과:** Nginx와 Apache의 포트 분리 운영 성공  

---

## ☁️ Day 5 – Elastic IP, AWS CLI, 자동화 스크립트
- **목표:** 고정 IP(EIP) 연결 및 AWS CLI 활용 자동화  
- **주요 명령어:**
  ```bash
  aws configure
  aws ec2 describe-instances --output table
  ```
- **핵심 개념:**
  - Elastic IP를 이용한 고정 IP 설정  
  - AWS CLI를 통한 EC2 정보 조회  
  - Shell Script로 Nginx 자동 설치 구현:
    ```bash
    #!/bin/bash
    sudo apt update
    sudo apt install nginx -y
    sudo systemctl start nginx
    ```
- **성과:** CLI + Script 기반의 서버 관리 자동화 완료  

---

## ✅ Week 2 핵심 정리

| 구분 | 주제 | 핵심 성취 |
|------|------|------------|
| ☁️ **AWS 관리** | IAM, EC2, Elastic IP | 클라우드 인프라 구성 및 권한 제어 |
| 💻 **서버 운영** | Nginx & Apache 설치 | 포트 분리, 웹 서버 구조 이해 |
| 🔒 **보안 강화** | SSH & UFW | 접근 제어 및 방화벽 구성 완성 |
| ⚙️ **자동화** | AWS CLI & Shell Script | EC2 제어 및 서버 관리 자동화 구축 |

---

📄 **결론:**  
2주차에서는 실제 서버 운영 환경에 가까운 **이중 웹 서버 구조(Nginx + Apache)** 를 직접 구성했습니다.  
보안 그룹, 방화벽, 포트 리스닝, CLI 자동화까지 다루며  
**“운영 가능한 웹 서버를 직접 설계하고 제어할 수 있는 수준”** 으로 성장한 주차였습니다. 💪  
