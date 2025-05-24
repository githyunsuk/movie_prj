---------------시퀀스----------------------

DROP SEQUENCE role_idx_seq;
--권한 idx 시퀀스
CREATE SEQUENCE role_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 100
CACHE 20
NOCYCLE;


DROP SEQUENCE user_idx_seq;
--유저 idx 시퀀스
CREATE SEQUENCE user_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999999999999
CACHE 30
NOCYCLE;


DROP SEQUENCE verificcation_idx_seq;
--인증요청 idx 시퀀스
CREATE SEQUENCE verificcation_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999999999999
CACHE 30
NOCYCLE;


DROP SEQUENCE allowed_ip_idx_seq;
--허용IP idx 시퀀스
CREATE SEQUENCE allowed_ip_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;


DROP SEQUENCE seat_idx_seq;
--좌석 idx 시퀀스
CREATE SEQUENCE seat_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;


DROP SEQUENCE reservation_seat_idx_seq;
--예매좌석 idx 시퀀스
CREATE SEQUENCE reservation_seat_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE reservation_idx_seq;
--예매 idx 시퀀스
CREATE SEQUENCE reservation_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE review_idx_seq;
--리뷰 idx 시퀀스
CREATE SEQUENCE review_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE purchase_history_idx_seq;
--구매내역  idx 시퀀스
CREATE SEQUENCE purchase_history_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE saved_movie_idx_seq;
--찜한영화  idx 시퀀스
CREATE SEQUENCE saved_movie_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE inquiry_board_idx_seq;
--문의게시판 idx 시퀀스
CREATE SEQUENCE inquiry_board_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE notice_board_idx_seq;
--공지/뉴스 게시판 idx 시퀀스
CREATE SEQUENCE notice_board_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE theater_idx_seq;
--상영관 idx 시퀀스
CREATE SEQUENCE theater_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE schedule_idx_seq;
--상영스케줄 idx 시퀀스
CREATE SEQUENCE schedule_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE movie_idx_seq;
--영화 idx 시퀀스
CREATE SEQUENCE movie_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE people_code_idx_seq;
--영화인 코드 idx 시퀀스
CREATE SEQUENCE people_code_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;

DROP SEQUENCE code_idx_seq;
--영화등급장르 idx 시퀀스
CREATE SEQUENCE code_idx_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 10000
CACHE 20
NOCYCLE;



---------------테이블----------------------

DROP TABLE common_user CASCADE CONSTRAINTS;
--유저코드테이블
CREATE TABLE common_user(
    user_idx NUMBER,
    user_type VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_COMMON_USER PRIMARY KEY(user_idx)
);

DROP TABLE member CASCADE CONSTRAINTS;
--회원테이블
CREATE TABLE member(
    user_idx NUMBER,
    member_id VARCHAR2(20) NOT NULL UNIQUE,
    member_pwd VARCHAR2(100) NOT NULL,
    nick_name VARCHAR2(30) NOT NULL UNIQUE,
    user_name VARCHAR2(20) NOT NULL,
    birth DATE NOT NULL,
    tel VARCHAR2(20) NOT NULL UNIQUE,
    is_sms_agreed CHAR(1) NOT NULL,
    email VARCHAR2(50) NOT NULL UNIQUE,
    is_email_agreed CHAR(1) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    is_active CHAR(1) DEFAULT 'Y',
    picture VARCHAR2(255) NULL,
    member_ip VARCHAR2(50) NOT NULL,

    CONSTRAINT FK_common_user_TO_member FOREIGN KEY (user_idx) REFERENCES common_user(user_idx)
);

DROP TABLE non_member CASCADE CONSTRAINTS;
--비회원테이블
CREATE TABLE non_member(
    user_idx NUMBER,
    non_member_birth DATE NOT NULL,
    email VARCHAR2(50) NOT NULL,
    ticket_pwd VARCHAR2(20) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSDATE,
    CONSTRAINT FK_common_user_TO_non_member FOREIGN KEY (user_idx) REFERENCES common_user (user_idx)
);

