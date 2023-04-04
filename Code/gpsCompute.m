function gps = gpsCompute(gps)
    

%gpsData formato INICIAL
    % coluna
    %  1    -> latitude [1DDMM.MMMMMM] with signal
    %  2    -> longitude [1DDDMM.MMMMMM] with signal
    %  3    -> Ground Speed [km/h]
    %  5    -> time [1000*s]

%Conversão da longitude e latitude para graus.
    for ii = 1:length(gps)
        %Padrao da latitude[1DDMM.MMMMMM]
        if gps(ii,1)>0
           gps(ii,1) = (fix(gps(ii,1)/100)-100) + (gps(ii,1) - fix(gps(ii,1)/100)*100)/60;

            elseif gps(ii,1)<0
                gps(ii,1) = (-1)*gps(ii,1);
                gps(ii,1) = (fix(gps(ii,1)/100)-100) + (gps(ii,1) - fix(gps(ii,1)/100)*100) /60;
                gps(ii,1) = (-1)*gps(ii,1);
        end
        %Padrao de longitude[1DDDMM.MMMMMM]
        if gps(ii,2)>0
            gps(ii,2) = (fix(gps(ii,2)/100)-1000) + (gps(ii,2) - fix(gps(ii,2)/100)*100) /60;
            
             elseif gps(ii,2)<0
                gps(ii,2) = (-1)*gps(ii,2);
                gps(ii,2) = (fix(gps(ii,2)/100)-1000) + (gps(ii,2) - fix(gps(ii,2)/100)*100)/60;
                gps(ii,2) = (-1)*gps(ii,2);
        end
    end
    
    %Conversão do tempo para segundos
    gps(:,4) = gps (:,4)/1000;

    %gpsData formato FINAL
    % coluna
    %  1    -> latitude [Degrees] with signal
    %  2    -> longitude [Degrees] with signal
    %  3    -> Ground Speed [km/h]
    %  5    -> time [s]


end