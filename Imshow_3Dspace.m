function Imshow_3Dspace(idx,cluster_n,Theta,Rho,Psi)
d_t=Theta(:);
d_r=-Rho(:);
d_p=Psi(:);
% 
% d_t=d_t.*(1./mean(d_t));
% d_r=d_r.*(1./mean(d_r));
% d_p=d_p.*(1./mean(d_p));

colors={
    [255 0 0]./255
    [0 255 0]./255
    [0 0 255]./255
    [67 68 255]./255
    [0.7098, 0.2000, 0.3608]
    [21 135 13]./255
    [251 19 243]./255
    [67 235 59]./255
    [251 135 13]./255
    [21 171 243]./255
    [137 19 129]./255
    [0.4157, 0.5373, 0.0824]
    [0.7059, 0.5333, 0.8824]
    [0.0000, 1.0000, 1.0000]

    };
Size={"o","^","square","diamond",">","pentagram","v","*","x","hexagram","+","hexagram"};
figure
for t = 1:cluster_n
    points_x=[];points_y=[];points_z=[];
    points_x = d_t(idx == t, :);
    points_y = d_r(idx == t, :);
    points_z = d_p(idx == t, :);
    plot3(points_x(:),points_y(:),points_z,'Color',colors{t},'Marker',Size{t},'LineStyle', 'none')
    hold on
end
xlabel('\theta_i')
ylabel('\rho_i')
zlabel('\eta_i')
set(gca,'FontSize',12,'FontName', 'ArialMT')
grid on
% view(79,20)
% view(40,21)

box on
ax = gca;
ax.BoxStyle = 'full'; % 设置为完整立体框