DROP TABLE user_role_table CASCADE CONSTRAINTS;
--유저&권한테이블
CREATE TABLE user_role_table(
    user_idx NUMBER,
    role_idx NUMBER,
    CONSTRAINT PK_USER_ROLE_TABLE PRIMARY KEY (user_idx, role_idx),
    CONSTRAINT FK_common_user_TO_user_role FOREIGN KEY (user_idx) REFERENCES common_user (user_idx),
    CONSTRAINT FK_common_role_TO_user_role FOREIGN KEY (role_idx) REFERENCES role (role_idx)
);

DROP TABLE role CASCADE CONSTRAINTS;
--권한테이블
CREATE TABLE role (
    role_idx NUMBER,
    role_name VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_ROLE PRIMARY KEY (role_idx)
);



----------------------------------------------------------------------------

DROP TABLE admin CASCADE CONSTRAINTS;
--관리자 테이블
CREATE TABLE admin (
    admin_id VARCHAR2(20),
    user_idx NUMBER,
    admin_level VARCHAR2(20) DEFAULT 'MANAGER',
    admin_pwd VARCHAR2(100) NOT NULL,
    admin_name VARCHAR2(20) NOT NULL,
    admin_email VARCHAR2(50) NOT NULL UNIQUE,
    manage_area VARCHAR2(20) NOT NULL,
    last_login_date TIMESTAMP NULL,
    CONSTRAINT PK_ADMIN PRIMARY KEY (admin_id),
    CONSTRAINT FK_common_user_TO_admin FOREIGN KEY (user_idx) REFERENCES common_user(user_idx)
);

DROP TABLE user_verification CASCADE CONSTRAINTS;
--인증요청 테이블(비밀번호찾기)
CREATE TABLE user_verification (
    verification_idx NUMBER,
    user_idx NUMBER,
    verified_code VARCHAR2(20) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    expire_at TIMESTAMP NOT NULL,
    is_verified CHAR(1) DEFAULT 'N',
    CONSTRAINT PK_VERIFICATION PRIMARY KEY (verification_idx),
    CONSTRAINT FK_common_user_TO_verification FOREIGN KEY(user_idx) REFERENCES common_user(user_idx)
);

--접근허용된 관리자 IP 관리테이블
DROP SEQUENCE allowed_ip_seq;
CREATE SEQUENCE allowed_ip_seq
START WITH 1
INCREMENT BY 1
NOCACHE;
DROP TABLE allowed_ip CASCADE CONSTRAINTS;
CREATE TABLE allowed_ip(
    allowed_ip_idx NUMBER,
    admin_id VARCHAR(20),
    ip_address VARCHAR2(50),
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT PK_allowed_ip PRIMARY KEY (allowed_ip_idx),
    CONSTRAINT UQ_admin_ip UNIQUE (admin_id, ip_address), --중복방지
    CONSTRAINT FK_admin_TO_allowed_ip FOREIGN KEY (admin_id) REFERENCES admin(admin_id)
);



--미인증 코드 삭제: DB스케줄러 작업 등록
BEGIN
    DBMS_SCHEDULER.DROP_JOB(
        job_name => 'JOB_CLEANUP_VERIFY',
        force => TRUE
    );
END;
/

BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
    job_name => 'JOB_CLEANUP_VERIFY',
    job_type => 'PLSQL_BLOCK',
    job_action => '
        BEGIN
            DELETE FROM user_verification
            WHERE is_verified = ''N''
                AND expire_at < SYSTIMESTAMP - INTERVAL ''1'' DAY;
            END;',
    start_date => SYSTIMESTAMP,
    repeat_interval => 'FREQ=DAILY;BYHOUR=3', --새벽3시 작동
    ENABLED => TRUE,
    comments => '비밀번호 인증 미사용 코드 정리 작업'
    );
END;
/





---------------------------------------------------------------------------
DROP TABLE board_common_table CASCADE CONSTRAINTS;
--게시글유형코드 테이블

