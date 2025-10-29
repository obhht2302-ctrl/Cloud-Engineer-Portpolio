# ☁️ Week 4 – AWS RDS + EC2 + Flask CRUD 웹서비스 프로젝트

## 📘 개요
4주차에서는 **AWS EC2**와 **RDS(MySQL)** 를 연동하여  
Flask 기반의 **CRUD(Create, Read, Update, Delete)** 웹 애플리케이션을 완성합니다.  

이 과정을 통해 **클라우드 환경에서 웹서비스 전체 구조를 직접 구성**하며,  
RDS 보안 설정부터 Flask API 개발, systemd 자동 실행, Nginx 리버스 프록시까지 전 과정을 실습합니다.

---

## ⚙️ 기술 스택
- **AWS EC2 (Ubuntu 22.04)** — Flask 애플리케이션 서버  
- **AWS RDS (MySQL 8.0)** — 데이터 저장소  
- **Flask + PyMySQL** — Python 기반 CRUD API  
- **Nginx / Apache** — 리버스 프록시 및 포트 라우팅  
- **systemd** — Flask 앱 자동 실행 서비스  
- **UFW / Security Group** — 네트워크 접근 제어 및 보안 강화  

---

## 🧩 실습 구성 요약

### **Day 1 — EC2 ↔ RDS 연동**
- RDS 생성 및 엔드포인트 연결 테스트  
- EC2에서 `mysql -h <endpoint> -u admin -p` 접속 확인  
- SG 인바운드 규칙 수정: RDS → EC2 SG 허용  
- `show databases;` 결과 출력으로 연결 성공 확인  

---

### **Day 2 — 보안 그룹 & 접근 제어 실습**
- RDS Public Access “No” 상태에서도 EC2 접근 가능한 이유 학습  
- 인바운드/아웃바운드 차이 이해  
- EC2 SG ↔ RDS SG 직접 연결 방식 실습  
- 내부망(VPC)에서만 통신 가능하도록 구성  

---

### **Day 3 — Flask CRUD 앱 구축**
- Flask 및 PyMySQL 설치  
- `app.py` 작성 → `/users` API 구현  
- `curl` 명령으로 POST / GET 요청 테스트  
- EC2 ↔ RDS CRUD 데이터 연동 확인  
- Flask 내부 구조 및 `app.run(host='0.0.0.0')` 의미 학습  

---

### **Day 4 — Flask 서비스 자동화 및 보안 강화**
- `flaskapp.service` 파일 생성 및 systemd 등록  
- `sudo systemctl enable --now flaskapp` 로 부팅 시 자동 실행 설정  
- UFW 방화벽 활성화 (22, 80 허용 / 3306 차단)  
- `journalctl -u flaskapp -f` 로그 실시간 모니터링  
- 서비스 자동 실행 및 보안 검증  

---

### **Day 5 — 프로젝트 정리 및 배포**
- EC2 + RDS + Flask 아키텍처 다이어그램 작성  
- README 및 실행 매뉴얼 정리  
- GitHub 포트폴리오 업로드  
  
---

## ✅ 학습 성과

| 항목 | 내용 |
|------|------|
| ☁️ 클라우드 통합 | EC2 ↔ RDS 연결 및 Flask 앱 구성 |
| 🔐 보안 구성 | SG 및 UFW 정책을 통한 인바운드 제어 |
| ⚙️ 운영 자동화 | systemd를 이용한 Flask 상시 실행 |
| 💾 데이터 관리 | Flask → RDS CRUD 연동 실습 |
| 🧠 서비스 아키텍처 설계 | EC2, RDS, Flask 구조 이해 및 배포 완성 |

---

## 📄 참고 문서
- [AWS RDS 공식 문서](https://docs.aws.amazon.com/rds/)
- [Flask 공식 문서](https://flask.palletsprojects.com/)
- [Nginx Reverse Proxy Guide](https://docs.nginx.com/)
- [systemd User Guide](https://www.freedesktop.org/software/systemd/man/systemd.html)
