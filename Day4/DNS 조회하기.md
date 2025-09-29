DNS 조회

도메인(www.naver.com)을 IP 주소로 변환하는 과정입니다. 장애 대응 시 가장 먼저 확인하는 부분입니다.
필수 명령:
• nslookup www.naver.com  → 빠르게 A/AAAA 레코드 확인
• dig www.naver.com       → 자세한 정보(A, AAAA, NS, CNAME, TTL, 응답 시간)
• dig +short www.naver.com  → IP만 출력
• dig www.naver.com @8.8.8.8  → 특정 리졸버(구글 DNS)로 질의