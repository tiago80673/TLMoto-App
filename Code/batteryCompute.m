function battery = batteryCompute(battery)
    
    battery.assembly(:,1:5) = battery.assembly(:,1:5)/10;
    battery.assembly(:,9) = battery.assembly(:,9) /1000;

    battery.pack1(:,1:6) = battery.pack1(:,1:6)/100 +2;
    battery.pack1(:,9) = battery.pack1(:,9) /1000;

    battery.pack2(:,1:6) = battery.pack2(:,1:6)/100 +2;
    battery.pack2(:,9) = battery.pack2(:,9) /1000;

    battery.pack3(:,1:6) = battery.pack3(:,1:6)/100 +2;
    battery.pack3(:,9) = battery.pack3(:,9) /1000;

    battery.pack4(:,1:6) = battery.pack4(:,1:6)/100 +2;
    battery.pack4(:,9) = battery.pack4(:,9) /1000;

    battery.pack5(:,1:6) = battery.pack5(:,1:6)/100 +2;
    battery.pack5(:,9) = battery.pack5(:,9) /1000;
    

    
end

