## Tidy Concept

trial <- read.delim(sep = ',', header = TRUE, text = "
block, drug, control, placebo
    1, 0.22,    0.58,    0.31
    2, 0.12,    0.98,    0.47
    3, 0.42,    0.19,    0.40
")

## Gather 

library(tidyr)
tidy_trial <- gather(trial,
                     key = "treatment",
                     value = "response",
                     -block)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val,
                      fill = 0)
library(data.table)
cbp <- fread('data/cbp15co.csv')
cbp <- fread(
  'data/cbp15co.csv',
  na.strings = NULL,
  colClasses = c(
    FIPSTATE='character',
    FIPSCTY='character'))
acs <- fread(
  'data/ACS/sector_ACS_15_5YR_S2413.csv',
  colClasses = c(FIPS='character'))
library(dplyr)
cbp2 <- filter(cbp,
               grepl('----', NAICS),
               !grepl('------', NAICS))
library(stringr)
cbp2 <- filter(cbp,
               str_detect(NAICS, '[0-9]{2}----'))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY),
               NAICS = str_remove(NAICS, '-+'))
cbp <- cbp %>%
  filter(
    str_detect(NAICS, '[0-9]{2}----')
  ) %>%
  mutate(
    FIPS = str_c(FIPSTATE, FIPSCTY),
    NAICS = str_remove(NAICS, '-+')
  )
cbp <- cbp %>%
  select(
    FIPS,
    NAICS,
    starts_with('N')
  )
sector <- fread(
  'data/ACS/sector_naics.csv',
  colClasses = c(NAICS='character'))
cbp <- cbp %>%
  inner_join(sector)
cbp_grouped <- cbp %>%
  group_by(FIPS, Sector)
cbp <- cbp %>%
  group_by(FIPS, Sector) %>%
  select(starts_with('N'), -NAICS) %>%
  summarize_all(sum)
acs_cbp <- cbp %>%
  inner_join(acs)
## Spread 

survey <- read.delim(sep = ',', header = TRUE, text = "
participant,   attr, val
1          ,    age,  24
2          ,    age,  57
3          ,    age,  13
1          , income,  30
2          , income,  60
")

tidy_survey <- spread(survey,
  key = attr,
  value = val)

tidy_survey <- spread(survey,
  key = attr,
  value = val,
  fill = 0)

## Sample Data 



cbp <- fread(
  'data/cbp15co.csv',
  na.strings = NULL,
  colClasses = c(
    FIPSTATE = 'character',
    FIPSCTY = 'character'
  ))

acs <- fread(
  'data/ACS/sector_ACS_15_5YR_S2413.csv',
  colClasses = c(FIPS = 'character'))

## dplyr Functions 

library(dplyr)
cbp2 <- filter(cbp,
 grepl('----', NAICS),
  !grepl('-----', NAICS))

library(stringr)
cbp2 <- filter(cbp,
  str_detect(NAICS, '[0-9]{2}----'))

cbp3 <- mutate(cbp2,
  FIPS = str_c(FIPSTATE, FIPSCTY))

c()
cbp <- cbp %>%
filter(
    str_detect(NAICS, '[0-9]{2}----')
  ) %>%
  mutate(
    FIPS = str_c(FIPSTATE, FIPSCTY),
    NAICS = str_remove(NAICS, '-+')
  )

cbp <- cbp %>%
  select(
    FIPS,
    NAICS,
    starts_with('N')
  )

## Join

sector <- fread(
  'data/ACS/sector_naics.csv',
  colClasses = c(NAICS = 'character'))

cbp <- cbp %>%
  inner_join(sector)

## Group By 

cbp_grouped <- cbp %>%
  group_by(FIPS, Sector)

## Summarize 

cbp <- cbp %>%
  group_by(FIPS, Sector) %>%
  select(starts_with('N'), -NAICS) %>%
  summarize_all(sum)
library(tidyr)
tidy_trial <- gather(trial,
                     key = "treatment",
                     value = "response",
                     -block)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val,
                      fill = 0)
library(data.table)
cbp <- fread('data/cbp15co.csv')
cbp <- fread(
  'data/cbp15co.csv',
  na.strings = NULL,
  colClasses = c(
    FIPSTATE='character',
    FIPSCTY='character'))
acs <- fread(
  'data/ACS/sector_ACS_15_5YR_S2413.csv',
  colClasses = c(FIPS='character'))
library(dplyr)
cbp2 <- filter(cbp,
               grepl('----', NAICS),
               !grepl('------', NAICS))
library(stringr)
cbp2 <- filter(cbp,
               str_detect(NAICS, '[0-9]{2}----'))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY),
               NAICS = str_remove(NAICS, '-+'))
cbp <- cbp %>%
  filter(
    str_detect(NAICS, '[0-9]{2}----')
  ) %>%
  mutate(
    FIPS = str_c(FIPSTATE, FIPSCTY),
    NAICS = str_remove(NAICS, '-+')
  )
cbp <- cbp %>%
  select(
    FIPS,
    NAICS,
    starts_with('N')
  )
sector <- fread(
  'data/ACS/sector_naics.csv',
  colClasses = c(NAICS='character'))
cbp <- cbp %>%
  inner_join(sector)
cbp_grouped <- cbp %>%
  group_by(FIPS, Sector)
cbp <- cbp %>%
  group_by(FIPS, Sector) %>%
  select(starts_with('N'), -NAICS) %>%
  summarize_all(sum)
