
SELECT * FROM blogheadline;
SELECT * FROM reply;

-- 카테고리
SELECT * FROM category;

INSERT INTO category(categoryName,createDate)
VALUES ('JAVA' , now());

INSERT INTO category(categoryName,createDate)
VALUES ('DataBase' , now());

INSERT INTO category(categoryName,createDate)
VALUES ('Spring' , now());

INSERT INTO category(categoryName,createDate)
VALUES ('Dart' , now());

INSERT INTO category(categoryName,createDate)
VALUES ('HTML/CSS' , now());

INSERT INTO category(categoryName,createDate)
VALUES ('Project' , now());


-- board
SELECT * FROM board;


-- 자바
INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java1.jpg', 
'컴퓨터기초, 개발환경준비, 첫 프로그램 실행',
'2023-01-27 18:46:57.042000', '[230127] 자바 #1 (컴퓨터기초, 개발환경준비, 첫 프로그램 실행)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java2.jpg', 
'프로그래밍, 자바 개념, 변수, 자료명, 데이터 타입',
'2023-01-27 18:46:57.042000', '[230127] 자바 #2 (프로그래밍, 자바 개념, 변수, 자료명, 데이터 타입)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java3.jpg', 
'상수, 리터럴, 형 변환',
'2023-01-27 18:46:57.042000', '[230127] 자바 #3 (상수, 리터럴, 형 변환)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java4.jpg', 
'연산자',
'2023-01-27 18:46:57.042000', '[230127] 자바 #4 (연산자)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES (null, 
'연산자, 형 변환 관련 문제 10개',
'2023-01-28 18:46:57.042000', '[230128] 주말 숙제! (연산자, 형 변환 관련 문제 10개)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java5.jpg', 
'조건문, 반복문, continue, break문',
'2023-01-28 18:46:57.042000', '[230128] 자바 #5(조건문, 반복문, continue, break문)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java6.jpg', 
'야구게임 (if,  do-while의 활용 예제)',
'2023-01-29 18:46:57.042000', '[230129] 자바 #6 야구게임 (if,  do-while의 활용 예제)', 1);


INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java7.jpg', 
'객체지향언어, 클래스, 멤버‧지역변수, Stack‧Heap, 함수와 메서드',
'2023-01-29 18:46:57.042000', '[230129] 자바 #7 (객체지향언어, 클래스, 함수와 메서드)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java8.jpg', 
'생성자, 접근 제어 지시자',
'2023-01-30 18:46:57.042000', '[230130] 자바 #8  (생성자, 접근 제어 지시자)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES (null, 
'미니과제',
'2023-01-30 18:46:57.042000', '[230130] 자바 #8-1 미니과제', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java9.jpg', 
'this, static,싱글톤 패턴',
'2023-01-31 18:46:57.042000', '[230131] 자바 #9 (this, static,싱글톤 패턴)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES (null, 
'과제',
'2023-01-31 18:46:57.042000', '[230131] 자바 #10 과제', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java10.jpg', 
'스타그래프트 예제',
'2023-01-31 18:46:57.042000', '[230131] 자바 #11 - 스타그래프트 예제', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java11.jpg', 
'배열[]',
'2023-01-31 18:46:57.042000', '[230131] 자바 #12 (배열[])', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java12.jpg', 
'점(.) 연산자의 여행',
'2023-01-31 18:46:57.042000', '[230131] 자바 #13 (점(.) 연산자의 여행)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES (null, 
'도서 관리 프로그램',
'2023-01-31 18:46:57.042000', '[230131] 자바 #14 과제 (도서 관리 프로그램)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java13.jpg', 
'상속과 다형성 , 추상 클래스',
'2023-01-31 18:46:57.042000', '[230131] 자바 #15 (상속과 다형성 , 추상 클래스)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES (null, 
'로또 프로그램',
'2023-01-31 18:46:57.042000', '[230131] 자바 #16 과제 (로또 프로그램)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java14.jpg', 
'인터페이스',
'2023-02-01 18:46:57.042000', '[230201] 자바 #17 (인터페이스)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java15.jpg', 
'객체 지향 핵심과정',
'2023-02-01 18:46:57.042000', '[230201] 자바 #18 (객체 지향 핵심과정)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java10.jpg', 
'Object 클래스 , ArrayList',
'2023-02-01 18:46:57.042000', '[230201] 자바 #19 (Object 클래스 , ArrayList)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES (null, 
'자유 과제 (가위·바위·보 게임, 전화번호부, 비밀일기장)',
now(), '[230203] 자바 #20 자유 과제 (가위·바위·보 게임, 전화번호부, 비밀일기장)', 1);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('java5.jpg', 
' Swing(GUI 프로그램 ,배치 관리자 (레이아웃 Layout)',
now(), '[230203] 자바 #21 Swing(GUI 프로그램 ,배치 관리자 (레이아웃 Layout))', 1);



