Shell 스크립트 작성 (log.sh)

반복 작업을 자동화하기 위한 기본 도구입니다.

log.sh 예제:
#!/bin/bash

NOW=$(date)
IP=$(hostname -I)
echo "$NOW - $IP" >> /home/ubuntu/log.txt
해설:
• NOW=$(date) → 현재 시각 문자열 저장
• IP=$(hostname -I) → 서버 IP 주소 확인
• >> /home/ubuntu/log.txt → 파일 끝에 누적 기록

실행 절차:
1) nano ~/log.sh → 코드 작성 후 저장(ctrl + O, Enter). # log.sh 파일 생성됨.
2) chmod +x ~/log.sh → 실행 권한 부여 # 실행 권한 부여해야 아래의 ./log.sh를 실행해도 작동이 된다. 
3) ./log.sh 실행 후 cat ~/log.txt → 기록 확인