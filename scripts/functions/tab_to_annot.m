function annot = tab_to_annot(tab,info_epoch)
# This function converts a table into a bml annotation table with timing information from the strct info_epoch

warning off
annot=table();
for j=1:height(tab)
    trial=tab.trial_id(j);
    label=tab.label(j);
    if iscell(label)
        label=label{1};
        chan=label;
    else
        chan=char(['ecog_',num2str(label)]);
    end
    annot.id(j)=j;
    annot.starts(j)=info_epoch.starts(info_epoch.id==trial);
    annot.ends(j)=info_epoch.ends(info_epoch.id==trial);
    annot.duration(j)=info_epoch.duration(info_epoch.id==trial);
    annot.trial_id(j)=trial;
    annot.label(j)={chan};
end
warning on

end
