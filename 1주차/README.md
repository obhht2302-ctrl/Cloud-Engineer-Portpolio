# ☁️ AWS EC2 & Linux 기초 실습 프로젝트 (1주차)

## 📘 개요
AWS EC2 환경에서 Linux 명령어, Git, 네트워크, Shell Script, Crontab을 실습하며 클라우드 엔지니어링의 기본기를 다지는 **기초 인프라 구축 프로젝트**입니다.

## 🧱 아키텍처
사용자 로컬 환경 → AWS EC2 (Ubuntu 22.04 LTS) → GitHub 원격 저장소

## ⚙️ 기술 스택
- AWS EC2
- Ubuntu Linux
- Git / GitHub
- Bash Shell Script
- Crontab 자동화 스케줄러

---

## 🚀 실습 구성

### 1️⃣ EC2 인스턴스 생성 & SSH 접속
```bash
ssh -i mykey.pem ubuntu@<EC2_IP>
```
- AWS 콘솔에서 Ubuntu 22.04 인스턴스 생성
- PEM 키 기반 SSH 보안 접속
- 보안 그룹에서 **22번 포트(SSH)** 오픈

---

### 2️⃣ Git 설치 및 원격 저장소 연동
```bash
sudo apt update && sudo apt install git -y
git init
git remote add origin <GitHub_URL>
git push -u origin master
```
- Git 설치 및 사용자 정보 설정
- 로컬 프로젝트를 GitHub 저장소에 업로드

---

### 3️⃣ Linux 파일 및 디렉토리 관리
```bash
pwd
ls -l
mkdir practice && cd practice
touch test.txt
rm test.txt
```
- 파일/폴더 생성 및 삭제 실습
- Linux 파일 권한 구조(`rwx`) 학습

---

### 4️⃣ 사용자, 서비스, 프로세스 관리
```bash
sudo adduser devuser
sudo systemctl start nginx
ps aux | grep nginx
kill <PID>
```
- 사용자 계정 추가 및 sudo 권한 부여
- nginx 서비스 실행·중지·상태 확인
- 프로세스 모니터링 및 종료

---

### 5️⃣ 네트워크 구조 및 진단 명령어
```bash
ping -c 4 www.google.com
ss -tuln | grep :80
curl -I http://localhost
```
- OSI 7계층 구조 이론 학습
- 네트워크 연결 상태 및 포트 리스닝 확인

---

### 6️⃣ Shell Script & Crontab 자동화
```bash
#!/bin/bash
NOW=$(date)
IP=$(hostname -I)
echo "$NOW - $IP" >> /home/ubuntu/log.txt
```
```bash
crontab -e
*/1 * * * * /home/ubuntu/log.sh
```
- 로그 기록 자동화 스크립트 작성
- crontab으로 1분마다 자동 실행

---

### 7️⃣ 미니 프로젝트 – 시스템 리포트 자동화
- **목표:** 서버의 상태를 자동 점검하고 `/home/ubuntu/week1_project/report.txt`에 저장
- **사용 명령어:** `uptime`, `df -h`, `free -h`, `systemctl`, `ss`
- **결과:** cron을 이용해 매일 자동 실행, 로그 파일 자동 갱신

---

## ✅ 학습 성과
| 구분 | 내용 |
|------|------|
| ☁️ 클라우드 기초 | EC2 인스턴스 생성, SSH 접속 실습 |
| 💻 리눅스 기본기 | 파일, 권한, 프로세스, 서비스 관리 |
| 🌐 네트워크 이해 | OSI 계층, 포트, DNS 실습 |
| ⚙️ 자동화 구현 | Shell Script + Crontab |
| 📦 버전 관리 | Git + GitHub 연동 |

---

## 📄 참고 문서
- [AWS EC2 공식 문서](https://docs.aws.amazon.com/ec2/)
- [Git Documentation](https://git-scm.com/doc)
- [Ubuntu Man Pages](https://manpages.ubuntu.com/)

---

**기간:** Week 1 (클라우드 엔지니어 입문 주차)
