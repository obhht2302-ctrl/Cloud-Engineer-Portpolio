nginx 외부 접속 확인 (EC2)

1) 포트 확인
   ss -tuln | grep :80   # IPv4/IPv6 모두 80포트 LISTEN 확인 (0.0.0.0:80 확인하기)
   curl -I http://localhost   # HTTP/1.1 200 OK 응답 확인
2) AWS 보안 그룹 설정
   - AWS 콘솔 → 인스턴스 → 보안 그룹 → 인바운드 규칙 편집
   - HTTP (TCP 80) → 0.0.0.0/0 추가
3) 브라우저에서 확인
   http://<EC2 퍼블릭 IP> 접속 → Welcome to nginx! 페이지 확인