function matrixplot(data,varargin)
%   ����ʵֵ�������ɫ��ͼ���÷ḻ����ɫ����״�����չʾ����Ԫ��ֵ�Ĵ�С��
%
%   matrixplot(data) ���ƾ���ɫ��ͼ��dataΪʵֵ����ÿһ��Ԫ�ض�Ӧһ��ɫ�飬ɫ
%                    ����ɫ��Ԫ��ֵ��С������
%
%   matrixplot(data, 'PARAM1',val1, 'PARAM2',val2, ...) 
%          �óɶԳ��ֵĲ�����/����ֵ����ɫ��ĸ������ԡ����õĲ�����/����ֵ���£�
%          'FigShape' --- �趨ɫ�����״�������ֵΪ��
%                'Square'  --- ���Σ�Ĭ�ϣ�
%                'Circle'  --- Բ��
%                'Ellipse' --- ��Բ��
%                'Hexagon' --- ������
%                'Dial'    --- ������
%
%          'FigSize' --- �趨ɫ��Ĵ�С�������ֵΪ��
%                'Full'    --- ���ɫ�飨Ĭ�ϣ�
%                'Auto'    --- ���ݾ���Ԫ��ֵ�Զ�ȷ��ɫ���С
%
%          'FigStyle' --- �趨����ͼ��ʽ�������ֵΪ��
%                'Auto'    --- ���ξ���ͼ��Ĭ�ϣ�
%                'Tril'    --- �����Ǿ���ͼ
%                'Triu'    --- �����Ǿ���ͼ
%
%          'FillStyle' --- �趨ɫ�������ʽ�������ֵΪ��
%                'Fill'    --- ���ɫ���ڲ���Ĭ�ϣ�
%                'NoFill'  --- �����ɫ���ڲ�
%
%          'DisplayOpt' --- �趨�Ƿ���ɫ������ʾ����Ԫ��ֵ�������ֵΪ��
%                'On'      --- ��ʾ����Ԫ��ֵ��Ĭ�ϣ�
%                'Off'     --- ����ʾ����Ԫ��ֵ
%
%          'TextColor' --- �趨���ֵ���ɫ�������ֵΪ��
%                ��ʾ��ɫ���ַ���'r','g','b','y','m','c','w','k'��,Ĭ��Ϊ��ɫ
%                1��3�еĺ졢�̡�����Ԫɫ�Ҷ�ֵ������[r,g,b]��
%                'Auto'    --- ���ݾ���Ԫ��ֵ�Զ�ȷ��������ɫ
%
%          'XVarNames' --- �趨X�᷽����Ҫ��ʾ�ı�������Ĭ��ΪX1,X2,...���������ֵΪ��
%                �ַ���������ַ���Ԫ�����飬��Ϊ�ַ�������������Ӧ��data��������ͬ
%                ��Ϊ�ַ���Ԫ�����飬�䳤��Ӧ��data��������ͬ��
%
%          'YVarNames' --- �趨Y�᷽����Ҫ��ʾ�ı�������Ĭ��ΪY1,Y2,...���������ֵΪ��
%                �ַ���������ַ���Ԫ�����飬��Ϊ�ַ�������������Ӧ��data��������ͬ
%                ��Ϊ�ַ���Ԫ�����飬�䳤��Ӧ��data��������ͬ��
%
%          'ColorBar' --- �趨�Ƿ���ʾ��ɫ���������ֵΪ��
%                'On'      --- ��ʾ��ɫ��
%                'Off'     --- ����ʾ��ɫ����Ĭ�ϣ�
%
%          'Grid' --- �趨�Ƿ���ʾ�����ߣ������ֵΪ��
%                'On'      --- ��ʾ�����ߣ�Ĭ�ϣ�
%                'Off'     --- ����ʾ������
%
%   Example:
%   x = [1,-0.2,0.3,0.8,-0.5
%        -0.2,1,0.6,-0.7,0.2
%         0.3,0.6,1,0.5,-0.3
%         0.8,-0.7,0.5,1,0.7
%        -0.5,0.2,-0.3,0.7,1];
%   matrixplot(x);
%   matrixplot(x,'DisplayOpt','off');
%   matrixplot(x,'FillStyle','nofill','TextColor','Auto');
%   matrixplot(x,'TextColor',[0.7,0.7,0.7],'FigShap','s','FigSize','Auto','ColorBar','on');
%   matrixplot(x,'TextColor','k','FigShap','d','FigSize','Full','ColorBar','on','FigStyle','Triu');
%   XVarNames = {'xiezhh','heping','keda','tust','tianjin'};
%   matrixplot(x,'FigShap','e','FigSize','Auto','ColorBar','on','XVarNames',XVarNames,'YVarNames',XVarNames);
%
%   CopyRight��xiezhh��л�л���,2013.01.24��д


