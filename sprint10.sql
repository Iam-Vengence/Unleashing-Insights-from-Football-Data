USE football_db;
select * from footballs;
-- 1. Expiring Contracts Analysis
SELECT player_name,agent_name,contract_expiration_date
FROM footballs
WHERE DATE(contract_expiration_date) <= DATE_ADD(CURDATE(), INTERVAL 6 MONTH)
ORDER BY agent_name, contract_expiration_date;
-- Playername agement with contract expriation details

-- 2. Market Value of Expiring Contracts
SELECT SUM(market_value_in_eur) AS total_market_value
FROM footballs
WHERE DATE(contract_expiration_date) <= DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
-- Total market value is 13875700000

-- 3. Performance of Expiring Players 
SELECT 
    CASE 
        WHEN DATE(contract_expiration_date) <= DATE_ADD(CURDATE(), INTERVAL 6 MONTH) THEN 'Expiring Soon'
        ELSE 'Long-Term'
    END AS contract_status,
    AVG(goals) AS avg_goals,
    AVG(assists) AS avg_assists,
    AVG(minutes_played) AS avg_minutes_played
FROM 
    footballs
GROUP BY 
    contract_status;
-- The player expirib=ng soon as average goals 0.36,average assists 0.10,average minutes playes 66.86
-- The player expirib=ng soon as average goals 0.49,average assists 0.15,average minutes playes 73.96