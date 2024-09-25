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
-- DO
-- $$ 
-- DECLARE
--     numero int := valor_aleatorio_entre(1,300);
-- BEGIN 
--     IF numero % 3 = 0 THEN 
--         RAISE NOTICE 'O número % é mútiplo de 3', numero;
--     ELSE 
--         RAISE NOTICE 'O número % não é multiplo de 3', numero;
--     END IF;
-- END
-- $$; 

-- SOLUÇÃO CASE
-- DO
-- $$ 
-- DECLARE
--     numero int := valor_aleatorio_entre(1,300);
-- BEGIN 
--     CASE
--         WHEN numero % 3 = 0 THEN 
--             RAISE NOTICE 'O número % é mútiplo de 3', numero;
--         ELSE 
--             RAISE NOTICE 'O número % não é multiplo de 3', numero;
--     END CASE;
-- END
-- $$;

-- 1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.

-- SOLUÇÃO IF
-- DO
-- $$ 
-- DECLARE
--     numero int := valor_aleatorio_entre(1,100);
-- BEGIN 
--     IF numero % 3 = 0 THEN 
--         RAISE NOTICE 'O número % é mútiplo de 3', numero;
--     ELSEIF numero % 5 = 0 THEN 
--         RAISE NOTICE 'O número % é mútiplo de 5', numero;
--     ELSE 
--         RAISE NOTICE 'O número % não é multiplo de 3 e nem de 5', numero;
--     END IF;
-- END
-- $$; 

-- SOLUCAO CASE
-- DO
-- $$ 
-- DECLARE
--     numero int := valor_aleatorio_entre(1,100);
-- BEGIN 
--     CASE
--         WHEN numero % 3 = 0 THEN 
--             RAISE NOTICE 'O número % é mútiplo de 3', numero;
--         WHEN numero % 5 = 0 THEN 
--             RAISE NOTICE 'O número % é mútiplo de 5', numero;
--         ELSE 
--             RAISE NOTICE 'O número % não é multiplo de 3 e nem de 5', numero;
--     END CASE;
-- END
-- $$; 

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






-- 1.4 Um comerciante comprou um produto e quer vendê-lo com um lucro de 45% se o valor
-- da compra for menor que R$20. Caso contrário, ele deseja lucro de 30%. Faça um
-- programa que, dado o valor do produto, calcula o valor de venda.

