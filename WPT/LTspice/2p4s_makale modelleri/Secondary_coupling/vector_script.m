
function vector_script(p0,p1,c,alpha)
    x0 = p0(1);
    y0 = p0(2);
    x1 = p1(1);
    y1 = p1(2);
    p = p1-p0;
    hu = [x1-alpha*(p(1)+alpha*(p(2)+eps)); x1; x1-alpha*(p(1)-alpha*(p(2)+eps))];
    hv = [y1-alpha*(p(2)-alpha*(p(1)+eps)); y1; y1-alpha*(p(2)+alpha*(p(1)+eps))];
    plot([x0;x1],[y0;y1],c, hu(:),hv(:),c,'lineWidth',2);   % Draw a line between p0 and p1
    p0=[0,0];
    p0=[0,0];
end