CREATE TABLE board_common_table (
    board_code_name VARCHAR2(20) NOT NULL,
    board_code_type VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_BOARD_COMMON_TABLE PRIMARY KEY (board_code_name)
);

DROP TABLE notice_board CASCADE CONSTRAINTS;
--공지/뉴스게시판 테이블
CREATE TABLE notice_board (
    notice_board_idx NUMBER NOT NULL,
    board_code_name VARCHAR2(20) NOT NULL,
    admin_id VARCHAR2(20) NOT NULL,
    notice_title VARCHAR2(100) NOT NULL,
    notice_content CLOB NOT NULL,
    created_time TIMESTAMP DEFAULT SYSDATE NOT NULL,
    view_count NUMBER DEFAULT 0 NOT NULL,
    CONSTRAINT PK_NOTICE_BOARD PRIMARY KEY (notice_board_idx)
);

DROP TABLE inquiry_board CASCADE CONSTRAINTS;
--1:1문의게시판 테이블
CREATE TABLE inquiry_board (
    inquiry_board_idx NUMBER NOT NULL,
    board_code_name VARCHAR2(20) NOT NULL,
    user_idx NUMBER NOT NULL,
    inquiry_title VARCHAR2(100) NOT NULL,
    inquiry_content CLOB NOT NULL,
    created_time TIMESTAMP DEFAULT SYSDATE NOT NULL,
    admin_id VARCHAR2(20) NULL,
    answer_status NUMBER DEFAULT 0 NOT NULL,
    answer_content CLOB NULL,
    answered_time TIMESTAMP DEFAULT SYSDATE NULL,
    CONSTRAINT PK_INQUIRY_BOARD PRIMARY KEY (inquiry_board_idx)
);

----------------------------------------------------------------------------
DROP TABLE movie CASCADE CONSTRAINTS;
--영화 테이블
CREATE TABLE MOVIE (
    movie_idx NUMBER NOT NULL,
    movie_name VARCHAR2(100) NOT NULL,
    poster_path VARCHAR2(200) NULL,
    release_date DATE NOT NULL,
    country VARCHAR2(20) NOT NULL,
    running_time NUMBER(3) NOT NULL,
    end_date DATE NOT NULL,
    movie_description VARCHAR2(2000) NOT NULL,
    screening_status NUMBER NOT NULL,
    trailer_url VARCHAR2(200) NULL,
    CONSTRAINT PK_MOVIE PRIMARY KEY (movie_idx)
);



DROP TABLE movie_common_table CASCADE CONSTRAINTS;
--영화등급장르 테이블
CREATE TABLE movie_common_table (
	code_idx	VARCHAR(255)		NOT NULL,
	movie_code_type	VARCHAR2(20)		NOT NULL,
	movie_code_name	VARCHAR2(20)		NOT NULL,
	CONSTRAINT PK_MOVIE_COMMON_TABLE PRIMARY KEY (code_idx),
	CONSTRAINT UK_MOVIE_COMMON_TABLE UNIQUE (movie_code_type, movie_code_name)
);



DROP TABLE movie_common_code_table CASCADE CONSTRAINTS;
--영화등급장르코드 테이블
CREATE TABLE movie_common_code_table (
    movie_idx NUMBER NOT NULL,
    code_idx VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_movie_common_code_table PRIMARY KEY (movie_idx, code_idx),
    CONSTRAINT FK_MOVIE_TO_movie_common_code_table FOREIGN KEY (movie_idx) REFERENCES MOVIE (movie_idx),
    CONSTRAINT FK_MOVIE_COMMON_TABLE_TO_movie_common_code_table FOREIGN KEY (code_idx) REFERENCES movie_common_table (code_idx)--복합 기본키는 두개다 참조해야함 에러
);


DROP TABLE movie_people_common_table CASCADE CONSTRAINTS;
--영화인코드 테이블
CREATE TABLE movie_people_common_table (
    people_code_idx NUMBER NOT NULL,
    people_code_type VARCHAR2(20) NOT NULL,
    people_name VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_MOVIE_PEOPLE_COMMON_TABLE PRIMARY KEY (people_code_idx)
);

