function val = finished(obj)
    if obj.current+1 >= length(obj.waypoints)
        val = true;
    else
        val = false;
    end
end

