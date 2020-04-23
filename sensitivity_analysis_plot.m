figure
boxplot([new11',new6',new1',new12',new7',new2',new13',new8',new3',new14',new9',new4',new15',new10',new5'],...
    'labels',{'S 1','S 2','S 3','S 4','S 5','S 1','S 2',...
    'S 3','S 4','S 5','S 1','S 2','S 3','S 4','S 5'},'OutlierSize',1)

% boxplot([new11,new6,new1,new12,new7,new2,new13,new8,new3,new14,new9,new4,new15,new10,new5],...
%      'labels',{'S 1','S 2','S 3','S 4','S 5','S 1','S 2','S 3','S 4','S 5','S 1','S 2','S 3','S 4','S 5'},...
%      'OutlierSize',1)

hold on

xlabel('Scenario');
% ylabel('Warm spell duration reduction (day)');
ylabel('Temperature reduction (^{\circ}C)');

cust_colr = [0, 0.5, 1; 0.60156, 0.80078, 0.19531; 0.5, 0, 0; 
   0, 0.5, 1; 0.60156, 0.80078, 0.19531; 0.5, 0, 0;
   0, 0.5, 1; 0.60156, 0.80078, 0.19531; 0.5, 0, 0;
   0, 0.5, 1; 0.60156, 0.80078, 0.19531; 0.5, 0, 0;
   0, 0.5, 1; 0.60156, 0.80078, 0.19531; 0.5, 0, 0];

h = findobj(gca,'Tag','Box');
 for j=1:length(h)
     patch(get(h(j),'XData'),get(h(j),'YData'),cust_colr(j,:));
 end

plot([mean(new11),mean(new6),mean(new1),mean(new12),mean(new7),mean(new2),mean(new13),mean(new8),mean(new3),mean(new14)...
    mean(new9),mean(new4),mean(new15),mean(new10),mean(new5)],'x')

 
hold off