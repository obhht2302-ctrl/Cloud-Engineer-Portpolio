# ☁️ Week 3 – AWS S3 정적 웹사이트 호스팅 & 자동 배포 프로젝트

## 📘 개요  
3주차는 **AWS S3와 EC2를 연동한 웹사이트 자동 배포 실습**입니다.  
S3 버킷을 정적 웹 호스팅용으로 구성하고, EC2에서 AWS CLI 및 Shell Script를 활용해  
자동으로 콘텐츠를 배포·갱신하는 파이프라인을 구축했습니다.  

이 과정을 통해 **“수동 업로드 없이 코드로 인프라를 관리하는 방법”** 을 체득했습니다.

---

## ⚙️ 기술 스택  
- **AWS S3** (정적 웹사이트 호스팅)  
- **AWS EC2** (CLI 자동 배포 환경)  
- **IAM Role / Policy** (EC2 → S3 접근 권한 관리)  
- **AWS CLI** (자동화 명령 기반 배포)  
- **Bash Script (deploy.sh)**  
- **HTML / CSS (index.html 테스트 페이지)**  

---

## 🚀 실습 구성  

### 1️⃣ S3 버킷 생성 및 웹사이트 호스팅
```bash
aws s3 mb s3://my-web-bucket
aws s3 website s3://my-web-bucket/ --index-document index.html
```
- S3 버킷 생성 및 버전 관리 활성화  
- 정적 웹사이트 호스팅 활성화 및 엔드포인트 확인  
- index.html / error.html 업로드 후 웹사이트 접속 테스트  

---

### 2️⃣ AWS CLI를 이용한 버킷 관리
```bash
aws configure
aws s3 ls
aws s3 cp index.html s3://my-web-bucket
aws s3 sync ./site s3://my-web-bucket --delete
```
- CLI를 이용한 객체 업로드, 삭제, 동기화 실습  
- `--delete` 옵션으로 버킷 정리 및 동기화 제어  
- EC2 내부에서 CLI 명령을 자동 실행하도록 설정  

---

### 3️⃣ EC2 ↔ S3 연동 (IAM Role 부여)
```bash
aws sts get-caller-identity
```
- EC2 인스턴스에 IAM Role 연결  
- Access Key 없이도 S3 명령 수행 가능  
- 보안성과 관리 효율을 동시에 확보  

---

### 4️⃣ 자동 배포 스크립트 작성
```bash
#!/bin/bash
aws s3 sync /home/ubuntu/site s3://my-web-bucket --delete
echo "S3 Website Deployed Successfully!"
```
- `deploy.sh` 스크립트를 작성해 자동 배포 수행  
- 수정된 파일만 자동 갱신되는 구조 구현  
- Cron 또는 수동 실행을 통해 주기적 배포 가능  

---

### 5️⃣ 프로젝트 정리 및 아키텍처 구성
- EC2 → S3 자동 배포 구조 문서화  
- GitHub에 `README.md`, `index.html`, `deploy.sh` 업로드  
- AWS 리소스 구조를 다이어그램으로 시각화  

---

## ✅ 학습 성과  

| 구분 | 내용 |
|------|------|
| ☁️ **클라우드 자동화** | EC2 ↔ S3 연동 및 CLI 기반 배포 자동화 |
| 🔐 **보안 관리** | IAM Role로 안전한 S3 접근 구현 |
| 🧠 **인프라 설계 능력** | 버킷 버전 관리 및 아키텍처 문서화 |
| ⚙️ **운영 효율성** | Shell Script로 수동 배포 절차 자동화 |

---

## 📄 참고 문서  
- [AWS S3 공식 문서](https://docs.aws.amazon.com/s3/)  
- [AWS CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/)  
- [IAM Role Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

---

**기간:** Week 3 (S3 정적 웹사이트 & 자동 배포 실습 주차)
