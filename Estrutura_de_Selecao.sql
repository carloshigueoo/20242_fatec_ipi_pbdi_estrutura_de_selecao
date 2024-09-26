-- Active: 1724758531951@@127.0.0.1@5432@20242_fatec_ipi_pbdi_carlos@public
-- 1 Exercícios
-- Nota. Para cada exercício, produza duas soluções: uma que utilize apenas IF e suas
-- variações e outra que use apenas CASE e suas variações.
-- Nota. Para cada exercício, gere valores aleatórios conforme a necessidade. Use a função
-- do Bloco de Código 1.1.

-- CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;

-- 1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3.

-- SOLUÇÃO IF
DO
$$ 
DECLARE
    numero int := valor_aleatorio_entre(1,300);
BEGIN 
    IF numero % 3 = 0 THEN 
        RAISE NOTICE 'O número % é mútiplo de 3', numero;
    ELSE 
        RAISE NOTICE 'O número % não é multiplo de 3', numero;
    END IF;
END
$$; 

-- SOLUÇÃO CASE
DO
$$ 
DECLARE
    numero int := valor_aleatorio_entre(1,300);
BEGIN 
    CASE
        WHEN numero % 3 = 0 THEN 
            RAISE NOTICE 'O número % é mútiplo de 3', numero;
        ELSE 
            RAISE NOTICE 'O número % não é multiplo de 3', numero;
    END CASE;
END
$$;

-- 1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.

-- SOLUÇÃO IF
DO
$$ 
DECLARE
    numero int := valor_aleatorio_entre(1,100);
BEGIN 
    IF numero % 3 = 0 THEN 
        RAISE NOTICE 'O número % é mútiplo de 3', numero;
    ELSEIF numero % 5 = 0 THEN 
        RAISE NOTICE 'O número % é mútiplo de 5', numero;
    ELSE 
        RAISE NOTICE 'O número % não é multiplo de 3 e nem de 5', numero;
    END IF;
END
$$; 

-- SOLUÇÃO CASE
DO
$$ 
DECLARE
    numero int := valor_aleatorio_entre(1,100);
BEGIN 
    CASE
        WHEN numero % 3 = 0 THEN 
            RAISE NOTICE 'O número % é mútiplo de 3', numero;
        WHEN numero % 5 = 0 THEN 
            RAISE NOTICE 'O número % é mútiplo de 5', numero;
        ELSE 
            RAISE NOTICE 'O número % não é multiplo de 3 e nem de 5', numero;
    END CASE;
END
$$; 

-- 1.3 Faça um programa que opera de acordo com o seguinte menu.
-- Opções:
-- 1 - Soma
-- 2 - Subtração
-- 3 - Multiplicação
-- 4 - Divisão
-- Cada operação envolve dois números inteiros. O resultado deve ser exibido no formato
-- op1 op op2 = res
-- Exemplo:
-- 2 + 3 = 5

-- SOLUÇÃO IF
DO
$$
DECLARE
    op1 int := valor_aleatorio_entre (1,100);
    op2 int := valor_aleatorio_entre (1,100);
    opcao int := valor_aleatorio_entre (1,5);
    resultado numeric;
BEGIN
    IF opcao = 1 THEN -- SOMA 
        resultado := op1 + op2;
        RAISE NOTICE '% + % = %', op1 , op2 , resultado;
    ELSEIF opcao = 2 THEN -- SUBTRAÇÃO 
        resultado := op1 - op2;
        RAISE NOTICE '% - % = %', op1 , op2 , resultado;
    ELSEIF opcao = 3 THEN -- MULTIPLICAÇÃO 
        resultado := op1 * op2;
        RAISE NOTICE '% * % = %', op1 , op2 , resultado;
    ELSEIF opcao = 4 THEN -- DIVISÃO
        IF op2 = 0 THEN
            RAISE NOTICE 'Divisão por 0 inválida';
        ELSE
            resultado := op1 / op2;
            RAISE NOTICE '% / % = %', op1 , op2 , resultado;
        END IF;
    ELSE
        RAISE NOTICE 'Opção inválida';
    END IF;
END 
$$;

-- SOLUÇÃO CASE 
DO
$$
DECLARE
    op1 int := valor_aleatorio_entre (1,100);
    op2 int := valor_aleatorio_entre (1,100);
    opcao int := valor_aleatorio_entre (1,5);
    resultado numeric;
BEGIN
    CASE
        WHEN opcao = 1 THEN -- SOMA 
            resultado := op1 + op2;
            RAISE NOTICE '% + % = %', op1 , op2 , resultado;
        WHEN opcao = 2 THEN -- SUBTRAÇÃO 
            resultado := op1 - op2;
            RAISE NOTICE '% - % = %', op1 , op2 , resultado;
        WHEN opcao = 3 THEN -- MULTIPLICAÇÃO 
            resultado := op1 * op2;
            RAISE NOTICE '% * % = %', op1 , op2 , resultado;
        WHEN opcao = 4 THEN -- DIVISÃO
            CASE
                WHEN op2 = 0 THEN
                    RAISE NOTICE 'Divisão por 0 inválida';
                ELSE
                    resultado := op1 / op2;
                    RAISE NOTICE '% / % = %', op1 , op2 , resultado;
            END CASE;
        ELSE
            RAISE NOTICE 'Opção inválida';
    END CASE;
END 
$$;

-- 1.4 Um comerciante comprou um produto e quer vendê-lo com um lucro de 45% se o valor
-- da compra for menor que R$20. Caso contrário, ele deseja lucro de 30%. Faça um
-- programa que, dado o valor do produto, calcula o valor de venda.

--SOLUÇÃO IF
DO
$$
DECLARE
    compra numeric(10, 2) := valor_aleatorio_entre(0, 100);
    venda numeric(10, 2);
BEGIN
    IF compra <= 20 THEN
        venda := compra * 1.45;
    ELSE
        venda := compra * 1.3;
    END IF;
    RAISE NOTICE 'compra: R$ %', compra;
    RAISE NOTICE 'venda: R$ %', venda;
    END
$$;

-- SOLUÇÃO CASE
DO
$$
DECLARE
    compra numeric(10, 2) := valor_aleatorio_entre(0, 100);
    venda numeric(10, 2);
BEGIN
    CASE
        WHEN compra <= 20 THEN
            venda := compra * 1.45;
    ELSE
        venda := compra * 1.3;
    END CASE;
    RAISE NOTICE 'compra: R$ %', compra;
    RAISE NOTICE 'venda: R$ %', venda;
    END
$$;

