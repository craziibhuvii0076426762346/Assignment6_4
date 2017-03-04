dataset = load '/user/titanicdata' using PigStorage(',') as(pid:int, sid:int, pclass:int, name:chararray, sex:chararray, age:int, sibsp:int, parch:int, ticket:chararray, fare:chararray, cabin:chararray, embarked:chararray);


Dead = filter dataset by sid == 1;


Survived = filter dataset by sid == 0;


GroupingDead = group Dead by pclass;


GroupingSurvived = group Survived by pclass;


Totaldead = foreach GroupingDead generate COUNT(Dead);


Totalsurvived = foreach GroupingSurvived generate COUNT(Survived);


dump Totaldead;


dump Totalsurvived;
