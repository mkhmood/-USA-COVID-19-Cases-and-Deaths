--Importing a csv file which USA population
--Viewing the dataset
select*
from [dbo].[USA population_2020]

--Deleting column 3 and column 4 because they are not needed
alter table [dbo].[USA population_2020]
drop column column3, column4

--Getting rid of . in the beginning of each state name
select replace(state, '.','') as state, population
from [dbo].[USA population_2020]

--Handling null values in the last rows (no missing data, just null values)
select*
from [dbo].[USA population_2020]
where state is not null and population is not null

--Changing each state full name to abbreviated name
select
	(case 	
		when replace(state, '.', '') = 'Alabama' then 'AL'
		when replace(state, '.', '') = 'Alaska' then 'AK'
		when replace(state, '.', '') = 'Arizona' then 'AZ'
		when replace(state, '.', '') = 'Arkansas' then 'AR'
		when replace(state, '.', '') = 'California' then 'CA'
		when replace(state, '.', '') = 'Colorado' then 'CO'
		when replace(state, '.', '') = 'Connecticut' then 'CT'
		when replace(state, '.', '') = 'Delaware' then 'DE'
		when replace(state, '.', '') = 'Florida' then 'FL'
		when replace(state, '.', '') = 'Georgia' then 'GA'
		when replace(state, '.', '') = 'Hawaii' then 'HI'
		when replace(state, '.', '') = 'Idaho' then 'ID'
		when replace(state, '.', '') = 'Illinois' then 'IL'
		when replace(state, '.', '') = 'Indiana' then 'IN'
		when replace(state, '.', '') = 'Iowa' then 'IA'
		when replace(state, '.', '') = 'Kansas' then 'KS'
		when replace(state, '.', '') = 'Kentucky' then 'KY'
		when replace(state, '.', '') = 'Louisiana' then 'LA'
		when replace(state, '.', '') = 'Maine' then 'ME'
		when replace(state, '.', '') = 'Maryland' then 'MD'
		when replace(state, '.', '') = 'Massachusetts' then 'MA'
		when replace(state, '.', '') = 'Michigan' then 'MI'
		when replace(state, '.', '') = 'Minnesota' then 'MN'
		when replace(state, '.', '') = 'Mississippi' then 'MS'
		when replace(state, '.', '') = 'Missouri' then 'MO'
		when replace(state, '.', '') = 'Montana' then 'MT'
		when replace(state, '.', '') = 'Nebraska' then 'NE'
		when replace(state, '.', '') = 'Nevada' then 'NV'
		when replace(state, '.', '') = 'New Hampshire' then 'NH'
		when replace(state, '.', '') = 'New Jersey' then 'NJ'
		when replace(state, '.', '') = 'New Mexico' then 'NM'
		when replace(state, '.', '') = 'New York' then 'NY'
		when replace(state, '.', '') = 'North Carolina' then 'NC'
		when replace(state, '.', '') = 'North Dakota' then 'ND'
		when replace(state, '.', '') = 'Ohio' then 'OH'
		when replace(state, '.', '') = 'Oklahoma' then 'OK'
		when replace(state, '.', '') = 'Oregon' then 'OR'
		when replace(state, '.', '') = 'Pennsylvania' then 'PA'
		when replace(state, '.', '') = 'Rhode Island' then 'RI'
		when replace(state, '.', '') = 'South Carolina' then 'SC'
		when replace(state, '.', '') = 'South Dakota' then 'SD'
		when replace(state, '.', '') = 'Tennessee' then 'TN'
		when replace(state, '.', '') = 'Texas' then 'TX'
		when replace(state, '.', '') = 'Utah' then 'UT'
		when replace(state, '.', '') = 'Vermont' then 'VT'
		when replace(state, '.', '') = 'Virginia' then 'VA'
		when replace(state, '.', '') = 'Washington' then 'WA'
		when replace(state, '.', '') = 'West Virginia' then 'WV'
		when replace(state, '.', '') = 'Wisconsin' then 'WI'
		when replace(state, '.', '') = 'Wyoming' then 'WY'
		when replace(state, '.', '') = 'District of Columbia' then 'DC'
end) as state
, population
from [dbo].[USA population_2020]
where state is not null and population is not null

--Taking a final look before exporting the table
select*
from [dbo].[USA population_2020]