function temp = tempProces(data)
    
    %Tempretaturas dos packs 1 e 2
    temp.pack12 = data{strcmp(data{:,1},'121'),2:10};
    temp.pack12 = cellfun(@str2doubleq,temp.pack12);

    %Tempretaturas dos packs 3 e 4
    temp.pack34 = data{strcmp(data{:,1},'122'),2:10};
    temp.pack34 = cellfun(@str2doubleq,temp.pack34);

    %Tempretaturas do 5
    temp.pack5 = data{strcmp(data{:,1},'123'),2:10};
    temp.pack5 = cellfun(@str2doubleq,temp.pack5);
end