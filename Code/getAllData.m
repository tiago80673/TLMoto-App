function data = getAllData(filename, meta)
    [battery,gps,susp,controller,temp] = dataProces(filename);
    lapTime = lapSeparate (gps,meta);
    data = lapOrganize(lapTime,battery,controller,gps,susp,temp);

end
