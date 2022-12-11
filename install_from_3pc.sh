#!/bin/sh

PROGRAM_FILES=C:\Program Files\

wget -o pms_big_fix_agent.msi "https://secfm.kakaopaycorp.net/tinyfilemanager.php?p=%EC%97%94%EB%93%9C%ED%8F%AC%EC%9D%B8%ED%8A%B8%EB%B3%B4%EC%95%88%2FPMS%2FWindows&dl=BigFixAgent.msi" -P $PROGRAM_FILES

msiexec /i 'C:\Program Files\pms_big_fix_agent.msi' AGREETOLICENSE="yes" /qb+ # qn+ : 설치실패

check_correctly_installed() {
  if [ -e "C:\Program Files (x86)\BigFix Enterprise\BES Client\BESClient.exe" && "C:\Program Files (x86)\BigFix Enterprise\BES Client"]; then
  $msg_correct = New-Object -ComObject WScript.Shell
  $msg_correct.POpup("정상설치되었습니다.", 5, "설치 완료", 48)
  else
  $msg_correct.POpup("비정상 설치", 5, "설치 실패", 48)
  fi
}
# 파일 정상설치여부
if which BESClient.exe && BES Client; then
	echo "correctly installed!!!"
else
	# apt -y install awscli
    echo "install failed"
fi

check_correctly_installed