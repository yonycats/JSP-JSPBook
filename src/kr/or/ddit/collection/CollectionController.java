package kr.or.ddit.collection;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import kr.or.ddit.collection.BoardVO;

public class CollectionController {

	public static void main(String[] args) {
		/*
		 * Collection 종류
		 * 
		 * 1. List (interface)
		 * - 출석부 (index, 순서가 O / 출석부는 동명이인이 존재, 데이터 중복 O)
		 * - List라는 인터페이스를 참조받고 있는 구현체클래스 
		 *  > ArrayList
		 * 
		 * 2. 방법론
		 * - 데이터를 추가 : add()
		 * - 데이터를 꺼내야할때 : get()
		 * - 데이터를 수정 : set()
		 * - 데이터를 삭제 : remove()
		 */
		
//		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
//		BoardVO boardVO1 = new BoardVO(1, "제목1", "내용1", "홍길동");
//		BoardVO boardVO2 = new BoardVO(2, "제목2", "내용2", "홍길순");
//		BoardVO boardVO3 = new BoardVO(3, "제목3", "내용3", "유재석");
//		BoardVO updateVO = new BoardVO(10, "수정", "수정", "수정");
//		boardList.add(boardVO1);
//		boardList.add(boardVO2);
//		boardList.add(boardVO3);
//		
//		System.out.println(boardList);
//		for(int i = 0; i < boardList.size(); i++) {
//			BoardVO board = boardList.get(i);
//			System.out.println(board.getBoNo());
//			System.out.println(board.getBoTitle());
//			System.out.println(board.getBoContent());
//			if(i % 2 == 0) {	// 짝수일때
////				boardList.get(i).setBoTitle("수정된 제목");
//				boardList.set(i, updateVO);
//			}else {
//				boardList.remove(i);
//			}
//		}
//
//		System.out.println("---------------------------------");
//		
//		for(int i = 0; i < boardList.size(); i++) {
//			BoardVO board = boardList.get(i);
//			System.out.println(board.getBoNo());
//			System.out.println(board.getBoTitle());
//			System.out.println(board.getBoContent());
//			System.out.println();
//		}
		
		/*
		 * 2. Set 
		 * - 무지개색깔 구슬이 들어있는 주머니
		 * - 중복X , null조차 중복 X, 순서 X
		 * 
		 * - 데이터 꺼낼때 : iterator 조력자
		 */
		
		Set ss;
		HashSet sss;
		
		Set<String> set = new HashSet<String>();
		set.add("1");
		set.add("2");
		set.add("3");
		set.add("4");
		set.add("3");
		
		Iterator<String> ite = set.iterator();
		while(ite.hasNext()) {	// 데이터가 있는지 여부
			String value = ite.next();	// 데이터를 꺼낼때
			System.out.println("set : " + value);
		}
		
		/*
		 * 3. Map
		 * - 306호의 나자신
		 * 
		 * 데이터 넣을 때 : put()
		 * 데이터를 꺼낼 때 : get()
		 * 데이터를 수정할 때 : put() (덮어 씌워진다)
		 */
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("key1", "홍길동1");
		maps.put("key2", "홍길동2");
		maps.put("key3", "홍길동3");
		maps.put("key4", "홍길동4");
		maps.put("key1", "홍길동5");
		maps.put("key5", "홍길동6");
		
		System.out.println("key 1 : " + maps.get("key1"));
		System.out.println("key 2 : " + maps.get("key2"));
		System.out.println("key 3 : " + maps.get("key3"));
		System.out.println("key 4 : " + maps.get("key4"));
		System.out.println("key 5 : " + maps.get("key5"));
		
		Set<String> sets = maps.keySet();
		Iterator<String> ite1 = sets.iterator();
		while(ite1.hasNext()) {
			System.out.println(ite1.next());
		}
		
		System.out.println("--------------------------------------");
		
		Set<Entry<String, String>> entry = maps.entrySet();
		Iterator<Entry<String, String>> ite2 = entry.iterator();
		while(ite2.hasNext()) {
			Entry<String, String> ent = ite2.next();
			String key = ent.getKey();
//			String value1 = maps.get(key);
			String value = ent.getValue();
			System.out.println(key + " :::: " + value);
//			System.out.println(value1);
		}
		
	}
	
}


































