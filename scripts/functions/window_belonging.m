function pieces = window_belonging(cfg,pieces)
% for every piece, this function checks to which experimental window it belongs
% it accepts a cfg structure containing the windows' extremes, and the structure pieces to check, and returns the structure pieces with an additional field = corresponding window

limits=bml_getopt(cfg,'limits');
bl_idx=limits(1);
br_idx=limits(2);
stl_idx=limits(3);
str_idx=limits(4);
syl_idx=limits(5);
syr_idx=limits(6);
rl_idx=limits(7);
rr_idx=limits(8);


windows=cell(1,pieces.NumObjects);
for ii=1:pieces.NumObjects
    idx=pieces.PixelIdxList{ii};
    l_idx=idx(1);
    r_idx=idx(end);
    duration_idx=r_idx-l_idx;
    % consider the following cases
        % 1) area inside the window
        % 2) left inside and right outside only for half
        % 3) left outside only for half and right inside
        % 4) window inside area
    if (l_idx>=bl_idx && r_idx<=br_idx) || (l_idx>=bl_idx && r_idx-duration_idx/2<=br_idx) || (l_idx+duration_idx/2>=bl_idx && r_idx<=br_idx) || (l_idx<=bl_idx && r_idx>=br_idx)
        window={'baseline'}; 
    elseif (l_idx>=stl_idx && r_idx<=str_idx) || (l_idx>=stl_idx && r_idx-duration_idx/2<=str_idx) || (l_idx+duration_idx/2>=stl_idx && r_idx<=str_idx) || (l_idx<=stl_idx && r_idx>=str_idx)
        window={'stimulus'};
    elseif (l_idx>=syl_idx && r_idx<=syr_idx) || (l_idx>=syl_idx && r_idx-duration_idx/2<=syr_idx) || (l_idx+duration_idx/2>=syl_idx && r_idx<=syr_idx) || (l_idx<=syl_idx && r_idx>=syr_idx)
        window={'speech'};
    elseif (l_idx>=rl_idx && r_idx<=rr_idx) || (l_idx>=rl_idx && r_idx-duration_idx/2<=rr_idx) || (l_idx+duration_idx/2>=rl_idx && r_idx<=rr_idx) || (l_idx<=rl_idx && r_idx>=rr_idx)
        window={'rebound'};
    else;window={'outside'};
    end
    windows(ii)=window;
end
pieces.area=windows;

end

