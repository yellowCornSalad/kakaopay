#!/bin/sh

# 다운로드 파일이름 : BigFixAgent.msi
# PROGRAM_FILES=C:\Program Files\

echo "download start"

# wget -O pms_big_fix_agent.msi "https://secfm.kakaopaycorp.net/tinyfilemanager.php?p=%EC%97%94%EB%93%9C%ED%8F%AC%EC%9D%B8%ED%8A%B8%EB%B3%B4%EC%95%88%2FPMS%2FWindows&dl=BigFixAgent.msi" 
# 팝업
powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('파일이 정상적으로 설치되지 않았습니다.','경고')}"
# powershell -WindowStyle hidden -Command "& {[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('Automatic logoff after 1 hour of inactivity','WARNING')}"
# curl "https://secfm.kakaopaycorp.net/tinyfilemanager.php?p=%EC%97%94%EB%93%9C%ED%8F%AC%EC%9D%B8%ED%8A%B8%EB%B3%B4%EC%95%88%2FPMS%2FWindows&dl=BigFixAgent.msi">C:\Program Files\BigFixAgent
