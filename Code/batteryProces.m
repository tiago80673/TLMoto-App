function battery = batteryProces(data) 

%Pack Assembly (toda a bateria)
    battery.assembly = data{strcmp(data{:,1},'50'),2:10};
    battery.assembly = cellfun(@str2doubleq,battery.assembly);
%Pack 1 
    battery.pack1 = data{strcmp(data{:,1},'51'),2:10};
    battery.pack1 = cellfun(@str2doubleq,battery.pack1);
%Pack 2 
    battery.pack2 = data{strcmp(data{:,1},'52'),2:10};
    battery.pack2 = cellfun(@str2doubleq,battery.pack2);

%Pack 3 
    battery.pack3 = data{strcmp(data{:,1},'53'),2:10};
    battery.pack3 = cellfun(@str2doubleq,battery.pack3);
%Pack 4 
    battery.pack4 = data{strcmp(data{:,1},'54'),2:10};
    battery.pack4 = cellfun(@str2doubleq,battery.pack4);

%Pack 5 (toda a bateria)
    battery.pack5 = data{strcmp(data{:,1},'55'),2:10};
    battery.pack5 = cellfun(@str2doubleq,battery.pack5);

end