DROP TABLE movie_people_table CASCADE CONSTRAINTS;
--영화&영화인 테이블
CREATE TABLE movie_people_table (
    movie_idx NUMBER NOT NULL,
    people_code_idx NUMBER NOT NULL,
    CONSTRAINT PK_MOIVE_PEOPLE_TABLE PRIMARY KEY (movie_idx, people_code_idx),
    CONSTRAINT FK_MOVIE_TO_MOIVE_PEOPLE_TABLE FOREIGN KEY (movie_idx) REFERENCES MOVIE (movie_idx),
    CONSTRAINT FK_MOVIE_PEOPLE_COMMON_TABLE_TO_MOIVE_PEOPLE_TABLE FOREIGN KEY (people_code_idx) REFERENCES movie_people_common_table (people_code_idx)
);

DROP TABLE theater CASCADE CONSTRAINTS;
--상영관 테이블
CREATE TABLE theater (
    theater_idx NUMBER NOT NULL,
    theater_type VARCHAR2(20) NOT NULL,
    theater_name VARCHAR2(20) NOT NULL,
    movie_price NUMBER NOT NULL,
    CONSTRAINT PK_THEATER PRIMARY KEY (theater_idx),
    CONSTRAINT UQ_THEATER_NAME UNIQUE (theater_name)
);


DROP TABLE schedule CASCADE CONSTRAINTS;
--상영스케줄 테이블
CREATE TABLE schedule (
    schedule_idx NUMBER NOT NULL,
    movie_idx NUMBER NOT NULL,
    theater_idx NUMBER NOT NULL,
    screen_date DATE NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    schedule_status NUMBER DEFAULT 0 NOT NULL,
    CONSTRAINT PK_SCHEDULE PRIMARY KEY (schedule_idx),
    CONSTRAINT FK_MOVIE_TO_SCHEDULE FOREIGN KEY (movie_idx) REFERENCES MOVIE (movie_idx),
    CONSTRAINT FK_THEATER_TO_SCHEDULE FOREIGN KEY (theater_idx) REFERENCES theater (theater_idx)
);


DROP TABLE review_movie CASCADE CONSTRAINTS;
--영화리뷰 테이블
CREATE TABLE review_movie (
    review_idx NUMBER NOT NULL,
    user_idx NUMBER NOT NULL,
    movie_idx NUMBER NOT NULL,
    review_contents VARCHAR2(900) NOT NULL,
    CONSTRAINT PK_REVIEW_MOVIE PRIMARY KEY (review_idx, user_idx, movie_idx),
    CONSTRAINT FK_COMMON_USER_TO_REVIEW_MOVIE FOREIGN KEY (user_idx) REFERENCES common_user (user_idx),
    CONSTRAINT FK_MOVIE_TO_REVIEW_MOVIE FOREIGN KEY (movie_idx) REFERENCES MOVIE (movie_idx)
);


DROP TABLE saved_movie CASCADE CONSTRAINTS;
--찜한영화 테이블
CREATE TABLE saved_movie (
    saved_movie_idx NUMBER NOT NULL,
    user_idx NUMBER NOT NULL,
    movie_idx NUMBER NOT NULL,
    CONSTRAINT PK_SAVED_MOVIE PRIMARY KEY (saved_movie_idx, user_idx, movie_idx),
    CONSTRAINT FK_COMMON_USER_TO_SAVED_MOVIE FOREIGN KEY (user_idx) REFERENCES common_user (user_idx),
    CONSTRAINT FK_MOVIE_TO_SAVED_MOVIE FOREIGN KEY (movie_idx) REFERENCES MOVIE (movie_idx)
);

----------------------------------------------------------------------------


DROP TABLE reservation CASCADE CONSTRAINTS;
--예매 테이블
CREATE TABLE reservation (
    reservation_idx NUMBER NOT NULL,
    schedule_idx NUMBER NOT NULL,
    user_idx NUMBER NOT NULL,
    reservation_date TIMESTAMP DEFAULT SYSDATE NOT NULL,
    canceld_date TIMESTAMP DEFAULT SYSDATE NULL,
    total_price NUMBER NOT NULL,
    reservation_number VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_RESERVATION PRIMARY KEY (reservation_idx),
    CONSTRAINT FK_SCHEDULE FOREIGN KEY (schedule_idx) REFERENCES schedule (schedule_idx)
);


