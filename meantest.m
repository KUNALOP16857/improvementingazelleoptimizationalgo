clear all
clc
format long

% Define parameters
SearchAgents_no = 30; % Number of search agents
Max_iteration = 1000; % Maximum number of iterations
Num_iterations = 50; % Number of iterations to average over

% Initialize variables to store average results and standard deviations
% average_results_POA = zeros(30, 1);
% average_results_POA2 = zeros(30, 1);
std_dev_POA = zeros(30, 1);
std_dev_POA2 = zeros(30, 1);
% p_values = zeros(30, 1);

% Loop through each function
for i = 1:30
    if i == 2
        continue;
    end
    % Initialize variables to store results for each iteration
    results_POA = zeros(Num_iterations, 1);
    results_POA2 = zeros(Num_iterations, 1);
    
    for j = 1:Num_iterations
        % Get function details
        F_name = ['F', num2str(i)];
        [lb, ub, dim, fobj] = CEC2017(F_name);
        FPK = 0.2; % You need to set appropriate values for FPK and FGK
        FGK = 0.6; % These are just placeholders
        
        % Run POA algorithm
        [Best_score_POA, ~, ~] = GOA2(SearchAgents_no, Max_iteration, lb, ub, dim, fobj);
        results_POA(j) = Best_score_POA;

        % Run POA2 algorithm
        [Best_score_POA2, ~, ~] = GOA5(SearchAgents_no, Max_iteration, lb, ub, dim, fobj);
        results_POA2(j) = Best_score_POA2;
    end
    
    % Calculate average results and standard deviations
    % average_results_POA(i) = mean(results_POA);
    % average_results_POA2(i) = mean(results_POA2);
    std_dev_POA(i) = std(results_POA);
    std_dev_POA2(i) = std(results_POA2);
    
    % Calculate p-value using Wilcoxon Rank Sum test
    % p_values(i) = ranksum(results_POA, results_POA2);
    
    % Display results for each function
    fprintf('Function %d:\n', i);
    fprintf(' Std Dev GOA: %s\n', num2str(std_dev_POA(i)));
    fprintf(' Std Dev MGOA: %s\n', num2str(std_dev_POA2(i)));
    % fprintf('p-value (Wilcoxon Rank Sum): %s\n\n', num2str(p_values(i)));
end