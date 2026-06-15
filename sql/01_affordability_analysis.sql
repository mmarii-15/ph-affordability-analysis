-- =====================================================
-- Philippine Affordability Analysis
-- File: 01_affordability_analysis.sql
-- Purpose: Explore regional income, expenditure, savings,
--          and wage affordability indicators.
-- =====================================================


-- Query 1: Highest monthly family income
SELECT
    region_name,
    ROUND(avg_monthly_family_income_php, 2) AS avg_monthly_family_income_php
FROM analysis_region_affordability
ORDER BY avg_monthly_family_income_php DESC;


-- Query 2: Highest monthly family expenditure
SELECT
    region_name,
    ROUND(avg_monthly_family_expenditure_php, 2) AS avg_monthly_family_expenditure_php
FROM analysis_region_affordability
ORDER BY avg_monthly_family_expenditure_php DESC;


-- Query 3: Best savings rate
SELECT
    region_name,
    ROUND(savings_rate * 100, 1) AS savings_rate_percent,
    ROUND(avg_monthly_family_income_php, 2) AS avg_monthly_family_income_php,
    ROUND(avg_monthly_family_expenditure_php, 2) AS avg_monthly_family_expenditure_php,
    ROUND(avg_monthly_family_savings_php, 2) AS avg_monthly_family_savings_php
FROM analysis_region_affordability
ORDER BY savings_rate DESC;

-- Query 4: Best income-to-expensiture ratio
SELECT
    region_name,
    ROUND(income_to_expenditure_ratio, 2) AS income_to_expenditure_ratio,
    ROUND(avg_monthly_family_income_php, 2) AS avg_monthly_family_income_php,
    ROUND(avg_monthly_family_expenditure_php, 2) AS avg_monthly_family_expenditure_php
FROM analysis_region_affordability
ORDER BY income_to_expenditure_ratio DESC;

-- Query 5: Wage-to-family-expenditure proxy
SELECT
    region_name,
    ROUND(avg_monthly_wage_rate_php, 2) AS avg_monthly_wage_rate_php,
    ROUND(avg_monthly_family_expenditure_php, 2) AS avg_monthly_family_expenditure_php,
    ROUND(wage_to_family_expenditure_ratio_proxy, 2) AS wage_to_family_expenditure_ratio_proxy,
    ROUND(wage_minus_family_expenditure_proxy_php, 2) AS wage_minus_family_expenditure_proxy_php
FROM analysis_region_affordability
ORDER BY wage_to_family_expenditure_ratio_proxy DESC;

-- Query 6: NCR compared with other regions
SELECT
    CASE
        WHEN region_code = 'NCR' THEN 'NCR'
        ELSE 'Other Regions'
    END AS region_group,
    ROUND(AVG(avg_monthly_family_income_php), 2) AS avg_monthly_family_income_php,
    ROUND(AVG(avg_monthly_family_expenditure_php), 2) AS avg_monthly_family_expenditure_php,
    ROUND(AVG(avg_monthly_family_savings_php), 2) AS avg_monthly_family_savings_php,
    ROUND(AVG(savings_rate) * 100, 1) AS avg_savings_rate_percent,
    ROUND(AVG(avg_monthly_wage_rate_php), 2) AS avg_monthly_wage_rate_php
FROM analysis_region_affordability
GROUP BY
    CASE
        WHEN region_code = 'NCR' THEN 'NCR'
        ELSE 'Other Regions'
    END;
