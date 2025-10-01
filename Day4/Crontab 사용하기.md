cron 자동 실행

주기적으로 스크립트를 실행시켜 자동화합니다.
등록 방법:
1. crontab -e → 편집기에서 추가
2. */1 * * * * /home/ubuntu/log.sh
   → 매 1분마다 log.sh 실행 → log.txt에 기록 추가
확인:
3. crontab -l  → 등록된 작업 확인
4. tail -f /var/log/syslog → cron 실행 기록 확인
주의사항:
5. cron은 PATH가 짧아서 절대경로 사용 권장 (/usr/bin/date)
6. 실행 안 되면: systemctl status cron, chmod +x log.sh, dos2unix 변환 확인