CREATE TABLE contries (
  country_id int PRIMARY KEY,
  country_name TEXT NOT NULL,
  region_id int
);

insert into contries values(201, 'india', 20);
insert into contries values(202, 'Afghanistan', 21);
select * from contries ;