DROP TABLE seat CASCADE CONSTRAINTS;
--좌석 테이블
CREATE TABLE seat (
    seat_idx NUMBER NOT NULL,
    seat_number VARCHAR2(5) NOT NULL,
    CONSTRAINT PK_SEAT PRIMARY KEY (seat_idx)
);


DROP TABLE reserved_seat CASCADE CONSTRAINTS;
--예매좌석 테이블
CREATE TABLE reserved_seat (
    reservation_seat_idx NUMBER NOT NULL,
    seat_idx NUMBER NOT NULL,
    reservation_idx NUMBER NOT NULL,
    schedule_idx NUMBER NOT NULL,
    reserved_seat_status CHAR(1) DEFAULT 'N' NOT NULL,
    CONSTRAINT PK_RESERVED_SEAT PRIMARY KEY (reservation_seat_idx, seat_idx, reservation_idx, schedule_idx),
    CONSTRAINT FK_SEAT FOREIGN KEY (seat_idx) REFERENCES seat (seat_idx),
    CONSTRAINT FK_RESERVATION FOREIGN KEY (reservation_idx) REFERENCES reservation (reservation_idx),
    CONSTRAINT FK_SCHEDULE2 FOREIGN KEY (schedule_idx) REFERENCES schedule (schedule_idx)
);


--구매내역 테이블
DROP TABLE purchase_history CASCADE CONSTRAINTS;
CREATE TABLE purchase_history (
    purchase_history_idx NUMBER NOT NULL,
    user_idx NUMBER NOT NULL,
    reservation_idx NUMBER NOT NULL,
    is_purchased CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT PK_PURCHASE_HISTORY PRIMARY KEY (purchase_history_idx, user_idx, reservation_idx),
    CONSTRAINT FK_COMMON_USER_TO_PURCHASE_HISTORY FOREIGN KEY (user_idx) REFERENCES common_user (user_idx),
    CONSTRAINT FK_RESERVATION_TO_PURCHASE_HISTORY FOREIGN KEY (reservation_idx) REFERENCES reservation (reservation_idx)
);


-------------------------가데이터---------------------------------------------------
INSERT INTO theater(theater_idx, theater_type, theater_name, movie_price)
VALUES(theater_idx_seq.NEXTVAL, '2D', '1관', 15000);
INSERT INTO theater(theater_idx, theater_type, theater_name, movie_price)
VALUES(theater_idx_seq.NEXTVAL, '2D', '2관', 15000);
INSERT INTO theater(theater_idx, theater_type, theater_name, movie_price)
VALUES(theater_idx_seq.NEXTVAL, '2D', '3관', 15000);
INSERT INTO theater(theater_idx, theater_type, theater_name, movie_price)
VALUES(theater_idx_seq.NEXTVAL, 'IMAX', 'IMAX관', 18000);
INSERT INTO theater(theater_idx, theater_type, theater_name, movie_price)
VALUES(theater_idx_seq.NEXTVAL, '4DX', '4DX관', 20000);

INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('공지','극장');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('공지','이벤트');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('공지','시스템점검');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('공지','기타');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('문의','문의');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('문의','불만');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('문의','칭찬');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('문의','제안');
INSERT INTO board_common_table(board_code_type, board_code_name) VALUES('문의','분실물');

INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '액션', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '범죄', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, 'SF', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '코미디', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '스릴러', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '공포', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '로맨스', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '드라마', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '애니메이션', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '뮤지컬', '장르');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, 'ALL', '등급');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '12', '등급');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '15', '등급');
INSERT INTO movie_common_table(code_idx, movie_code_type, movie_code_name)
VALUES(code_idx_seq.NEXTVAL, '18', '등급');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'A14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'B14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'C14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'D14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'E14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'F14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'G14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'H14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'I14');

INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J1');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J2');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J3');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J4');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J5');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J6');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J7');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J8');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J9');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J10');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J11');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J12');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J13');
INSERT INTO seat(seat_idx, seat_number) VALUES(seat_idx_seq.NEXTVAL, 'J14');

--영화 가데이터
INSERT INTO MOVIE(MOVIE_IDX, MOVIE_NAME,RELEASE_DATE, COUNTRY, RUNNING_TIME, END_DATE, MOVIE_DESCRIPTION, TRAILER_URL, SCREENING_STATUS)
VALUES(movie_idx_seq.NEXTVAL,'스타워즈:제국의 역습','2025/05/10','미국',124,'2025/06/28',
'반란 연합 장교가 된 루크 스카이워커의 앞에 포스의 영이 된 오비완 케노비가 나타나 대고바 행성에서 요다와 수행하라는 전언을 한다. 포스 수련을 하는 루크를 쫓기 위해 제국군이 파견되고 한 솔로, 레아 오르가나, 그리고 결국 루크까지 다스 베이더의 함정에 빠지게 된다.'
,'https://youtu.be/VyoPZP__naI',1);

INSERT INTO movie(movie_idx, movie_name, release_date, country, running_time, end_date, movie_description, screening_status, trailer_url)
VALUES(movie_idx_seq.NEXTVAL, '어바웃 타임', '2025-05-18', '영국', 123, '2025-06-20',
'평범한 소년 팀은 성인이 되던 날, 아버지로부터 가문의 남자들은 시간을 되돌릴 수 있는 능력을 가지고 태어난다는 말을 듣게 된다.',  1, 'https://www.youtube.com/watch?v=7OIFdWk83no&pp=0gcJCdgAo7VqN5tD');

INSERT into MOVIE(MOVIE_IDX, MOVIE_NAME, RELEASE_DATE, COUNTRY, RUNNING_TIME, END_DATE, MOVIE_DESCRIPTION, SCREENING_STATUS, TRAILER_URL)
VALUES (movie_idx_seq.NEXTVAL, '레미제라블', '2025-05-30', '미국', 158, '2025-06-25', '빵 한 조각을 훔친 죄로 19년간의 감옥살이를 마친 후에도 전과자의 낙인이 찍힌 채 살아가는 장발장. 장발장을 끈질기게 추격하며 그의 새로운 삶을 뒤흔드는 자베르 경감. 주변 사람들의 모함으로 지독한 가난 속에서 아이를 위해 생존해가는 비운의 여인 판틴. 장발장에게 희망이 되어 준 판틴의 딸 코제트. 그리고 파리의 자유와 사랑을 위해 싸우는 마리우스, 에포닌, 앙졸라. 사랑과 용서, 구원과 희망을 꿈꾸는 그들의 노래가 스크린에 울려 퍼진다', '0', 'https://www.youtube.com/watch?v=y1LUXws8obU');

INSERT into MOVIE(MOVIE_IDX, MOVIE_NAME, RELEASE_DATE, COUNTRY, RUNNING_TIME, END_DATE, MOVIE_DESCRIPTION, SCREENING_STATUS, TRAILER_URL)
VALUES (movie_idx_seq.NEXTVAL, '승부', '2025-05-23', '대한민국', 114, '2025-06-05','천재 바둑기사와 그를 가르친 스승의 대결을 그린 휴먼 드라마', 1, 'https://www.youtube.com/watch?v=J8qqMLZPPTo');

