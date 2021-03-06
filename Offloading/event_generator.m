function [events] = event_generator(Number_of_users,Offered_load,Simulation_time,app)

% Olga Mu�oz 19/09/2015
% Mauro Lucchini 08/10/2015 (EXTRA)

%INPUTS:
% Number of users
% Offered_load: Average number of requests per second generated by EACH
% user. In this function, the average number of requests per second per user is considered
% the same for all the users.
% Simulation_time: Total simulation time in seconds.
% OUTPUTS:
% events: A Matrix with 2 rows. The first rows contains the time of arrivals of consequtive requests,
% the second row identifies the user who generated the request.
% EXTRA: DATA LOAD
% An extra row is added to the matrix in order to associate an amount of
% data (number of bits) for each event. Therefore, each event will
% request for a certain data load.


mean_time_intervals=1/Offered_load;
number_of_packets_simulated_per_user=floor(1.2*ceil(Simulation_time/mean_time_intervals));
%If the Simulation time is high enough,
% Note that we are generating more requests than needed (around 1.2 times
% more).
% As a consequence, the latest request may arrive at a time much greater than the
% simulation time.


%Interarrival times
% Given a Poisson arrival process, with events at times t(i).
%  The IAT statistics are exponential, thus, tau = t(i+1) - t(i)
% is a random variable with an exponential pdf:
%  pdf (tau) = lambda * exp (- lambda * tau)
delta=exprnd(mean_time_intervals,Number_of_users,number_of_packets_simulated_per_user);
%
% R = exprnd(mu,m,n) generates an m-by-n-by-array containing random numbers
% from the exponential distribution with mean parameter mu.
% mu can be a scalar or an array of the same size as R.


%Arrival times of requests
t=cumsum(delta,2);
users=kron((1:1:Number_of_users)',ones(1,size(t,2)));

%Conversion of arrival time to events
a=t(:);b=users(:);
[arrival_times,index]=sort(a);
who_user=b(index);
ev=[arrival_times';who_user'];

%EXTRA: DATA LOAD
%In this section app_index is used so as to characterize the packages
%depending on the app, the number of bits to offload will be more or less.

if app==1
load = 100; 
elseif app==2  
load = 100; 
end

[r,c] = size(ev);
k = round(exprnd(load,[1,c]));

for i=1:c
    if mod(k(1,i),8)~=0
        ans = round(k(1,i)/8);
        k(1,i)= k(1,i)- ans;
   end 
end
% bits
% assign the correspondent data load to each request
events=[ev;k];


