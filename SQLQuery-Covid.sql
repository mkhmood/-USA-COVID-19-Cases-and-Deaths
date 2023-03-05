--Importing a csv file that has Covid-19 cases and deaths in USA
--Viewing the dataset
select *
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]

--Cleaning data
--Getting all the unique names in 'state' column
select distinct state
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]

--Deleting all U.S. territories from 'state' column and only keeping states
delete from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
where state in ('FSM', 'GU', 'MP', 'VI', 'RMI', 'PR', 'AS', 'PW')

--Deleting columns that will not be needed
alter table [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
drop column conf_cases, prob_cases, pnew_case, conf_death, prob_death, pnew_death, created_at, consent_cases, consent_deaths

--Writing a query to see only NY and NYC from 'state' column
select*
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
where state in ('NY', 'NYC')
order by submission_date asc

--Changing the data type for all columns that contain integer values
alter table [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
alter column tot_cases int

alter table [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
alter column new_case int

alter table [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
alter column tot_death int

alter table [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
alter column new_death int

--Changing every NYC to NY in 'state' column
update [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
set state='NY'
where state='NYC'

--Filtering for 'NY' in state column and ordering by submission date
select*
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
where state='NY'
order by submission_date 

--Adding the numbers from NYC wtih NY so that they all appear under one state: NY
select submission_date, state, sum(tot_cases) as tot_cases, 
sum(new_case) as new_case, sum(tot_death) as tot_death, sum(new_death) as new_death
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
group by submission_date, state

--Converting format of 'submission_date' column to get rid of time
select convert(date, submission_date) as submission_date
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]

--Counting rows that might have null values in
select count(*)
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]
where submission_date is null or state is null or tot_cases is null or new_case is null or tot_death is null or new_death is null

--Writing a query to make sure table looks good before exporting it
select submission_date, state, tot_cases, new_case, tot_death, new_death
from [dbo].[United_States_COVID-19_Cases_and_Deaths_by_State_over_Time]