# Week 6 — AWS VPC Network Architecture (3-Tier 구성)

## 📌 1. 개요
Week 6에서는 AWS VPC를 기반으로 **완전한 3-tier 네트워크 아키텍처(Web → App → DB)**를 구축하였다.  
Public/Private Subnet, Internet Gateway, NAT Gateway, Route Table, Security Group(SG)까지  
AWS 네트워크의 핵심 요소를 직접 설계하고 실습하는 주차였다.

이 아키텍처는 실무 클라우드 엔지니어가 가장 많이 구축하는 구조이며,  
면접에서도 가장 자주 묻는 핵심 주제다.

---

## 📌 2. 기술 스택
- AWS VPC  
- Subnet (Public / Private)  
- Internet Gateway (IGW)  
- NAT Gateway  
- Route Tables  
- EC2 (Web / App / DB 계층)  
- Security Groups  
- Linux Network Tools (curl, ping)  
- Architecture Diagram(draw.io)

---

## 📌 3. Day별 실습 내용

---

### 🔹 **Day 1 — VPC 구성 기초**
(출처: :contentReference[oaicite:0]{index=0})

- VPC 개념 이해  
- CIDR 10.0.0.0/16 대역으로 VPC 생성  
- Public / Private Subnet 설계  
- AZ 분산 구조(2a, 2c) 설계  
- 실습: bh-vpc-week6 생성

📌 **학습 핵심**  
- VPC는 AWS의 사용자 전용 네트워크  
- Subnet은 Public/Private으로 나누어 보안 계층을 구성  
- AZ 분산은 장애 대비 필수

---

### 🔹 **Day 2 — Public Subnet + IGW + Public Route Table 구성**
(출처: :contentReference[oaicite:1]{index=1})

- Public Subnet 2개(a, c) 생성  
- Internet Gateway 생성 후 VPC 연결  
- Public Route Table 생성  
- 0.0.0.0/0 → IGW 라우팅  
- Public Subnet에 연동  
- Public EC2 생성하여 인터넷 연결 테스트  
  - `ping 8.8.8.8`  
  - `sudo yum update -y`

📌 **학습 핵심**  
- Public Subnet이 인터넷을 나가기 위해서는  
  **IGW 라우팅이 반드시 필요함**  
- Public EC2에서 인터넷 정상 접속 확인

---

### 🔹 **Day 3 — Private Subnet + NAT Gateway + Private Route Table 구성**
(출처: :contentReference[oaicite:2]{index=2})

- Private Subnet 2개(a, c) 생성  
- NAT Gateway (Public Subnet) 생성  
- Private Route Table 생성  
- 0.0.0.0/0 → NATGW 라우팅  
- Private Subnet 2개에 연결  
- Private EC2 생성  
- Public EC2 → Private EC2 ping 테스트 (차단)

📌 **학습 핵심**  
- Private Subnet은 외부에서 접근 불가  
- NAT Gateway를 통해 outbound-only 구조 확보  
- Public ↔ Private ICMP 다르게 동작하는 이유 이해

---

### 🔹 **Day 4 — Security Group (SG) 3계층 보안 완성**
(출처: :contentReference[oaicite:3]{index=3})

#### SG 3개 생성
| 계층 | Subnet | SG | 역할 |
|------|---------|--------|---------|
| Web | Public | sg-web | 인터넷에서 접근 허용 |
| App | Private | sg-app | Web만 App 접근 허용 |
| DB  | Private | sg-db | App만 DB 접근 허용 |

#### 트래픽 규칙
- sg-web  
  - 80 → 0.0.0.0/0  
  - 22 → My IP  
- sg-app  
  - 8080 → sg-web  
- sg-db  
  - 3306 → sg-app  

#### 테스트
- Web → App: `curl http://APP_PRIVATE_IP:8080`  
- App → DB: `mysql -h DB_PRIVATE_IP -u root -p`  
- Web → DB ❌ (차단되어야 정상)

📌 **학습 핵심**  
- 3-tier SG 구조는 실무 보안의 기본 패턴  
- 단방향 허용(Web → App → DB)이 핵심

---

### 🔹 **Day 5 — 아키텍처 다이어그램 & GitHub 문서화**
(출처: :contentReference[oaicite:4]{index=4})

- draw.io로 VPC 전체 아키텍처 작성  
- Web / App / DB 계층 구성 시각화  
- SG 흐름도 표시  
- README 구조 설계  
- GitHub 업로드 실습  
  - vpc-architecture.png  
  - README.md  
  - app.py (8080 테스트용)  

📌 **학습 핵심**  
- 실무에서는 문서화 능력이 매우 중요  
- 아키텍처 설명 능력 = 엔지니어 실력  
- 깃헙에 올려 포트폴리오로 사용 가능

---

## 📌 4. 실습 과정에서 발생한 문제 & 해결

| 문제 | 원인 | 해결 |
|------|------|------|
| EC2 SSH Permission denied | PEM 권한 0644 | `chmod 400` 설정 |
| App 서버 8080 연결 실패 | Flask 서버 종료(Ctrl+C) | 백그라운드 실행(`nohup python3 app.py &`) |
| Private Subnet yum update 불가 | NAT 라우팅 누락 | Route Table 재설정 |
| Web → DB 접근 가능함 | sg-db inbound 오류 | Source를 sg-app으로 수정 |

---

## 📌 5. Week 6에서 배운 핵심 개념 정리
- VPC / Subnet 구조  
- IGW / NATGW 동작 방식  
- Public / Private 네트워크 차이  
- Route Table 구성 원리  
- 3-tier SG 보안 구조  
- 아키텍처 다이어그램 작성 능력  
- 문서화 능력 (README + Diagram)
