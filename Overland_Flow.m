%created by Katherine Wentz 3/7/16
%Overland Flow

%% Initial Conditions

clearvars 

%intial plot parameters
t_min=0; %s
t_max=18000; %s
dt=1; %s
x_min=0; %m
x_max=100; %m
dx=10; %m
z_max=30; %m
s=0.005; 
h0=0; %initial height of water

%initialize plot parameters
[timearray, spacearray, zb, h, z]=starting_conds(t_min, t_max, dt, x_min, x_max, dx, z_max, s, h0);

%model parameters
r=20/1000/3600; %rain rate ms-1 (20 is in mmhr-1)
l=length(timearray); 
dev=zeros(1,l); %create vector to change rain rate
dev(round((l/4)):round((2*l/4)))=20/1000/3600; %add 10 mmhr-1 to rain rate
dev(round(((2*l/4)+1)):round((3*l/4)))=40/1000/3600; %add 20 mmhr-1 to rain rate
r=r+dev; %combine rain rate vector and rain rate to make alternating rain rate over time

inf=5/(1000)/(3600); %m s-1 (5 is in mmhr-1)
n=0.045; %roughness of bed surface for Manning Eq. see q_func

%initialize plot
area(spacearray,z,'FaceColor','blue')
hold on
area(spacearray,zb,'FaceColor','black')
hold off
xlabel('Distance (m)','fontname','arial','fontsize',21)
ylabel('Elevation (m)','fontname','arial','fontsize',21)
ylim([29.5 30.5])
set(gca,'fontsize',18,'fontname','arial')
legend('Overland Flow','Bedrock')

%% Run Model

imax = length(timearray); %number of iterations
nplots = 100; %number of plots
tplot = t_max/nplots; %defines which iterations I want to plot

for i=1:imax
    dqdx=dqdx_func(dx,n,h,z);
    dhdt=-dqdx+r(i)-inf;
    h=h+(dhdt.*dt);
    h=max(h,0);
    z=h+zb;
    test(z)
    if rem(timearray(i),tplot)==0
        figure(1)
        area(spacearray,z,'FaceColor','blue')
        hold on
        area(spacearray,zb,'FaceColor','black')
        hold off
        xlabel('Distance (m)','fontname','arial','fontsize',21)
        ylabel('Elevation (m)','fontname','arial','fontsize',21)
        title('Overland Flow')
        ylim([29.5 30.5])
        set(gca,'fontsize',18,'fontname','arial')
        legend('Overland Flow','Bedrock')
        pause(0.05)
        clf
    end
    
end

figure(1)
area(spacearray,z,'FaceColor','blue')
hold on
area(spacearray,zb,'FaceColor','black')
hold off
xlabel('Distance (m)','fontname','arial','fontsize',21)
ylabel('Elevation (m)','fontname','arial','fontsize',21)
ylim([29.5 30.5])
set(gca,'fontsize',18,'fontname','arial')
legend('Overland Flow','Bedrock')




