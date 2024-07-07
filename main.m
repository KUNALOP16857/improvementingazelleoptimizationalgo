clear all 
clc

SearchAgents_no=50; 

Function_name='F10'; 

Max_iteration=1000; 


[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

figure('Position',[500 400 600 300])

subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])


subplot(1,2,2);
semilogy(GWO_cg_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('GWO')

display(['best solution by GWO :', num2str(Best_pos)]);
display(['best optimal value of objective funciton found by GWO : ', num2str(Best_score)]);

        


