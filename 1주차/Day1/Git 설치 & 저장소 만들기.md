Git 설치 & 첫 저장소 만들기

sudo apt update # 패키지 업데이트
sudo apt install git -y # Git 설치
git config --global user.name '병훈' # Git 초기 설정
git config --global user.email 'your_email@example.com' # Git 초기 설정
mkdir my-first-repo && cd my-first-repo # 파일 저장소 만들기
git init # Git 레포지토리로 설정
echo '# Day1 Practice' > README.md # md 파일 만들고 거기에 내용 적기
git remote add origin <GitHub_Repo_URL> # Git URL 설정
git add . # 파일 저장소의 내용들 업데이트
git commit -m 'Day1 practice upload' # 코멘트
git push -u origin master # 업로드하기