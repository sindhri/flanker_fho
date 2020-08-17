%

function run_fho(testmode, subject_ID)
tic
current_path = [fileparts(which('run_fho.m')) filesep];
file_separators = find(current_path == filesep);
n_file_separators = length(file_separators);
path_project = current_path(1:file_separators(n_file_separators-2));
path_scripts = current_path(1:file_separators(n_file_separators-1));
path_data = [path_project 'data' filesep 'raw' filesep];
path_result = [path_project 'data' filesep 'result' filesep];

addpath([path_scripts 'misc']);
addpath([path_scripts 'dependencies' filesep 'eeglab13_6_5b' filesep]);
addpath(genpath([path_scripts 'dependencies' filesep 'eeglab13_6_5b' filesep 'functions' filesep]));
addpath([path_scripts 'dependencies' filesep 'eeglab13_6_5b' filesep 'sample_locs' filesep]);
addpath([path_scripts 'dependencies' filesep 'lib_ITC' filesep]);

baseline = 700;
category_names = {'ERN','resp_congruent','resp_incongruent',...
    'stim_congruent','stim_incongruent'};
vbaseline = [-100,0];
target_srate = 1000;
id_type = 1;
freq_limits = [3,30];
%testmode = 'n';

ITC_single_file_vbaseline_one_subject(category_names,baseline,...
    vbaseline,'',id_type,freq_limits,path_data,path_result,testmode,...
    subject_ID, target_srate);
fprintf('\ncompleted testmode = %s, subject_ID = %s\n',testmode,subject_ID);
toc
end

