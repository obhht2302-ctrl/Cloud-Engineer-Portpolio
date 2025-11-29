# Week 5 — AWS IAM Deep Dive & Access Management

## 📌 1. 개요
Week 5에서는 AWS IAM(Identity and Access Management)의 핵심 개념인 **User, Group, Role, Policy, MFA, CloudTrail, IAM 보안 모범 사례, AWS CLI 및 Terraform 자동화**를 실습 중심으로 학습하였다.

IAM은 클라우드에서 가장 중요한 보안 구성 요소이며, 이번 주 학습은 실무에서도 가장 자주 사용되는 IAM 구성 능력을 목표로 한다.

---

## 📌 2. 기술 스택
- AWS IAM  
- AWS Console  
- JSON Policy  
- AWS STS  
- CloudTrail  
- AWS CLI  
- Terraform (Infra as Code)  

---

## 📌 3. Day별 실습 내용

---

### 🔹 **Day 1 — IAM 기본 구조 이해**
- Root 계정 MFA 및 보안 설정
- IAM User 생성 & 로그인 테스트
- IAM Group 생성 및 정책 연결
- 최소 권한(Least Privilege) 개념 이해
- IAM 구조를 정확히 이해하는 기본 단계

---

### 🔹 **Day 2 — User / Group 실습 강화**
- Developer 그룹 생성
- 신입 개발자용 IAM 계정 생성
- Password Policy 작성 & 적용
- IAM User 로그인 권한 조정 실습
- 정책 연결을 통한 권한 부여 흐름 이해

---

### 🔹 **Day 3 — IAM Role & 정책(JSON Policy) 실습**
- EC2 → S3 액세스 제공을 위한 IAM Role 생성
- Trust Policy / Permission Policy 개념 이해
- JSON Policy 구문 분석
- Inline Policy vs Managed Policy 차이 점검
- Role이 왜 AWS 서비스에서 중요한지 실습으로 학습

---

### 🔹 **Day 4 — IAM 보안 심화 (MFA / CloudTrail)**
- 모든 IAM User에 MFA 적용
- Root User 보안 설정 강화
- CloudTrail 활성화
- IAM 이벤트(로그인, 정책 변경) 기록 확인
- 실무 보안 사고 시나리오 기반 분석

---

### 🔹 **Day 5 — IAM 자동화 (CLI & Terraform)**
- AWS CLI로 IAM User/Group/Role 자동 생성
- Policy Attach 자동화 스크립트 작성
- Terraform을 이용한 IAM 구성 코드화(IaC)
- "DevOps 방식의 IAM 관리" 기초 학습

---

## 📌 4. 문제 해결 과정
| 문제 | 원인 | 해결 |
|------|------|------|
| Permission denied (SSH) | key 파일 권한 0644 | `chmod 400 key.pem` |
| Role 연결했는데 EC2가 S3 접근 불가 | Trust Policy 누락 | Trust Policy 수정 |
| CloudTrail에 IAM 이벤트가 안 찍힘 | Trail 리전 설정 오류 | 모든 리전 적용으로 수정 |
| CLI Credential 충돌 | ~/.aws/credentials 혼재 | 프로파일 분리 & 재설정 |

---

## 📌 5. Week 5 핵심 개념 정리
- IAM User: 실제 사용자  
- IAM Group: 사용자 묶음  
- IAM Role: AWS 서비스가 사용하는 권한  
- IAM Policy: JSON 구조의 권한 문서  
- MFA: 계정 보호 필수 요소  
- CloudTrail: 보안 로그 기록  
- STS: 임시 자격 증명  
- Least Privilege: 최소 권한 원칙  
- Terraform: IAM 구성 자동화

---

## 📌 6. 참고 문서
- AWS IAM Official Docs  
- AWS CloudTrail Official Docs  
- AWS Security Best Practices  
- AWS STS Documentation  


