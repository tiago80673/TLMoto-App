function data = getLappedData(battery,gps,susp,controller,temp,meta)
    lapTime = lapSeparate (gps,meta);
    disp(lapTime);
    data = lapOrganize(lapTime,battery,controller,gps,susp,temp);
end