-- mysql
INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #1  DB 개념, My SQL 설치하기 & 설정하기',
'2023-01-10 18:46:57.042000', '[230127] DB #1  DB 개념, My SQL 설치하기 & 설정하기', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #2 (MySQL) CRUD 기능',
'2023-01-12 18:46:57.042000', '[230127] DB #2 (MySQL) CRUD 기능', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #3 (MySQL) PK와 FK, JOIN문(결과집합)',
'2023-01-13 18:46:57.042000', '[230127] DB #3 (MySQL) PK와 FK, JOIN문(결과집합)', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #4 (MySQL) 데이터 타입, 그룹바이(Group By), HAVING절, 집계함수, MySQL 다양한 함수 & 키워드',
'2023-01-14 18:46:57.042000', '[230127] DB #4 (MySQL) 데이터 타입, 그룹바이(Group By), HAVING절, 집계함수, MySQL 다양한 함수 & 키워드', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #5 (MySQL) 내장함수, 서브쿼리, 사용자 설정',
'2023-01-15 18:46:57.042000', '[230127] DB #5 (MySQL) 내장함수, 서브쿼리, 사용자 설정', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #6 (MySQL) ERD 만들기, 데이터베이스 백업 및 복원',
'2023-01-16 18:46:57.042000', '[230127] DB #6 (MySQL) ERD 만들기, 데이터베이스 백업 및 복원', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #7 (MySQL) 정규화',
'2023-01-17 18:46:57.042000', '[230127] DB #7 (MySQL) 정규화', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #8 (MySQL) 정규화 미니 프로젝트',
'2023-01-18 18:46:57.042000', '[230127] DB #8 (MySQL) 정규화 미니 프로젝트', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #9 (MySQL) 관계차수(Cardinality)',
'2023-01-19 18:46:57.042000', '[230127] DB #9 (MySQL) 관계차수(Cardinality)', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #10 (MySQL) JAVA와 연동하기',
'2023-01-20 18:46:57.042000', '[230127] DB #10 (MySQL) JAVA와 연동하기', 2);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('mysql.jpg', 
'DB #11 (MySQL) PK&FK 변경·삭제 (CASCADE), 테이블 복사',
'2023-01-21 18:46:57.042000', '[230127] DB #11 (MySQL) PK&FK 변경·삭제 (CASCADE), 테이블 복사', 2);

-- 스프링
INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot - JWT 블로그 가상 서버 셋팅하기',
'2023-01-22 18:46:57.042000', '[230122] SpringBoot - JWT 블로그 가상 서버 셋팅하기', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot - API문서 (CRUD)',
'2023-01-23 18:46:57.042000', '[230123] SpringBoot - API문서 (CRUD)', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ①,② - 시작 환경 설정 및 소개',
'2023-01-24 18:46:57.042000', '[230124] SpringBoot ①,② - 시작 환경 설정 및 소개', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - GET & POST & PUT & DELETE',
'2023-01-25 18:46:57.042000', '[230125] SpringBoot ① - GET & POST & PUT & DELETE', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - Response',
'2023-01-25 18:46:57.042000', '[230125] SpringBoot ① - Response', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - Annotations (어노테이션)',
'2023-01-26 18:46:57.042000', '[230126] SpringBoot ① - Annotations (어노테이션)', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - Annotations (어노테이션)',
'2023-01-27 18:46:57.042000', '[230127] SpringBoot ① -  DI, IoC ,Validation & BindingResult', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - Custom Validation, Exception, Validation 활용',
'2023-01-28 18:46:57.042000', '[230128] SpringBoot ① - Custom Validation, Exception, Validation 활용', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - AOP',
'2023-01-29 18:46:57.042000', '[230129] SpringBoot ① - AOP', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - 스프링 개념 정의 (JPA)',
'2023-01-30 18:46:57.042000', '[230130] SpringBoot ① - 스프링 개념 정의 (JPA)', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
'SpringBoot ① - Filter, Interceptor',
'2023-01-31 18:46:57.042000', '[230131] SpringBoot ① - Filter, Interceptor', 3);

INSERT INTO board(boardImg,content, createDate, title, categoryId) 
VALUES ('spring.jpg', 
' SpringBoot ② - 기본 설정1 : JPA (의존성 설정), MySQL 설정',
'2023-02-01 18:46:57.042000', '[230201] SpringBoot ② - 기본 설정1 : JPA (의존성 설정), MySQL 설정' , 3);



