with pasthomematches as(
  select Date,Home as FootballTeam,
  case when HomeGoals>AwayGoals then 1
  else 0
  end as result
  from wyk_resturant.Football
),
pastawaymatches as(
  select Date,Away as FootballTeam,
  case when HomeGoals<AwayGoals then 1
  else 0
  end as result
  from wyk_resturant.Football
),
pastmatches as(
  select*
  from pasthomematches
  union all
  select *
  from pastawaymatches
),
pastresult as(
  select *,
SUM(result) OVER (Partition by FootballTeam
      ORDER BY FootballTeam,date
      ROWS BETWEEN 3 Preceding AND 3 Preceding) as matchresult3,
SUM(result) OVER (Partition by FootballTeam
      ORDER BY FootballTeam,date
      ROWS BETWEEN 2 Preceding AND 2 Preceding) as matchresult2,
SUM(result) OVER (Partition by FootballTeam
      ORDER BY FootballTeam,date
      ROWS BETWEEN 1 Preceding AND 1 Preceding) as matchresult1
from pastmatches
order by FootballTeam,date
)
select count(matchresult1) over() as games,
sum(case when matchresult1=1 then 1 else 0 end) over() as hotstreak1,
sum(case when (matchresult1=1 and matchresult2=1) then 1 else 0 end) over() as hotstreak2,
sum(case when (matchresult1=1 and matchresult2=1 and matchresult3=1) then 1 else 0 end) over() as hotstreak3ormore
from pastresult
where matchresult3 is not null
order by FootballTeam,date
