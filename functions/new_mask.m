function newmask_matrix = create_mask(cfg,mask)
% This functions create random permutated logical masks based on an existing one (same number of ones). Aim: statistical tests.
% It accepts as input the original mask and a cfg structure containing the number of permutations to return.
% It returns a matrix, each row corresponding to a random mask.

n_perm=bml_getopt(cfg,'n_permutations',50);

pieces=bwconncomp(mask);
newmask_matrix=zeros(n_perm,length(mask));
for i=1:n_perm
    newmask=zeros(size(mask));
    for ii=1:pieces.NumObjects
        next=1;
        idx=pieces.PixelIdxList{ii};
        while next
            r_idx=randi(length(mask));
            if ~(any(r_idx==[1,2]) || r_idx+length(idx)>length(mask) || any(newmask(r_idx-2:r_idx+length(idx))))
                newmask(r_idx:r_idx+(length(idx)-1))=1;
                next=0;
            end       
        end
    end
    newmask_matrix(i,:)=newmask;
end

end
