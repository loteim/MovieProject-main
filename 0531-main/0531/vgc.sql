-- 회원
CREATE TABLE `user` (
   `userId`    VARCHAR(15) NOT NULL COMMENT '회원아이디', -- 회원아이디
   `userName`  VARCHAR(40) NOT NULL COMMENT '이름', -- 이름
   `userPw`    VARCHAR(15) NOT NULL COMMENT '회원비밀번호', -- 회원비밀번호
   `userPhone` VARCHAR(20) NOT NULL COMMENT '회원휴대폰번호', -- 회원휴대폰번호
   `userEmail` VARCHAR(50) NOT NULL COMMENT '회원이메일' -- 회원이메일
)
COMMENT '회원';

-- 회원
ALTER TABLE `user`
   ADD CONSTRAINT `PK_user` -- 회원 기본키
   PRIMARY KEY (
   `userId` -- 회원아이디
   );

-- 영화예약
CREATE TABLE `reservation` (
   `reservationId` INT         NOT NULL COMMENT '아이디', -- 아이디
   `location`      VARCHAR(10) NOT NULL COMMENT '지역이름', -- 지역이름
   `hall`          INT         NOT NULL COMMENT '상영관', -- 상영관
   `spot`          VARCHAR(10) NOT NULL COMMENT '지점', -- 지점
   `date`          DATE        NOT NULL COMMENT '날짜', -- 날짜
   `time`          DATETIME    NOT NULL COMMENT '시간', -- 시간
   `userId`        VARCHAR(15) NULL     COMMENT '회원아이디' -- 회원아이디
)
COMMENT '영화예약';

-- 영화예약
ALTER TABLE `reservation`
   ADD CONSTRAINT `PK_reservation` -- 영화예약 기본키
   PRIMARY KEY (
   `reservationId` -- 아이디
   );

-- 티켓팅
CREATE TABLE `ticketing` (
   `ticketingId`   INT         NOT NULL COMMENT '아아디', -- 아아디
   `seat`          VARCHAR(10) NOT NULL COMMENT '좌석좌표', -- 좌석좌표
   `price`         INT         NOT NULL COMMENT '가격', -- 가격
   `reservationId` INT         NULL     COMMENT '아이디', -- 아이디
   `movieId`       VARCHAR(15) NULL     COMMENT '아이디2' -- 아이디2
)
COMMENT '티켓팅';

-- 티켓팅
ALTER TABLE `ticketing`
   ADD CONSTRAINT `PK_ticketing` -- 티켓팅 기본키
   PRIMARY KEY (
   `ticketingId` -- 아아디
   );

-- 영화정보
CREATE TABLE `movie` (
   `movieId` VARCHAR(15) NOT NULL COMMENT '아이디', -- 아이디
   `title`   VARCHAR(20) NOT NULL COMMENT '제목', -- 제목
   `genre`   VARCHAR(10) NOT NULL COMMENT '장르' -- 장르
)
COMMENT '영화정보';

-- 영화정보
ALTER TABLE `movie`
   ADD CONSTRAINT `PK_movie` -- 영화정보 기본키
   PRIMARY KEY (
   `movieId` -- 아이디
   );

-- 영화예약
ALTER TABLE `reservation`
   ADD CONSTRAINT `FK_user_TO_reservation` -- 회원 -> 영화예약
   FOREIGN KEY (
   `userId` -- 회원아이디
   )
   REFERENCES `user` ( -- 회원
   `userId` -- 회원아이디
   );

-- 티켓팅
ALTER TABLE `ticketing`
   ADD CONSTRAINT `FK_reservation_TO_ticketing` -- 영화예약 -> 티켓팅
   FOREIGN KEY (
   `reservationId` -- 아이디
   )
   REFERENCES `reservation` ( -- 영화예약
   `reservationId` -- 아이디
   );

-- 티켓팅
ALTER TABLE `ticketing`
   ADD CONSTRAINT `FK_movie_TO_ticketing` -- 영화정보 -> 티켓팅
   FOREIGN KEY (
   `movieId` -- 아이디2
   )
   REFERENCES `movie` ( -- 영화정보
   `movieId` -- 아이디
   );