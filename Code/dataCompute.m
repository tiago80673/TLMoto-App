function [battery,gps,susp,controller,temp] = dataCompute(battery,gps,susp,controller,temp)
    
    battery = batteryCompute(battery);
    gps = gpsCompute(gps);
    controller = controllerCompute(controller);
    temp = tempCompute(temp);
end