INSERT into MOVIE(MOVIE_IDX, MOVIE_NAME, RELEASE_DATE, COUNTRY, RUNNING_TIME, END_DATE, MOVIE_DESCRIPTION, SCREENING_STATUS, TRAILER_URL)
VALUES (movie_idx_seq.NEXTVAL, '극한직업', '2025-05-15', '대한민국', 111, '2025-06-10','불철주야 달리고 구르지만 실적은 바닥, 급기야 해체 위기를 맞는 마약반! 더 이상 물러설 곳이 없는 팀의 맏형 고반장은 국제 범죄조직의 국내 마약 밀반입 정황을 포착하고 장형사, 마형사, 영호, 재훈까지 4명의 팀원들과 함께 잠복 수사에 나선다. 마약반은 24시간 감시를 위해 범죄조직의 아지트 앞 치킨집을 인수해 위장 창업을 하게 되고, 뜻밖의 절대미각을 지닌 마형사의 숨은 재능으로 치킨집은 일약 맛집으로 입소문이 나기 시작한다. 수사는 뒷전, 치킨장사로 눈코 뜰 새 없이 바빠진 마약반에게 어느 날 절호의 기회가 찾아오는데… 범인을 잡을 것인가, 닭을 잡을 것인가!',
 1, 'https://www.youtube.com/watch?v=xM1CIQd_X4c');

--유저 가데이터----------------------------------------
--권한
INSERT INTO ROLE (role_idx, role_name)
VALUES (1, 'ROLE_GUEST');
INSERT INTO ROLE (role_idx, role_name)
VALUES (2, 'ROLE_MEMBER');
INSERT INTO ROLE (role_idx, role_name)
VALUES (3, 'ROLE_MANAGER');
INSERT INTO ROLE (role_idx, role_name)
VALUES (4, 'ROLE_SUPERADMIN');



--유저코드테이블
--유저코드 테이블 넣기전에, COMMON_USER_IDX.SEQ 초기화 해주세요. 1번부터 들어갈수 있도록.
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'GUEST'); -- 3번 시행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'GUEST'); -- 3번 시행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'GUEST'); -- 3번 시행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'MEMBER'); -- 5번 실행INSERT INTO common_user(user_idx, user_type)

INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'MEMBER'); -- 5번 실행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'MEMBER'); -- 5번 실행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'MEMBER'); -- 5번 실행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'MEMBER'); -- 5번 실행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'ADMIN'); -- 4번 실행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'ADMIN'); -- 4번 실행
INSERT INTO common_user(user_idx, user_type)
VALUES(user_idx_seq.NEXTVAL, 'ADMIN'); -- 4번 실행

INSERT INTO common_user(user_idx, user_type)
VALUES(1000000, 'SUPERADMIN'); --관리자는 100만idx를 부여해서, 이용자 100만이 넘길 기도한다 -- 1번 실행



--유저&권한 테이블
--비회원
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (1,1);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (2,1);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (3,1);
--회원
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (4,2);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (5,2);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (6,2);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (7,2);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (8,2);
--매니저
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (9,3);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (10,3);
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (11,3);
--슈퍼어드민
INSERT INTO user_role_table (user_idx, role_idx)
VALUES (1000000,4);



--비회원
INSERT INTO non_member(user_idx, non_member_birth, email, ticket_pwd, created_at)
VALUES (1, '2000-08-19', 'guest001@gmail.com', 'guestPwd01', sysdate);
INSERT INTO non_member(user_idx, non_member_birth, email, ticket_pwd, created_at)
VALUES (2, '1900-05-20', 'guest002@naver.com', 'guestPwd02', sysdate);
INSERT INTO non_member(user_idx, non_member_birth, email, ticket_pwd, created_at)
VALUES (3, '1800-03-21', 'guest003@gmail.com', 'guestPwd03', sysdate);