% �Ե�һ������������ͽ����ж�
if ~ismatrix(data) || ~isreal(data)
    error('����������Ͳ�ƥ�䣺��һ���������ӦΪʵֵ����');
end


% �����ɶԳ��ֵĲ�����/����ֵ
[FigShape,FigSize,FigStyle,FillStyle,DisplayOpt,TextColor,XVarNames,...
    YVarNames,ColorBar,GridOpt] = parseInputs(varargin{:});


% ������������
[m,n] = size(data);
[x,y] = meshgrid(0:n,0:m);
data = data(:);
maxdata = nanmax(data);
mindata = nanmin(data);
rangedata = maxdata - mindata;
if isnan(rangedata)
    warning('MATLAB:warning1','����������ľ����Ƿ���ʣ�');
    return;
end
z = zeros(size(x))+0.2;
sx = x(1:end-1,1:end-1)+0.5;
sy = y(1:end-1,1:end-1)+0.5;


if strncmpi(FigStyle,'Tril',4)
    z(triu(ones(size(z)),2)>0) = NaN;
    sx(triu(ones(size(sx)),1)>0) = NaN;
elseif strncmpi(FigStyle,'Triu',4)
    z(tril(ones(size(z)),-2)>0) = NaN;
    sx(tril(ones(size(sx)),-1)>0) = NaN;
end
sx = sx(:);
sy = sy(:);
id = isnan(sx) | isnan(data);
sx(id) = [];
sy(id) = [];
data(id) = [];


if isempty(XVarNames)
    XVarNames = strcat('X',cellstr(num2str((1:n)')));
else
    if (iscell(XVarNames) && (numel(XVarNames) ~= n)) || (~iscell(XVarNames) && (size(XVarNames,1) ~= n))
        error('X�᷽�������ӦΪ�ַ���������ַ���Ԫ�����飬�䳤������������������ͬ');
    end
end
if isempty(YVarNames)
    YVarNames = strcat('Y',cellstr(num2str((1:m)')));
else
    if (iscell(YVarNames) && (numel(YVarNames) ~= m)) || (~iscell(YVarNames) && (size(YVarNames,1) ~= m))
        error('Y�᷽�������ӦΪ�ַ���������ַ���Ԫ�����飬�䳤������������������ͬ');
    end
end


% ��ͼ
figure('color','w',...
    'units','normalized',...
    'pos',[0.289165,0.154948,0.409956,0.68099]);
axes('units','normalized','pos',[0.1,0.022,0.89,0.85]);
if strncmpi(GridOpt,'On',2)
    mesh(x,y,z,...
        'EdgeColor',[0.7,0.7,0.7],...
        'FaceAlpha',0,...
        'LineWidth',1);   % �ο�������
end
hold on;
axis equal;
axis([-0.1,n+0.1,-0.1,m+0.1,-0.5,0.5]);
view(2);
% ����X���Y��̶�λ�ü���ǩ
set(gca,'Xtick',(1:n)-0.5,...
    'XtickLabel',XVarNames,...
    'Ytick',(1:m)-0.5,...
    'YtickLabel',YVarNames,...
    'XAxisLocation','top',...
    'YDir','reverse',...
    'Xcolor',[0.7,0.7,0.7],...
    'Ycolor',[0.7,0.7,0.7],...
    'TickLength',[0,0]);
axis off


% �������ɫ��
if strncmpi(FillStyle,'Fill',3)
    MyPatch(sx',sy',data',FigShape,FigSize);
end


% ��ʾ��ֵ�ı���Ϣ
if strncmpi(DisplayOpt,'On',2)
    str = num2str(data,'%4.2f');
    scale = 0.1*max(n/m,1)/(max(m,n)^0.55);
    if strncmpi(TextColor,'Auto',3)
    end
end
