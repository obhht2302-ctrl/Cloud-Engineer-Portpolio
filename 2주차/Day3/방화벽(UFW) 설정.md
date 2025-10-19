<방화벽(UFW) 설정>
- 현재 상태 확인:
sudo ufw status

- 방화벽 켜기:
sudo ufw enable

- 22/80 포트 허용:
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw status

👉 방화벽 활성화 후에도 SSH와 HTTP가 잘 되는지 테스트