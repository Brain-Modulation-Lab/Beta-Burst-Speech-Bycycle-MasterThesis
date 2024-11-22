function mask = bursts_consistence(cfg,sig)
% This function controls detected bursts are longer or equal to 100ms, and unifies bursts closer than one delta t.
% It accepts as input the signal and a cfg structure containing sampling frequency and the bursts identification domain. It returns a mask with the corrected burst indexes

fs=bml_getopt(cfg,'fs',20);
domain=char(bml_getopt(cfg,'domain','frequency'));

switch domain
    case 'frequency'
        th=bml_getopt(cfg,'threshold'); % NB threshold value
        mask=sig>=th;
    case 'time'
        mask=sig;
end
pieces=bwconncomp(mask);

% unify bursts closer than 1 deltat
for ii=1:pieces.NumObjects-1
    deltat=pieces.PixelIdxList{ii+1}(1)-pieces.PixelIdxList{ii}(end) -1;
    if deltat<=0.05/(1/fs)
        mask(pieces.PixelIdxList{ii}(end):pieces.PixelIdxList{ii+1}(1))=1;
    end
end
pieces=bwconncomp(mask);

% do not consider bursts shorter than 100ms (100ms bursts will pass!)
for ii=1:pieces.NumObjects
    if numel(pieces.PixelIdxList{ii})<=0.1/(1/fs)
        mask(pieces.PixelIdxList{ii})=0;
    end
end

end

