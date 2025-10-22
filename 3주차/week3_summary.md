# 🗓️ Week 3 – AWS S3 정적 웹사이트 호스팅 & 자동 배포 실습 요약

## 📘 Day 1 – S3 버킷 생성 및 정적 웹사이트 호스팅  
- **목표:** S3를 이용해 정적 웹사이트(index.html)를 직접 호스팅  
- **핵심 실습:**
  ```bash
  aws s3 mb s3://my-web-bucket
  aws s3 website s3://my-web-bucket/ --index-document index.html
  ```
  - 버킷 생성 및 퍼블릭 액세스 정책 구성  
  - index.html, error.html 업로드  
  - “정적 웹사이트 호스팅” 기능 활성화 후 엔드포인트 접속  
- **성과:** EC2 없이도 S3 단독으로 웹사이트를 제공할 수 있음을 이해  

---

## ⚙️ Day 2 – AWS CLI를 이용한 S3 버킷 자동화  
- **목표:** AWS CLI를 활용해 S3 객체를 자동으로 업로드·동기화  
- **핵심 명령어:**
  ```bash
  aws configure
  aws s3 cp index.html s3://my-web-bucket
  aws s3 sync ./site s3://my-web-bucket --delete
  ```
- **핵심 개념:**
  - CLI를 이용한 버킷 내 객체 관리 (cp, mv, rm, sync)  
  - `--delete` 옵션으로 로컬과 버킷 상태를 동기화  
- **성과:** S3 콘솔에 접속하지 않고도 CLI로 웹 배포 가능  

---

## 🌐 Day 3 – EC2 ↔ S3 연동 (IAM Role 부여)  
- **목표:** Access Key 없이 EC2에서 S3 접근하도록 IAM Role 구성  
- **핵심 명령어:**
  ```bash
  aws sts get-caller-identity
  aws s3 ls
  ```
- **핵심 개념:**
  - EC2 인스턴스에 IAM Role 연결  
  - S3 FullAccess 권한 부여 후 `aws s3 ls`로 접근 확인  
  - Access Key 관리 불필요한 안전한 접근 구조 확립  
- **성과:** EC2에서 Key 없이 S3 명령 실행 성공  

---

## 🔧 Day 4 – EC2 자동 배포 스크립트 작성 (deploy.sh)  
- **목표:** S3 배포를 Shell Script로 자동화  
- **스크립트 내용:**
  ```bash
  #!/bin/bash
  aws s3 sync /home/ubuntu/site s3://my-web-bucket --delete
  echo "S3 Website Deployed Successfully!"
  ```
- **핵심 개념:**
  - `aws s3 sync` 명령으로 변경된 파일만 업로드  
  - Bash 스크립트로 CLI 명령을 반복 실행 자동화  
  - cron 등록으로 주기적 자동 배포 구현 가능  
- **성과:** `./deploy.sh` 실행만으로 최신 버전 자동 배포 성공  

---

## ☁️ Day 5 – 프로젝트 정리 및 아키텍처 문서화  
- **목표:** S3 자동 배포 아키텍처를 정리하고 GitHub 업로드  
- **핵심 구성:**
  - EC2 (AWS CLI, deploy.sh) → S3 (정적 웹 호스팅) 구조 문서화  
  - `README.md`, `index.html`, `deploy.sh` 파일 정리  
  - 버킷 버전 관리 활성화로 안정성 강화  
- **성과:** 완전 자동화된 S3 정적 웹 배포 구조 완성  

---

## ✅ Week 3 핵심 정리

| 구분 | 주제 | 성취 내용 |
|------|------|------------|
| ☁️ **클라우드 자동화** | EC2 ↔ S3 연동 및 CLI 배포 | 코드 기반 인프라 운영 구현 |
| 🔐 **보안 강화** | IAM Role, Keyless 접근 | Key 노출 없이 S3 접근 |
| ⚙️ **운영 효율성** | deploy.sh 자동 배포 | 수정 파일만 자동 업로드 |
| 📦 **아키텍처 설계** | EC2 + S3 + CLI | 단일 EC2에서 S3 배포 완성 |

---

📄 **결론:**  
3주차에서는 EC2와 S3를 완전하게 연동하여  
**“클라우드 자동 배포 파이프라인”**을 직접 구축했습니다.  
CLI와 Shell Script를 통해 수동 절차를 모두 자동화하며,  
AWS 엔지니어로서의 실무 감각을 한 단계 끌어올린 주차였습니다. 🚀  
