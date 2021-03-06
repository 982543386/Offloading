function vms_assignment=vms_assignment(M,app_index)
% This function validates decisions. Status of the resource is updated and
% returned.

    % This function returns a matrix with two rows and M columns.
    % The first row contains the distance to the access point
    % and the second one the rate in terms of computational power.
    % There will be considered the 15 following remote machines
    % 
    % The distances are approximated (Km).  
    %   cities = [cellstr('BCN'),30;        BARCELONA
    %             cellstr('MAD'),620;       MADRID
    %             cellstr('PAR'),1035;      PARIS
    %             cellstr('LON'),1486;      LONDON
    %             cellstr('AMS'),1533;      AMSTERDAM
    %             cellstr('VIE'),1828;      VIENA
    %             cellstr('WAW'),2397;      WARSOW
    %             cellstr('WAS'),6489;      WASHINGTON
    %             cellstr('MIA'),7542;      MIAMI
    %             cellstr('DFW'),8330;      DALLAS
    %             cellstr('LAX'),9653;      LOS ANGELES
    %             cellstr('HKG'),10053;     HONG KONG
    %             cellstr('TYO'),10413;     TOKYO
    %             cellstr('SIN'),10875;     SINGAPURE
    %             cellstr('SYD'),17179];    SYDNEY
    
    % Distances APs-VMs
    location = [0,30,620,1035,1486,1533,1828,2397,6489,7542,8330,9653,10053,10413,10875,17179];
    
    rate = [2.77 4.43; 6.76 10.4]; 

    % At first the VMs in the scenario are located (KM). 
     for i=1:M
        vms_assignment(1,i)= randsample(location,1)*1000;
        vms_assignment(2,i)= randsample(rate(app_index,:),1)*10e6*8;
     end
end