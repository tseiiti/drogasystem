-- Active: 1698355710028@@127.0.0.1@5432@cmed@public
SELECT * FROM cmed 
    ORDER BY cmed.id
    LIMIT 5
    OFFSET 0;

 SELECT * FROM cmed

SELECT REGEXP_COUNT(cmed.apresenta,'X', 1, 'i')  
    FROM cmed;

SELECT REGEXP_INSTR(cmed.apresenta,'X', 1 ) 
    FROM cmed ; 


SELECT REGEXP_INSTR(cmed.apresenta,'X', 1, (SELECT REGEXP_COUNT(cmed.apresenta,'X', 1, 'i')) )  
    FROM cmed; 

SELECT REGEXP_SUBSTR(cmed.apresenta, '[^X].\d*', (SELECT REGEXP_INSTR(cmed.apresenta,'X', 1, (SELECT REGEXP_COUNT(cmed.apresenta,'X', 1, 'i')) )))
    FROM cmed;

    
SELECT REGEXP_SUBSTR(cmed.apresenta, '\d.*',(35-4)) FROM cmed;

SELECT REGEXP_SUBSTR(cmed.apresenta, '\d.*',(SELECT char_length(cmed.apresenta))-4) FROM cmed;

SELECT char_length(cmed.apresenta) FROM cmed ;

SELECT apresenta FROM cmed WHERE cmed.id = 3


SELECT SUBSTRING('XY1234Z', 'Y*([0-9]{1,4})');

SELECT cmed.apresenta
    FROM cmed
    WHERE cmed.id = 140;

SELECT * FROM cmed WHERE cmed.ggerm = '576723060101207';


SELECT cmed.ggerm, cmed.id, cmed.produto, quant.quant FROM cmed INNER JOIN quant ON cmed.id = quant.id;


SELECT cmed.id, cmed.produto, intQuantGGERM.ggerm ,intQuantGGERM.quant FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id
WHERE intQuantGGERM.quant >65;

SELECT cmed.*, intquantggerm.* FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id ;

SELECT DISTINCT cmed.tipo FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id ;

SELECT DISTINCT cmed.substancia
 FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id ;

SELECT * FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id
WHERE tipo = 'Genérico' and substancia = 'ROSUVASTATINA CÁLCICA' 
LIMIT 1 OFFSET  1

SELECT cmed.id, cmed.produto, intQuantGGERM.ggerm ,intQuantGGERM.quant, cmed.pf, cmed.apresenta, intQuantGGERM.ml 
    FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id WHERE intQuantGGERM.quant >65 AND intQuantGGERM.ml == 0;
        

