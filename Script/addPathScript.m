
str=pwd;
index_dir=strfind(str,'\');
homeDir=str(1:index_dir(end)-1); %找到当前工作路径

addpath([homeDir,'/Script']);
addpath([homeDir,'/Basic_algorithms']);
addpath([homeDir,'/Observer']);
addpath([homeDir,'/Output']);
addpath([homeDir,'/Param']);
addpath([homeDir,'/Basic_algorithms']);