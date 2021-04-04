# Muppler(머슬플래너) - ios 출시, 안드로이드 검토중
머플러(Muscle Planner)로 운동 계획하고 기록하자!

매일 어떤 운동을 했는지 달력으로 쉽게 확인하고, 
내가 하는 운동 목록 또는 루틴 만을 따로 관리해보세요.

운동종목별 기록을 확인해 내가 얼마나 늘었는지 볼 수 있어요.
그 날의 운동 만족도와 메모를 저장해보세요.

[ 주요기능 ]
- 달력에 오늘한 운동 기록
- 커스텀 운동 목록 관리
- 내 루틴 생성 및 불러오기
- 종목별 달력 필터링 기능
- 종목별 기록 추적 및 성장그래프 확인
- 운동별 메모
- 스탑워치 기능
- 그날의 만족도 표시



# 개발환경    
flutter


# To update later..     
- 애니메이션 추가  (Tile(축소/확대),)
- 폰트 추가         
- 운동부위 카테고리 관리 기능.    
- 설정 페이지: 운동목록 이름순 정렬. 날짜순 정렬. / 
- 각종 device에 test(keyboard 렌더링될 때, Text(kg,횟수 등) 범위가 초과할때(:overflow 추가) 등등 layout확인)
- 달성률 저장 기능
- 카운터 기능, 타이머 기능   
- 아이폰 고려. safeArea.    
---------------------------------
# 디버그, 최적화
- performance 최적화(build함수내 print활용하여별 동작별 위젯의 빌드여부 확인. / const위젯)
- test,image등 fittedBox로 wrap하여 사용(혹은 overflow지정?)
- onUnknownRoute추가
- InkWell 사용할만한 곳?
- 코드간결화 및 정리. split widgets, builder method. 
- 생성자로 passing하는 변수명 같게 유지하지말고 조금씩 다르게.
- listview children -> builder(운동종목숫자 모를시.) / listview.separated   
- map의 key가 없을때 추가시 -> putIfAbsent / value update 시 -> update     
- event tile의 set column을 listview로하고 listview의 container의 height을 min(갯수*20+10, 100)으로 설정. 일정크기넘어가면 scroll하게.    
- Form 개선. TextInputActioin.next /       
- FocusNode 사용가능하면 추가, unFocus()도   
- Form 개선. TextInputActioin.next / validator 수정.(value.isEmpty, can parse double etc)         
- hero 사용가능하면 추가    
- 페이지 pop할때 받을 객체의 타입을 as말고 push<T>로 명시.   
- Function 생성자로 전달시, 받는 클래스 내에서 함수 형태를 규정.      
- input에 trim()추가.      
- pageTransition/ customRoute
- LayoutBuilder    
- 공유 기능
- dismissable    
- 메모리 leak check.   
- timer provider에 is_running 필요x    

연락처: 010-8576-8390, jonitox94@naver.com
