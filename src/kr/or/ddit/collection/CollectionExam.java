package kr.or.ddit.collection;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CollectionExam {
	/*
	 * Collection 문제를 풀어보면서 List, Set, Map을 확실하게 알아가시길 바랍니다!
	 */
	public static void main(String[] args) {
		// 개발자 기술면접 시나리오
		// https://blog.naver.com/ktm1296/222275005957
/*	
		// #### List 문제
		// 1. List는 인터페이스인가요? 클래스인가요?
		// '1. OOO입니다.' 로 출력해주세요.
		System.out.println("List는 인터페이스 입니다.");
		
		// 2. List의 종류는 어떤것들이 있나요?
		// '2. OOO,OOO,OOO 등이 있습니다'와 같이 출력해주세요.
		System.out.println("ArrayList, LinkedList, Vector, stack 등이 있습니다.");

		System.out.println("---------------------------------");
		// 3. 문자열을 담을 수 있고 변수명 list1으로 설정된 List를 만들어주세요.
		// (변수 선언 및 초기화를 통한 인스턴스를 만들어주세요.)
		ArrayList<String> list1 = new ArrayList<String>();
		
		// 4. 3번에서 만든 list1에 306호 학생 10명의 이름을 넣어주세요.
		list1.add("1");
		list1.add("2");
		list1.add("3");
		list1.add("4");
		list1.add("5");
		list1.add("6");
		list1.add("7");
		list1.add("8");
		list1.add("9");
		list1.add("10");
		
		// 5. list1에 담긴 학생 10명의 이름을 출력해주세요. (반복문을 활용할 것)
		for (int i=0; i<list1.size(); i++) {
			System.out.println(list1.get(i));
		}

		System.out.println("---------------------------------");
		// 6. list1에 담긴 학생들 중, index가 홀수번째인 학생의 이름에 '-홀수'라는 텍스트를 추가해주세요.
		// ex) '홍길동-홀수'
		for (int i=0; i<list1.size(); i++) {
			if (i%2 != 0) {
				list1.set(i, list1.get(i) + "-홀수");
			}
		}
		
		// 7. list1에 담긴 학생들 중, index가 짝수번째인 학생이고 index가 5이상인 학생의 이름에 '-짝수'라는 텍스트를 추가해주세요.
		// ex) '홍길동-짝수'
		for (int i=0; i<list1.size(); i++) {
			if (i%2 == 0 && i >= 5) {
				list1.set(i, list1.get(i) + "-짝수");
			}
		}
		
		// 8. list1에 index 4번째 학생의 이름을 '홍길동'이라고 수정해주세요.
		list1.set(3, "홍길동");
		
		// 9. list1에 index 1번째 학생의 이름을 아무것도 없는 null로 수정해주세요.
		list1.set(0, "null");
		
		// 10. list1에 들어있는 모든 데이터를 출력해주세요.
		for (int i=0; i<list1.size(); i++) {
			System.out.println(list1.get(i));
		}

		System.out.println("---------------------------------");
		// 11. list1에 들어있는 데이터들 중, index 6번째에 해당하는 학생의 이름을 삭제해주세요.
		list1.remove(5);
		
		// 12. list1에 들어있는 데이터들 중, index 1번째에 해당하는 학생의 이름을 삭제해주세요.
		list1.remove(0);
		
		// 13. list1에 들어있는 데이터들 중, 첫번째 index에 해당하는 학생의 이름을 삭제하고, 마지막 index에 해당하는 학생의 이름을 삭제해주세요.
		for (int i=0; i<list1.size(); i++) {
			if (i == 0 || i == list1.size()-1) {
				list1.remove(i);
			}
		}
		
		// 14. list1에 index 5번째에 새로운 학생의 이름인 '전학생'을 추가해주세요.
		list1.set(4, "전학생");
		
		// 15. list1에 index 7번째에 새로운 학생의 이름인 '전학생2'를 추가해주세요.
		if (list1.size() > 6) {
			list1.set(6, "전학생2");
		} else {
			list1.add("전학생2");
		}
		
		// 16. list1에 들어있는 모든 데이터를 출력해주세요.
		for (int i=0; i<list1.size(); i++) {
			System.out.println(list1.get(i));
		}

		System.out.println("---------------------------------");
*/
		// #### Set 문제
		// 1. Set은 인터페이스인가요? 클래스인가요?
		// '1. OOO입니다.' 로 출력해주세요.
		System.out.println("Set은 인터페이스 입니다.");
		
		// 2. Set의 종류는 어떤것들이 있나요?
		// '2. OOO,OOO,OOO 등이 있습니다'와 같이 출력해주세요.
		System.out.println("HashSet, LinkedHashSet, TreeSet 등이 있습니다.");

		System.out.println("---------------------------------");
		// 3. 문자열을 담을 수 있고 변수명 set1으로 설정된 Set을 만들어주세요.
		// (변수 선언 및 초기화를 통한 인스턴스를 만들어주세요.)
		Set<String> set1 = new HashSet<String>();
		
		// 4. 3번에서 만든 set1에 무지개색깔을 추가해주세요.
		set1.add("빨");
		set1.add("주");
		set1.add("노");
		set1.add("초");
		set1.add("파");
		set1.add("남");
		set1.add("보");
		
		// 5. set1에 들어있는 모든 색깔을 출력해주세요.
		Iterator<String> it = set1.iterator();
		while (it.hasNext()) {
			String str = it.next();
			System.out.println(str);
		}

		System.out.println("---------------------------------");
		// 6. 5번에서 출력 시, 파랑 색깔인 경우 'blue'를 출력해주세요.
		Iterator<String> it2 = set1.iterator();
		while (it2.hasNext()) {
			String str = it2.next();
			
			if (str.equals("파")) {
				System.out.println("blue");
			} else {
				System.out.println(str);
			}
		}
		
		System.out.println("---------------------------------");
		// 7. set1에 들어있는 무지개 색깔 중 빨강색의 값을 'red'로 수정해주세요.
		set1.remove("빨");
		set1.add("red");

		
		// 8. set1에 들어있는 무지개 색깔 중 초록색의 값을 'green'으로 수정해주세요.
		set1.remove("초");
		set1.add("green");
		
		// 9. set1에 들어있는 무지개 색깔 중 남색, 보라색을 삭제해주세요.
		set1.remove("남");
		set1.remove("보");
		
		// 10. set1에 들어있는 모든 색깔을 출력해주세요.
		Iterator<String> it3 = set1.iterator();
		while (it3.hasNext()) {
			System.out.println(it3.next());
		}
		
		System.out.println("---------------------------------");
		// #### Map 문제
		// 1. Map은 인터페이스인가요? 클래스인가요?
		// '1. OOO입니다.' 로 출력해주세요.
		System.out.println("Map은 인터페이스 입니다.");
		
		// 2. Map의 종류는 어떤것들이 있나요?
		// '2. OOO,OOO,OOO 등이 있습니다'와 같이 출력해주세요.
		System.out.println("HashMap, HashTable, LinkedHashMap, TreeMap");
		
		System.out.println("---------------------------------");
		// 3. 문자열을 담을 수 있고 변수명 map1으로 설정된 Map을 만들어주세요.
		// (변수 선언 및 초기화를 통한 인스턴스를 만들어주세요.)
		Map<String, String> map1 = new HashMap<String, String>();
		
		// 4. map1에 좋아하는 동물 5마리를 넣어주세요.
		map1.put("key1", "호두");
		map1.put("key2", "나무");
		map1.put("key3", "달래");
		map1.put("key4", "나리");
		map1.put("key5", "자두");
		
		// 5. map1에 좋아하는 동물 5마리 중, 2마리만 꺼내서 출력해주세요.
		System.out.println(map1.get("key1"));
		System.out.println(map1.get("key3"));
		
		System.out.println("---------------------------------");
		// 6. map1에 좋아하는 동물 5마리 중, 첫번째로 넣었던 동물을 '사육사'로 변경해주세요.
		map1.put("key1", "사육사");
		
		// 7. map1에 들어있는 모든 데이터를 keySet()을 이용해서 데이터를 꺼내고 출력해주세요.
		// 출력 예) 'key1 = 동물'
		Set<String> sets = map1.keySet();
		Iterator<String> it4 = sets.iterator();
		while (it4.hasNext()) {
			String key = it4.next();
			System.out.println(map1.get(key));
		}
		
		System.out.println("---------------------------------");
		// 8. BoardVO 클래스를 만들어주세요.
		// BoardVO클래스는 총 3가지의 필드를 가지고 있습니다.
		// 글번호 : boNo
		// 글제목 : boTitle
		// 글내용 : boContent
		BoardVO bv = new BoardVO();
		bv.setBoNo(1);
		bv.setBoTitle("제목");
		bv.setBoContent("내용");
		
		// 9. BoardVO 타입의 데이터를 넣을 수 있는 Map타입의 변수명 map2를 만들어주세요.
		Map<String, BoardVO> map2 = new HashMap<String, BoardVO>();
		
		// 10. map2에 게시글 정보 3개를 넣어주세요.
		BoardVO bv1 = new BoardVO();
		bv1.setBoNo(1);
		bv1.setBoTitle("제목1");
		bv1.setBoContent("내용1");
		
		BoardVO bv2 = new BoardVO();
		bv2.setBoNo(2);
		bv2.setBoTitle("제목2");
		bv2.setBoContent("내용2");
		
		BoardVO bv3 = new BoardVO();
		bv3.setBoNo(3);
		bv3.setBoTitle("제목3");
		bv3.setBoContent("내용3");
		
		map2.put("key1", bv1);
		map2.put("key2", bv2);
		map2.put("key3", bv3);
		
		// 11. map2에 두번째로 넣은 게시글 정보를 꺼내서 출력해주세요.
		// 출력 예) 
		// 글 번호 : 2
		// 글 제목 : 제목입니다2
		// 글 내용 : 내용입니다2
		BoardVO bv4 = map2.get("key2");
		System.out.println(bv4.getBoNo());
		System.out.println(bv4.getBoTitle());
		System.out.println(bv4.getBoContent());
		
		// 12. map2에 두번째로 넣은 게시글 정보를 삭제해주세요.
		map2.remove("key2");
	}
}
