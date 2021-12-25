DROP TABLE notice IF EXISTS;

/**********************************/
/* Table Name: 공지사항 */
/**********************************/
CREATE TABLE notice(
		noticeno NUMERIC(10) NOT NULL PRIMARY KEY,
		noticename VARCHAR(50) NOT NULL,
		noticeseqno NUMERIC(10) NOT NULL,
		noticevisible CHAR(1) DEFAULT 'Y' NOT NULL IDENTITY,
		noticerdate DATE NOT NULL
);

