% A função retorna um vector com a primeira coordenada de cada nova volta

function lapTime = lapSeparate (gps,finishLine,threshold)
%   Exemplo: Ficheiro 'Primeira_Saida.txt' ---> Kartodromo de Kiro 
%   Meta - > 39.26642438391545, -9.188870809998459
%             39.26641140518718, -9.188762851087874
%   meta = [-9.188870809998459,-9.188762851087874 ; 39.26642438391545, 39.26641140518718 ];
%  2 : meta = [-9.188945,-9.188682;39.266435,39.266407]


% gps is a matrix containing GPS data with columns [latitude, longitude, altitude, time]
% finishLine is a 2-element row vector containing the latitude and longitude coordinates of the finish line
    if nargin < 3
        % Default threshold value
        threshold = 0.015; % in meters
    end

    lapTime = [];   
    lastCrossingTime = -inf;
    lastCrossingDistance = inf;
    for i = 1:size(gps, 1)
        distToFinish = lldistkm(gps(i, 1:2), finishLine);
        disp(distToFinish)
        if distToFinish < threshold % adjust threshold as necessary (kms)
            if (gps(i, 4) - lastCrossingTime) > 10 % max time between two GPS points till considered different laps
                lapTime(end+1) = gps(i, 4); % add the time of the current GPS point to lapTime
                lastCrossingDistance = distToFinish;
            else
                if lastCrossingDistance > distToFinish
                    lapTime(end) = gps(i,4); %replace current guess to better aproximation to the finish line
                end
            end
            lastCrossingTime = gps(i, 4); % update lastCrossing to the time that a GPS point was within threshold range
        end
    end
end

function d = lldistkm(latlon1, latlon2)
    % LLDISTKM calculates the distance between two points on the Earth's
    % surface using the haversine formula
    % latlon1 and latlon2 are two-element vectors containing the latitude and
    % longitude coordinates of each point in decimal degrees
    % Distance is returned in kilometers
    
    R = 6371; % Earth's radius in km
    dLat = deg2rad(latlon2(1)-latlon1(1));
    dLon = deg2rad(latlon2(2)-latlon1(2));
    lat1 = deg2rad(latlon1(1));
    lat2 = deg2rad(latlon2(1));
    a = sin(dLat/2)*sin(dLat/2) + sin(dLon/2)*sin(dLon/2)*cos(lat1)*cos(lat2);
    c = 2*atan2(sqrt(a),sqrt(1-a));
    d = R*c;
end