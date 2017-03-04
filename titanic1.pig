dataset = load '/user/titanicdata' using PigStorage(',') as (pid:int, sid:int, pclass:int, name:chararray, sex:chararray, age:int, sibsp:int, parch:int, ticket:chararray, fare:chararray, cabin:chararray, embarked:chararray);


Dead = filter dataset by sid == 1;


male = filter Dead by sex == 'male';


female = filter Dead by sex == 'female';


malegroup = group male all;


femalegroup = group female all;


avgmale = foreach malegroup generate AVG(male.age);


avgfemale = foreach femalegroup generate AVG(female.age);


dump avgmale;


dump avgfemale;
