-- ==========================================
-- 1. POPULANDO A TABELA: agencias
-- ==========================================
INSERT INTO agencias (id, nome_agencia, cidade) VALUES 
(1, 'Agência Centro', 'São Paulo'),
(2, 'Agência Paulista', 'São Paulo'),
(3, 'Agência Pampulha', 'Belo Horizonte'); -- Agência sem funcionários cadastrados




-- ==========================================
-- 2. POPULANDO A TABELA: clientes
-- ==========================================
INSERT INTO clientes (id, nome, cpf) VALUES 
(101, 'Carlos Andrade', '11122233344'), -- Cliente completo (conta, cartão, empréstimo)
(102, 'Beatriz Souza', '22233344455'),  -- Cliente investidor (poupança de alto valor)
(103, 'Adriano Lima', '33344455566'),   -- Cliente especial: Cadastrado, mas SEM CONTA
(104, 'Daniela Reis', '44455566677');   -- Cliente básico (apenas conta corrente, sem cartão)




-- ==========================================
-- 3. POPULANDO A TABELA: funcionarios (com hierarquia)
-- ==========================================
INSERT INTO funcionarios (id, nome, cargo, salario, agencia_id, supervisor_id) VALUES 
(10, 'Marcos Silva', 'Diretor', 15000.00, 1, NULL), -- Marcos não possui supervisor
(11, 'Fernanda Lima', 'Gerente', 8500.00, 1, 10),   -- Fernanda é liderada por Marcos (10)
(12, 'Roberto Dias', 'Gerente', 9000.00, 2, 10),    -- Roberto é liderado por Marcos (10)
(13, 'Juliana Costa', 'Assistente', 3500.00, 1, 11); -- Juliana é liderada por Fernanda (11)




-- ==========================================
-- 4. POPULANDO A TABELA: contas
-- ==========================================
INSERT INTO contas (numero_conta, tipo_conta, saldo, cliente_id, agencia_id) VALUES 
(1001, 'Corrente', 15000.00, 101, 1), -- Conta do Carlos na Agência Centro
(1002, 'Poupança', 250000.00, 102, 2), -- Conta da Beatriz na Agência Paulista
(1004, 'Corrente', 1500.00, 104, 1);   -- Conta da Daniela na Agência Centro
-- Nota: O cliente 103 (Adriano) não possui conta de propósito.




-- ==========================================
-- 5. POPULANDO A TABELA: cartoes
-- ==========================================
INSERT INTO cartoes (id, numero_cartao, limite, conta_id) VALUES 
(1, '4000123456789010', 5000.00, 1001),  -- Cartão do Carlos (Conta 1001)
(2, '4000123456789020', 50000.00, 1002); -- Cartão da Beatriz (Conta 1002)




-- ==========================================
-- 6. POPULANDO A TABELA: transacoes
-- ==========================================
INSERT INTO transacoes (id, tipo, valor, data_transacao, conta_id) VALUES 
(501, 'Pix', 12000.00, '2026-08-15', 1001),          -- Transação suspeita (> 10k) na conta do Carlos
(502, 'Saque', 150.00, '2026-08-16', 1001),
(503, 'Depósito', 500.00, '2026-08-17', 1004),
(504, 'Transferência', 15000.00, '2026-08-18', 1002); -- Outra transação suspeita (> 10k) na conta da Beatriz




-- ==========================================
-- 7. POPULANDO A TABELA: emprestimos
-- ==========================================
INSERT INTO emprestimos (id, valor_total, cliente_id) VALUES 
(201, 45000.00, 101), -- Empréstimo associado ao Carlos
(202, 8000.00, 103);  -- Empréstimo associado ao Adriano (Cliente que NÃO tem conta!)