--회원
INSERT INTO member(user_idx, member_id, member_pwd, nick_name, user_name, birth, tel, is_sms_agreed, email, is_email_agreed, created_at, is_active, picture, member_ip)
VALUES(4, 'testMember01', 'memberPwd01', '테스트멤버01', '일멤버', TO_DATE('1951-01-12', 'YYYY-MM-DD'), '010-1111-1111', 'N', 'member01@gmaile.com', 'Y', TO_DATE('2015-04-19', 'YYYY-MM-DD'), 'Y', null, '172.30.1.51');
INSERT INTO member(user_idx, member_id, member_pwd, nick_name, user_name, birth, tel, is_sms_agreed, email, is_email_agreed, created_at, is_active, picture, member_ip)
VALUES(5, 'testMember02', 'memberPwd02', '테스트멤버02', '이멤버', TO_DATE('1952-02-02', 'YYYY-MM-DD'), '010-2222-2222', 'Y', 'member02@naver.com', 'N', TO_DATE('2016-04-19', 'YYYY-MM-DD'), 'Y', null, '172.30.1.52');
INSERT INTO member(user_idx, member_id, member_pwd, nick_name, user_name, birth, tel, is_sms_agreed, email, is_email_agreed, created_at, is_active, picture, member_ip)
VALUES(6, 'testMember03', 'memberPwd03', '테스트멤버03', '삼멤버', TO_DATE('1953-03-22', 'YYYY-MM-DD'), '010-3333-3333', 'Y', 'member03@gmaile.com', 'N', TO_DATE('2017-05-19', 'YYYY-MM-DD'), 'Y', null, '172.30.1.53');
INSERT INTO member(user_idx, member_id, member_pwd, nick_name, user_name, birth, tel, is_sms_agreed, email, is_email_agreed, created_at, is_active, picture, member_ip)
VALUES(7, 'testMember04', 'memberPwd04', '테스트멤버04', '사멤버', TO_DATE('1954-04-09', 'YYYY-MM-DD'), '010-4444-4444', 'N', 'member04@gmaile.com', 'Y', TO_DATE('2018-09-19', 'YYYY-MM-DD'), 'Y', null, '172.30.1.54');
INSERT INTO member(user_idx, member_id, member_pwd, nick_name, user_name, birth, tel, is_sms_agreed, email, is_email_agreed, created_at, is_active, picture, member_ip)
VALUES(8, 'testMember05', 'memberPwd05', '테스트멤버05', '오멤버', To_DATE('1985-05-09', 'YYYY-MM-DD'), '010-5555-5555', 'Y', 'member05@naver.com', 'N', sysdate, 'Y', null, '172.30.1.55');

--매니저
INSERT INTO admin(admin_id, user_idx, admin_pwd, admin_name, admin_email, manage_area, last_login_date)
VALUES('winter01', 9, 'adminPwd01', '윈터', 'winter@gmaile.com', '문의답변', TO_TIMESTAMP('2024-05-20 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO admin(admin_id, user_idx, admin_pwd, admin_name, admin_email, manage_area, last_login_date)
VALUES('karina02', 10, 'adminPwd02', '카리나', 'karina@naver.com', '상영스케줄', SYSTIMESTAMP);
INSERT INTO admin(admin_id, user_idx, admin_pwd, admin_name, admin_email, manage_area, last_login_date)
VALUES('ningning03', 11, 'adminPwd03', '닝닝', 'ningning@gmaile.com', '영화등록', SYSTIMESTAMP);

--슈퍼운영자
INSERT INTO admin(admin_id, user_idx, admin_pwd, admin_name, admin_email, manage_area, last_login_date)
VALUES('superadmin', 1000000, 'superPwd', '난슈퍼운영자', 'superAdmin@gmail.com', '전체', SYSTIMESTAMP);

--접근허용된관리자IP
INSERT INTO allowed_ip(allowed_ip_idx, admin_id, ip_address)
VALUES(allowed_ip_seq.nextval, 'winter01', '172.30.1.90');
INSERT INTO allowed_ip(allowed_ip_idx, admin_id, ip_address)
VALUES(allowed_ip_seq.nextval, 'winter01', '172.30.1.91');

INSERT INTO allowed_ip(allowed_ip_idx, admin_id, ip_address)
VALUES(allowed_ip_seq.nextval, 'karina02', '192.168.10.90');

INSERT INTO allowed_ip(allowed_ip_idx, admin_id, ip_address)
VALUES(allowed_ip_seq.nextval, 'ningning03', '172.30.1.90');
INSERT INTO allowed_ip(allowed_ip_idx, admin_id, ip_address)
VALUES(allowed_ip_seq.nextval, 'ningning03', '172.30.1.92');


commit;
