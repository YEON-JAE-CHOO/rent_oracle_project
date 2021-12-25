DROP TABLE content IF EXISTS;
DROP TABLE cargrp IF EXISTS;

/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE content(
		carno NUMERIC(10) NOT NULL PRIMARY KEY,
		cargrpno NUMERIC(10) NOT NULL,
		carname VARCHAR(100) NOT NULL,
		carword VARCHAR(100),
		option VARCHAR(100),
		file1 VARCHAR(100),
		file1saved VARCHAR(100),
		thumb1 VARCHAR(100),
		size1 NUMERIC(10) DEFAULT 0 IDENTITY,
		price NUMERIC(1000) DEFAULT 0 IDENTITY,
		insurance NUMERIC(1000) DEFAULT 0 IDENTITY,
		adminno NUMERIC(10) NOT NULL,
		recom NUMERIC(10) DEFAULT 0 IDENTITY,
		fuel VARCHAR(10),
		persons NUMERIC(10) DEFAULT 0 IDENTITY,
		year NUMERIC(10) DEFAULT 0 IDENTITY,
		explain VARCHAR(500),
		replycnt NUMERIC(10) DEFAULT 0 IDENTITY,
		salecnt NUMERIC(10) DEFAULT 0 IDENTITY,
  FOREIGN KEY (cargrpno) REFERENCES cargrp (cargrpno)
);

