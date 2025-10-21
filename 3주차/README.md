# AWS S3 + EC2 자동 배포 프로젝트 (3주차)

## 📘 개요
EC2와 S3를 연동하여 정적 웹사이트를 자동으로 배포하는 인프라 구축 실습 프로젝트입니다.

## 🧱 아키텍처
EC2 (배포 서버) → S3 (정적 웹사이트 버킷) → 엔드포인트 URL (사용자 브라우저)

## ⚙️ 기술 스택
- AWS S3, EC2, IAM Role
- AWS CLI
- Bash Shell Script (deploy.sh)

## 🚀 배포 방법
```bash
chmod +x deploy.sh
./deploy.sh
