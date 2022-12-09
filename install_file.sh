#!/bin/sh


########################################################################
### 작성자 : mac.ao (배준호)
### 작성 완료 날짜 : 2022-12-06-화
### 설명 : 3PC(Windows OS)를 사용중인 크루분들을 위한 PMS(Big-Fix) 자동설치 스크립트
########################################################################


########################################################################
############################## VARIABLE ################################
###################################################Program Files\pms_big_fix_agent_msi?



########################################################################
############################### METHOD #################################
########################################################################


get_pms_file() {
    echo "Hello kakaopay_krew"
    echo "==================download start==================="
  
    # 'test.msi'라는 이름으로 파일 다운로드 진행  
    wget -o pms_big_fix_agent.msi "https://secfm.kakaopaycorp.net/tinyfilemanager.php?p=%EC%97%94%EB%93%9C%ED%8F%AC%EC%9D%B8%ED%8A%B8%EB%B3%B4%EC%95%88%2FPMS%2FWindows&dl=BigFixAgent.msi" -P "$PROGRAM_FILES"
}

# 다운로드 경로에 있는 파일의 hash값과 파일의 hash값이 일치하면 실행(실행명령어 exec와 유사)
check_hash_data() {

    # 일치 값 확인 방법 
    #   1. 다운로드 경로에 있는 파일의 해쉬 값 == file_hash_result
    #   2. 작업관리자에서 동작하고 있는 프로그램의 값 == file_hash_result

    if [ -e "$FILE" ]; then
        # echo "$File \test.msi\ exists" # 파일 경로 입력
    
    # 관리자모드로 파워쉘 실행
    # 자동으로  '확인' 클릭될 수 있도록 조치필요 (-y 옵션값처럼 조치필요 | 안될 시 키보드 이벤트로 왼쪽 클릭, 엔터 클릭)
      start-process powershell -verb runAs /qn
      cd "$PROGRAM_FILES" || exit   # 파일이 다운로드 된 위치로 이동
      # install.log에 log수집
      msiexec /i C:\Users\Program Files\pms_big_fix_agent.msi /l*v C:\Windows\Logs.\pms_installer.log AGREETOLICENSE="yes"
    # 파일이 실행되지 않는다면
    else
      # echo "file does not run"
      $msg_error = New-Object -ComObject WScript.Shell
      $msg_error.POpup("파일이 실행되지 않았습니다.", 5, "설치 실패", 48)
    fi
    
}
# 파일의 hash값을 추출
find_hash_result() {
  Get-FileHash $FILE | Format-List
  # 파일의 해쉬 값을 hashed_data라는 변수에 저장
  hashed_data = find_hash_result
}

############### if not downloaded 예외처리

check_correctly_installed_1() { # 정상적으로 설치되었는지 확인(작업관리자 실행중인 프로그램에서 동일한 해쉬 값 조회)
  if [ -e ${FILE_HASH_RESULT} ]; then # 설치 완료된 파일 경로 입력
    # echo "installed correctly"   
    $msg_correct = New-Object -ComObject WScript.Shell
    $msg_correct.POpup("설치가 완료되었습니다.", 5, "설치 완료", 48)
  fi
}
check_correctly_installed_2() {
  if [ -e ${hashed_data} == ${FILE_HASH_RESULT}]; then
  echo "installed correctly"
}


########################################################################
############################### SCRIPT #################################
########################################################################
# ???# 
FILE=C:\Program Files\pms_big_fix_agent.msi
PROGRAM_FILES=C:\Program Files\
# file="C:\Users\kakaopay\Downloads\test.msi"

# pms파일의 해쉬값
FILE_HASH_RESULT="aa2465dceaba49f4ca64b41b7fc7ba044d998822"
get_pms_file
check_hash_data
check_correctly_installed