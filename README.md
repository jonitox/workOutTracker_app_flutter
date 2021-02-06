# workOut_Tracker

A new Flutter project.
기능: 운동 종목별 기록 tracking. / 내가 하는 운동 종목들만 관리 가능. (추가 시장조사 필요)


# To do    
- 디자인 변경 및 theme 추가(dev tool로 layout확인하며 개발.)    
- 애니메이션 추가  (event Tile(축소/확대),)    
- 폰트 추가      
- db 관리   
- 달력에 종목별 표기 버튼 및 달력rendering.   
- 로딩페이지 구현.(로고 애니메이션 / 스크린 이동버튼)    
- Android/Ios 분리    
- 지원 모드 지정.    
- tab화면 이동시 기존변수들 유지. (provider 적용 후)
- performance 최적화(build함수내 print활용하여별 동작별 위젯의 빌드여부 확인. / const위젯)
- 운동 볼륨 표시
- 설정 페이지: 운동목록 이름순 정렬. 날짜순 정렬. / 
- 이름이 undefined인 운동 추가시 필터 정렬 안되는 버그 fix.
- 각종 device에 test(keyboard 렌더링될 때, Text(kg,횟수 등) 범위가 초과할때(:overflow 추가) 등등 layout확인)
- 달성률 저장 기능
- 루틴 관리 기능
---------------------------------
- addEvent textfield form으로
- test,image등 fittedBox로 wrap하여 사용(혹은 overflow지정?)
- switch.adaptive적용
- onUnknownRoute추가
- InkWell 사용할만한 곳?: 오늘의운동관리하러가기?
- 코드간결화 및 정리. split widgets, builder method. 
- eventList에 divider
- 필터에 스위치말고 체크표시. Icon.check_box(outlined)
- 생성자로 passing하는 변수명 같게 유지하지말고 조금씩 다르게.
- id를 now()말고 다르게 지정. (now는 디버그시에만 간편사용? 강의볼것.)
- 무게에 toStringAsFixed 사용.
- 운동 추가, 삭제 등을 생성자로 받은 List에 직접하지말고 상위레벨에서 함수(add,delete)전달받아서 실행.   
- listview children -> builder(운동종목숫자 모를시.)    
