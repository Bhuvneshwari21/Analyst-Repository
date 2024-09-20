-- Data cleaning

Select *
from layoffs;

-- 1. Remove Duplicates
-- 2, Standardize the Data
-- 3. Null Values or blank values
-- 4. Remove Any Columns

CREATE TABLE layoffs_staging
LIKE layoffs;

Select *
from layoffs_staging;

INSERT layoffs_staging
Select *
from layoffs;

Select *,
row_number() OVER(
partition by company, industry, total_laid_off, percentage_laid_off,
'date') as row_num
from layoffs_staging;

WITH duplicate_cte AS
(
Select *,
row_number() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off,
'date', stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
Select *
from duplicate_cte
where row_num> 1 ;


Select *
from layoffs_staging
where company='Casper';



WITH duplicate_cte AS
(
Select *,
row_number() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off,
'date', stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
Delete
from duplicate_cte
where row_num> 1 ;

Select *
from layoffs_staging2;

Insert into layoffs_staging2
Select *,
row_number() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off,
'date', stage, country, funds_raised_millions) as row_num
from layoffs_staging;

Delete from layoffs_staging2 where row_num > 1;

-- Standardizing Data - finding and fixing issues in your data

Select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select distinct industry
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct country
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where country like 'United States'
order by 1;

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

select `date`date
from layoffs_staging2;

alter table layoffs_staging2
modify column `date` date;

-- Null Blank Values
select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging2
set industry = null
where industry='';

select *
from layoffs_staging2
where industry is null 
or industry = '';

select *
from layoffs_staging2
where company='Airbnb';

select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
    and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select *
from layoffs_staging2
where company like 'Bally%';

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

-- 4. Remove Any Columns

alter table layoffs_staging2
drop column row_num;