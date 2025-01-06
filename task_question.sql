USE TEMP;
create table if not exists unlabeled_image_predictions(
    image_id INT,
    score FLOAT
);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES
('828', '0.3149'),
('705', '0.9892'),
('46', '0.5616'),
('594', '0.7670'),
('232', '0.1598'),
('524', '0.9876'),
('306', '0.6487'),
('132', '0.8823'),
('906', '0.8394'),
('272', '0.9778'),
('616', '0.1003'),
('161', '0.7113'),
('715', '0.8921'),
('109', '0.1151'),
('424', '0.7790'),
('609', '0.5241'),
('63', '0.2552'),
('276', '0.2672'),
('701', '0.0758'),
('554', '0.4418'),
('998', '0.0379'),
('809', '0.1058'),
('219', '0.7143'),
('402', '0.7655'),
('363', '0.2661'),
('624', '0.8270'),
('640', '0.8790'),
('913', '0.2421'),
('439', '0.3387'),
('464', '0.3674'),
('405', '0.6929'),
('986', '0.8931'),
('344', '0.3761'),
('847', '0.4889'),
('482', '0.5023'),
('823', '0.3361'),
('617', '0.0218'),
('47', '0.0072'),
('867', '0.4050'),
('96', '0.4498'),
('126', '0.3564'),
('943', '0.0452'),
('115', '0.5309'),
('417', '0.7168'),
('706', '0.9649'),
('166', '0.2507'),
('991', '0.4191'),
('465', '0.0895'),
('53', '0.8169'),
('971', '0.9871');



drop table unlabeled_image_predictions;
 select * from unlabeled_image_predictions;

 -- write a query that creates another view or table that has every third row 
 -- from this table
--
select t.image_id , t.score 
FROM
(select image_id,score ,
ROW_NUMBER() OVER (ORDER BY score desc) as row_num
from unlabeled_image_predictions 
) as t
where t.row_num %3=0 
order by t.score desc ;

-- 

WITH FilteredRows AS (
  SELECT 
    image_id, 
    score, 
    ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num
  FROM unlabeled_image_predictions
)
SELECT 
  image_id, 
  score as weak_label, 
  row_num
FROM FilteredRows
WHERE row_num % 3 = 0
LIMIT 10;

WITH FilteredRows AS (
  SELECT 
    image_id, 
    score, 
    ROW_NUMBER() OVER (ORDER BY score ) AS row_num
  FROM unlabeled_image_predictions
)
SELECT 
  image_id, 
  score as weak_label, 
  row_num
FROM FilteredRows
WHERE row_num % 3 = 0
LIMIT 10;

-- using VIEWS 

CREATE VIEW FilteredRowsDesc AS
WITH FilteredRows AS (
  SELECT 
    image_id, 
    score, 
    ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num
  FROM unlabeled_image_predictions
)
SELECT 
  image_id, 
  score as weak_label, 
  row_num
FROM FilteredRows
WHERE row_num % 3 = 0;


CREATE VIEW FilteredRowsAsc AS
WITH FilteredRows AS (
  SELECT 
    image_id, 
    score, 
    ROW_NUMBER() OVER (ORDER BY score) AS row_num
  FROM unlabeled_image_predictions
)
SELECT 
  image_id, 
  score as weak_label, 
  row_num
FROM FilteredRows
WHERE row_num % 3 = 0;


SELECT 
  a.image_id AS image_id_desc, 
  a.weak_label AS weak_label_desc, 
  b.image_id AS image_id_asc, 
  b.weak_label AS weak_label_asc
FROM FilteredRowsDesc a
JOIN FilteredRowsAsc b
ON a.row_num = b.row_num
LIMIT 10;