acs_cbp <- cbp %>%
  inner_join(acs)

library(tidyr)
tidy_trial <- gather(trial,
                     key = "treatment",
                     value = "response",
                     -block)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val,
                      fill = 0)
library(data.table)
cbp <- fread('data/cbp15co.csv')
cbp <- fread(
  'data/cbp15co.csv',
  na.strings = NULL,
  colClasses = c(
    FIPSTATE='character',
    FIPSCTY='character'))
acs <- fread(
  'data/ACS/sector_ACS_15_5YR_S2413.csv',
  colClasses = c(FIPS='character'))
library(dplyr)
cbp2 <- filter(cbp,
               grepl('----', NAICS),
               !grepl('------', NAICS))
library(stringr)
cbp2 <- filter(cbp,
               str_detect(NAICS, '[0-9]{2}----'))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY),
               NAICS = str_remove(NAICS, '-+'))
cbp <- cbp %>%
  filter(
    str_detect(NAICS, '[0-9]{2}----')
  ) %>%
  mutate(
    FIPS = str_c(FIPSTATE, FIPSCTY),
    NAICS = str_remove(NAICS, '-+')
  )
cbp <- cbp %>%
  select(
    FIPS,
    NAICS,
    starts_with('N')
  )
sector <- fread(
  'data/ACS/sector_naics.csv',
  colClasses = c(NAICS='character'))
cbp <- cbp %>%
  inner_join(sector)
cbp_grouped <- cbp %>%
  group_by(FIPS, Sector)
cbp <- cbp %>%
  group_by(FIPS, Sector) %>%
  select(starts_with('N'), -NAICS) %>%
  summarize_all(sum)
acs_cbp <- cbp %>%
  inner_join(acs)

gather(tidy_survey, key = "attr",
       value = "val", -participant)
library(tidyr)
tidy_trial <- gather(trial,
                     key = "treatment",
                     value = "response",
                     -block)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val)
tidy_survey <- spread(survey,
                      key = attr,
                      value = val,
                      fill = 0)
library(data.table)
cbp <- fread('data/cbp15co.csv')
cbp <- fread(
  'data/cbp15co.csv',
  na.strings = NULL,
  colClasses = c(
    FIPSTATE='character',
    FIPSCTY='character'))
acs <- fread(
  'data/ACS/sector_ACS_15_5YR_S2413.csv',
  colClasses = c(FIPS='character'))
library(dplyr)
cbp2 <- filter(cbp,
               grepl('----', NAICS),
               !grepl('------', NAICS))
library(stringr)
cbp2 <- filter(cbp,
               str_detect(NAICS, '[0-9]{2}----'))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY))
cbp3 <- mutate(cbp2,
               FIPS = str_c(FIPSTATE, FIPSCTY),
               NAICS = str_remove(NAICS, '-+'))
cbp <- cbp %>%
  filter(
    str_detect(NAICS, '[0-9]{2}----')
  ) %>%
  mutate(
    FIPS = str_c(FIPSTATE, FIPSCTY),
    NAICS = str_remove(NAICS, '-+')
  )
cbp <- cbp %>%
  select(
    FIPS,
    NAICS,
    starts_with('N')
  )
sector <- fread(
  'data/ACS/sector_naics.csv',
  colClasses = c(NAICS='character'))
cbp <- cbp %>%
  inner_join(sector)
cbp_grouped <- cbp %>%
  group_by(FIPS, Sector)
cbp <- cbp %>%
  group_by(FIPS, Sector) %>%
  select(starts_with('N'), -NAICS) %>%
  summarize_all(sum)
acs_cbp <- cbp %>%
  inner_join(acs)

gather(tidy_survey, key = "attr",
       value = "val", -participant)
cbp_23 <- fread('data/cbp15co.csv', na.strings = '') %>%
  filter(NAICS == '23----') %>%
  select(starts_with('FIPS'), starts_with('AP'))

cbp_21 <- fread('data/cbp15co.csv', na.strings = '') %>%
  filter(NAICS == '21----') %>%
  group_by(FIPSTATE, FIPSCTY) %>%
  summarize(EMP = sum(EMP)) %>%
  summarize(EMP = sum(EMP), counties = n())

pivot <- fread('data/cbp15co.csv', na.strings = '') %>%
  filter(str_detect(NAICS, '[0-9]{2}----')) %>%
  group_by(FIPSTATE, NAICS) %>%
  summarize(EMP = sum(EMP)) %>%
  spread(key = NAICS, value = EMP)

gather(tidy_survey, key = "attr",
       value = "val", -participant)

long_survey <- gather(tidy_survey, key = "attr",
                      value = "val", -participant)
cbp_23 <- fread('data/cbp15co.csv', na.strings = '') %>%
  filter(NAICS == '23----') %>%
  select(starts_with('FIPS'), starts_with('AP'))
pivot <- fread('data/cbp15co.csv', na.strings = '') %>%
  filter(str_detect(NAICS, '[0-9]{2}----')) %>%
  group_by(FIPSTATE, NAICS) %>%
  summarize(EMP = sum(EMP)) %>%
  spread(key = NAICS, value = EMP)

cbp_21 <- fread('data/cbp15co.csv', na.strings = '') %>%
  filter(NAICS == '21----') %>%
  group_by(FIPSTATE, FIPSCTY) %>%
  summarize(EMP = sum(EMP)) %>%
  summarize(EMP = sum(EMP), counties = n())
