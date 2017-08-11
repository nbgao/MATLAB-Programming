function matrixplot(data,varargin)
%   根据实值矩阵绘制色块图，用丰富的颜色和形状形象的展示矩阵元素值的大小。
%
%   matrixplot(data) 绘制矩阵色块图，data为实值矩阵，每一个元素对应一个色块，色
%                    块颜色由元素值大小决定。
%
%   matrixplot(data, 'PARAM1',val1, 'PARAM2',val2, ...) 
%          用成对出现的参数名/参数值控制色块的各项属性。可用的参数名/参数值如下：
%          'FigShape' --- 设定色块的形状，其参数值为：
%                'Square'  --- 方形（默认）
%                'Circle'  --- 圆形
%                'Ellipse' --- 椭圆形
%                'Hexagon' --- 六边形
%                'Dial'    --- 表盘形
%
%          'FigSize' --- 设定色块的大小，其参数值为：
%                'Full'    --- 最大色块（默认）
%                'Auto'    --- 根据矩阵元素值自动确定色块大小
%
%          'FigStyle' --- 设定矩阵图样式，其参数值为：
%                'Auto'    --- 矩形矩阵图（默认）
%                'Tril'    --- 下三角矩阵图
%                'Triu'    --- 上三角矩阵图
%
%          'FillStyle' --- 设定色块填充样式，其参数值为：
%                'Fill'    --- 填充色块内部（默认）
%                'NoFill'  --- 不填充色块内部
%
%          'DisplayOpt' --- 设定是否在色块中显示矩阵元素值，其参数值为：
%                'On'      --- 显示矩阵元素值（默认）
%                'Off'     --- 不显示矩阵元素值
%
%          'TextColor' --- 设定文字的颜色，其参数值为：
%                表示单色的字符（'r','g','b','y','m','c','w','k'）,默认为黑色
%                1行3列的红、绿、蓝三元色灰度值向量（[r,g,b]）
%                'Auto'    --- 根据矩阵元素值自动确定文字颜色
%
%          'XVarNames' --- 设定X轴方向需要显示的变量名（默认为X1,X2,...），其参数值为：
%                字符串矩阵或字符串元胞数组，若为字符串矩阵，其行数应与data的列数相同
%                若为字符串元胞数组，其长度应与data的列数相同。
%
%          'YVarNames' --- 设定Y轴方向需要显示的变量名（默认为Y1,Y2,...），其参数值为：
%                字符串矩阵或字符串元胞数组，若为字符串矩阵，其行数应与data的行数相同
%                若为字符串元胞数组，其长度应与data的行数相同。
%
%          'ColorBar' --- 设定是否显示颜色条，其参数值为：
%                'On'      --- 显示颜色条
%                'Off'     --- 不显示颜色条（默认）
%
%          'Grid' --- 设定是否显示网格线，其参数值为：
%                'On'      --- 显示网格线（默认）
%                'Off'     --- 不显示网格线
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
%   CopyRight：xiezhh（谢中华）,2013.01.24编写


% 对第一个输入参数类型进行判断
if ~ismatrix(data) || ~isreal(data)
    error('输入参数类型不匹配：第一个输入参数应为实值矩阵');
end


% 解析成对出现的参数名/参数值
[FigShape,FigSize,FigStyle,FillStyle,DisplayOpt,TextColor,XVarNames,...
    YVarNames,ColorBar,GridOpt] = parseInputs(varargin{:});


% 产生网格数据
[m,n] = size(data);
[x,y] = meshgrid(0:n,0:m);
data = data(:);
maxdata = nanmax(data);
mindata = nanmin(data);
rangedata = maxdata - mindata;
if isnan(rangedata)
    warning('MATLAB:warning1','请检查您输入的矩阵是否合适！');
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
        error('X轴方向变量名应为字符串矩阵或字符串元胞数组，其长度与输入矩阵的列数相同');
    end
end
if isempty(YVarNames)
    YVarNames = strcat('Y',cellstr(num2str((1:m)')));
else
    if (iscell(YVarNames) && (numel(YVarNames) ~= m)) || (~iscell(YVarNames) && (size(YVarNames,1) ~= m))
        error('Y轴方向变量名应为字符串矩阵或字符串元胞数组，其长度与输入矩阵的行数相同');
    end
end


% 绘图
figure('color','w',...
    'units','normalized',...
    'pos',[0.289165,0.154948,0.409956,0.68099]);
axes('units','normalized','pos',[0.1,0.022,0.89,0.85]);
if strncmpi(GridOpt,'On',2)
    mesh(x,y,z,...
        'EdgeColor',[0.7,0.7,0.7],...
        'FaceAlpha',0,...
        'LineWidth',1);   % 参考网格线
end
hold on;
axis equal;
axis([-0.1,n+0.1,-0.1,m+0.1,-0.5,0.5]);
view(2);
% 设置X轴和Y轴刻度位置及标签
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


% 绘制填充色块
if strncmpi(FillStyle,'Fill',3)
    MyPatch(sx',sy',data',FigShape,FigSize);
end


% 显示数值文本信息
if strncmpi(DisplayOpt,'On',2)
    str = num2str(data,'%4.2f');
    scale = 0.1*max(n/m,1)/(max(m,n)^0.55);
    if strncmpi(TextColor,'Auto',3)
    end
end
