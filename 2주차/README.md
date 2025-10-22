# ☁️ Week 2 – Web Server 구축 및 운영 실습

## 📘 개요
2주차는 **Nginx와 Apache를 중심으로 한 웹 서버 환경 구성 실습**입니다.  
AWS EC2를 기반으로 서버를 설치·운영·보안 설정까지 수행하며,  
클라우드 인프라 엔지니어로서 **웹 서버의 동작 구조와 포트 관리, 방화벽 제어, 보안 구성**을 이해하는 주차입니다.

---

## ⚙️ 기술 스택
- AWS EC2 (Ubuntu 22.04 LTS)
- Nginx / Apache
- Linux (UFW, systemctl, ps, journalctl)
- AWS IAM / Elastic IP
- Bash Script
- AWS CLI

---

## 🚀 실습 구성

### 1️⃣ AWS 환경 설정 및 EC2 접속
```bash
ssh -i mykey.pem ubuntu@<EC2_IP>
```
- AWS 계정 생성, IAM 보안 구성
- EC2 인스턴스 생성 및 SSH 접속
- 기본 보안 그룹 설정 (22번, 80번 포트)

---

### 2️⃣ Linux 시스템 관리 & 로그
```bash
sudo adduser devuser
sudo systemctl status ssh
journalctl -xe
```
- 사용자/그룹 관리
- 서비스 제어 및 로그 분석
- sudo 권한과 접근 통제 이해

---

### 3️⃣ Nginx 설치 및 방화벽 설정
```bash
sudo apt install nginx -y
sudo systemctl start nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw enable
```
- Nginx 웹 서버 설치 및 구동
- 기본 페이지 `/var/www/html/index.nginx-debian.html` 수정
- 방화벽(UFW) 설정 및 80포트 개방

---

### 4️⃣ Apache 설치 및 포트 분리 구성
```bash
sudo apt install apache2 -y
sudo nano /etc/apache2/ports.conf
sudo systemctl restart apache2
```
- Apache 8080 포트 리스닝 구성
- Nginx와 Apache를 병행 구동
- 웹 요청 분리 (Nginx: 80 / Apache: 8080)

---

### 5️⃣ Elastic IP & AWS CLI 실습
```bash
aws configure
aws ec2 describe-instances --output table
```
- 고정 IP(EIP) 연결
- AWS CLI를 통한 EC2 제어
- Shell Script로 웹 서버 자동 설치

---

## ✅ 학습 성과

| 구분 | 내용 |
|------|------|
| 🌐 **Web Server 이해** | Nginx와 Apache의 차이점 및 포트 리스닝 구조 이해 |
| 🔒 **보안 구성** | UFW 방화벽, SSH 접근 제한, Elastic IP 설정 |
| ⚙️ **운영 자동화** | CLI + Shell Script 활용한 서버 관리 |
| 🧠 **서버 구조 이해** | 프런트 서버(Nginx) ↔ 백엔드 서버(Apache) 연동 원리 |

---

## 📄 참고 문서
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Apache HTTP Server Docs](https://httpd.apache.org/docs/)
- [AWS CLI User Guide](https://docs.aws.amazon.com/cli/)
- [Ubuntu UFW Guide](https://help.ubuntu.com/community/UFW)

---

**기간:** Week 2 (Web Server 구축 및 운영 주차)
