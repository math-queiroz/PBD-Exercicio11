SET SERVEROUTPUT ON;
-- Exercício 1
-- Usando: FOR
DECLARE
    habitantes_1 NUMBER DEFAULT 1000;
    taxa_nat_1 NUMBER DEFAULT 0.1;
    habitantes_2 NUMBER DEFAULT 2000;
    taxa_nat_2 NUMBER DEFAULT 0.05;
    i NUMBER DEFAULT 0;
    qtd_anos NUMBER;
BEGIN
    qtd_anos := CEIL(LOG((1+taxa_nat_1)/(1+taxa_nat_2), habitantes_2/habitantes_1));
    FOR i IN 1..qtd_anos
    LOOP
        habitantes_1 := habitantes_1 + habitantes_1 * taxa_nat_1;
        habitantes_2 := habitantes_2 + habitantes_2 * taxa_nat_2;
    END LOOP;
    dbms_output.put_line('São precisos ' || qtd_anos || ' anos para que a cidade 1 (com '|| ROUND(habitantes_1,0) ||' habitantes) passe a cidade 2 (com '||  ROUND(habitantes_2,0) ||' com habitantes) em habitantes.');
END;
-- Usando: WHILE
DECLARE
    habitantes_1 NUMBER DEFAULT 1000;
    taxa_nat_1 NUMBER DEFAULT 0.1;
    habitantes_2 NUMBER DEFAULT 2000;
    taxa_nat_2 NUMBER DEFAULT 0.05;
    anos NUMBER DEFAULT 0;
BEGIN
    WHILE habitantes_1 < habitantes_2 LOOP 
        anos := anos + 1;
        habitantes_1 := habitantes_1 + habitantes_1 * taxa_nat_1;
        habitantes_2 := habitantes_2 + habitantes_2 * taxa_nat_2;
    END LOOP;
    dbms_output.put_line('São precisos ' || anos || ' anos para que a cidade 1 passe a cidade 2 em habitantes.');
END;
-- Usando: LOOP
DECLARE
    habitantes_1 NUMBER DEFAULT 1000;
    taxa_nat_1 NUMBER DEFAULT 0.1;
    habitantes_2 NUMBER DEFAULT 2000;
    taxa_nat_2 NUMBER DEFAULT 0.05;
    anos NUMBER DEFAULT 0;
BEGIN
    LOOP
        anos := anos + 1;
        habitantes_1 := habitantes_1 + habitantes_1 * taxa_nat_1;
        habitantes_2 := habitantes_2 + habitantes_2 * taxa_nat_2;
        IF habitantes_1 > habitantes_2 THEN
            EXIT;
        END IF;
    END LOOP;
    dbms_output.put_line('São precisos ' || anos || ' anos para que a cidade 1 passe a cidade 2 em habitantes.');
END;

-- Exercício 2
-- Usando: FOR
DECLARE
    altura_chico NUMBER DEFAULT 120;
    cresc_chico NUMBER DEFAULT 0.1;
    altura_juca NUMBER DEFAULT 142;
    cresc_juca NUMBER DEFAULT 0.02;
    i NUMBER DEFAULT 0;
    qtd_anos NUMBER;
BEGIN
    qtd_anos := CEIL(LOG((1+cresc_chico)/(1+cresc_juca), altura_juca/altura_chico));
    FOR i IN 1..qtd_anos
    LOOP
        altura_chico := altura_chico + altura_chico * cresc_chico;
        altura_juca := altura_juca + altura_juca * cresc_juca;
    END LOOP;
    dbms_output.put_line('Depois de ' || qtd_anos || ' ano(s) Chico tem ' || ROUND(altura_chico,2) || 'cm e Juca tem ' || ROUND(altura_juca,2) || 'cm');
END;
-- Usando: WHILE
DECLARE
    altura_chico NUMBER DEFAULT 120;
    cresc_chico NUMBER DEFAULT 0.1;
    altura_juca NUMBER DEFAULT 142;
    cresc_juca NUMBER DEFAULT 0.02;
    anos NUMBER DEFAULT 0;
BEGIN
     WHILE altura_chico < altura_juca LOOP 
        anos := anos + 1;
        altura_chico := altura_chico + altura_chico * cresc_chico;
        altura_juca := altura_juca + altura_juca * cresc_juca;
        dbms_output.put_line('Depois de ' || anos || ' ano(s) Chico tem ' || ROUND(altura_chico,2) || 'cm e Juca tem ' || ROUND(altura_juca,2) || 'cm');
    END LOOP;
    dbms_output.put_line('São precisos ' || anos || ' anos para que Chico fique mais alto que Juca.');
END;
-- Usando: LOOP
DECLARE
    altura_chico NUMBER DEFAULT 120;
    cresc_chico NUMBER DEFAULT 0.1;
    altura_juca NUMBER DEFAULT 142;
    cresc_juca NUMBER DEFAULT 0.02;
    anos NUMBER DEFAULT 0;
