function val = finished(obj)
    if obj.current >= length(obj.waypoints)
        val = true;
    else
        val = false;
    end
end