BEGIN
     LOOP 
        anos := anos + 1;
        altura_chico := altura_chico + altura_chico * cresc_chico;
        altura_juca := altura_juca + altura_juca * cresc_juca;
        dbms_output.put_line('Depois de ' || anos || ' ano(s) Chico tem ' || ROUND(altura_chico,2) || 'cm e Juca tem ' || ROUND(altura_juca,2) || 'cm');
        IF altura_chico > altura_juca THEN
            EXIT;
        END IF;
    END LOOP;
    dbms_output.put_line('São precisos ' || anos || ' anos para que Chico fique mais alto que Juca.');
END;

-- Exercício 3
-- Usando: FOR
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    result NUMBER DEFAULT 1;
BEGIN
    FOR i IN 2..&n
    LOOP
        result := result * i;
    END LOOP;
    dbms_output.put_line('O fatorial de &n é ' || result);
END;
-- Usando: WHILE
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    result NUMBER DEFAULT 1;
    i NUMBER DEFAULT &n;
BEGIN
    WHILE i > 1 LOOP
        result := result * i;
        i := i - 1;
    END LOOP;
    dbms_output.put_line('O fatorial de &n é ' || result);
END;
-- Usando: LOOP
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    result NUMBER DEFAULT 1;
    i NUMBER DEFAULT &n;
BEGIN
    LOOP
        IF i < 1 THEN
            EXIT;
        END IF;
        result := result * i;
        i := i - 1;
    END LOOP;
    dbms_output.put_line('O fatorial de &n é ' || result);
END;

-- Exercício 4
-- Usando: FOR
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    possuiMultiplo BOOLEAN DEFAULT false;
BEGIN
    FOR i IN SQRT(&n)..(&n-1)
    LOOP
        IF MOD(&n,i)=0 AND i != 1 THEN 
            possuiMultiplo := true;
            EXIT;
        END IF;
    END LOOP;
    IF possuiMultiplo THEN
        dbms_output.put_line('O número &n NÃO é primo');
    ELSE
        dbms_output.put_line('O número &n é primo');
    END IF;
END;
-- Usando: WHILE
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    i NUMBER DEFAULT (&n-1);
    raiz NUMBER DEFAULT FLOOR(SQRT(&n));
    possuiMultiplo BOOLEAN DEFAULT false;
BEGIN
    WHILE i >= raiz LOOP
        IF MOD(&n,i)=0 AND i != 1 THEN 
            possuiMultiplo := true;
            EXIT;
        END IF;
        i := i - 1;
    END LOOP;
    IF possuiMultiplo THEN
        dbms_output.put_line('O número &n NÃO é primo');
    ELSE
        dbms_output.put_line('O número &n é primo');
    END IF;
END;
-- Usando: LOOP
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    i NUMBER DEFAULT (&n-1);
    raiz NUMBER DEFAULT FLOOR(SQRT(&n));
BEGIN
    LOOP
        IF MOD(&n,i)=0 AND i != 1 THEN 
            dbms_output.put_line('O número &n NÃO é primo');
            EXIT;
        END IF;
        i := i - 1;
        IF i < 1 THEN
            dbms_output.put_line('O número &n é primo');
            EXIT;
        END IF;
    END LOOP;
END;

-- Exercício 5
-- Usando: FOR
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    classificaNumTriangular BOOLEAN DEFAULT false;
BEGIN
    FOR i IN REVERSE -1..(&n-1)
    LOOP
        IF i*(i+1)=&n*2 THEN
            classificaNumTriangular := true;
            EXIT;
        END IF;
    END LOOP;
    IF classificaNumTriangular THEN
        dbms_output.put_line('O número &n é um número triangular');
    ELSE
        dbms_output.put_line('O número &n NÃO é um número triangular');
    END IF;
END;
-- Usando: WHILE
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    i NUMBER DEFAULT (&n-1);
    classificaNumTriangular BOOLEAN DEFAULT false;
BEGIN
    WHILE i >= -1 LOOP
        IF i*(i+1)=&n*2 THEN
            classificaNumTriangular := true;
            EXIT;
        END IF;
        i := i - 1;
    END LOOP;
    IF classificaNumTriangular THEN
        dbms_output.put_line('O número &n é um número triangular');
    ELSE
        dbms_output.put_line('O número &n NÃO é um número triangular');
    END IF;
END;
-- Usando: LOOP
ACCEPT n NUMBER PROMPT 'Digite um número inteiro e positivo: ';
DECLARE
    i NUMBER DEFAULT (&n-1);
BEGIN
    LOOP
        IF i*(i+1)=&n*2 THEN
            dbms_output.put_line('O número &n é um número triangular');
            EXIT;
        END IF;
        i := i - 1;
        IF i <= -1 THEN
            dbms_output.put_line('O número &n NÃO é um número triangular');
            EXIT;
        END IF;
    END LOOP;
END;
