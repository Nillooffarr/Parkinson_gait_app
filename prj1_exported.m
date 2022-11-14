classdef prj1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        pressuresensorsUIFigure         matlab.ui.Figure
        Lfoot                           matlab.ui.control.Image
        Rfoot                           matlab.ui.control.Image
        L7                              matlab.ui.control.Label
        L8                              matlab.ui.control.Label
        L6                              matlab.ui.control.Label
        L5                              matlab.ui.control.Label
        L2                              matlab.ui.control.Label
        L4                              matlab.ui.control.Label
        L3                              matlab.ui.control.Label
        L1                              matlab.ui.control.Label
        R8                              matlab.ui.control.Label
        R6                              matlab.ui.control.Label
        R7                              matlab.ui.control.Label
        R4                              matlab.ui.control.Label
        R5                              matlab.ui.control.Label
        R3                              matlab.ui.control.Label
        R2                              matlab.ui.control.Label
        R1                              matlab.ui.control.Label
        StartButton                     matlab.ui.control.StateButton
        enterfilenameTextAreaLabel_2    matlab.ui.control.Label
        enterthetimeEditFieldLabel_2    matlab.ui.control.Label
        stateLamp                       matlab.ui.control.Lamp
        walkingtimeLabel                matlab.ui.control.Label
        LastStrideTimeLabel             matlab.ui.control.Label
        LastSwingTimeLabel              matlab.ui.control.Label
        TotalForceLeftFootGauge         matlab.ui.control.Gauge
        TotalForceRightFootGauge        matlab.ui.control.Gauge
        greenfileuplodedcorrectlyLabel  matlab.ui.control.Label
        redfileisnotuploadedyetLabel    matlab.ui.control.Label
        SwingtoStrideratioLabel         matlab.ui.control.Label
        AverageStrideTimeLabel          matlab.ui.control.Label
        AverageSwingTimeLabel           matlab.ui.control.Label
        StrideNumberLabel               matlab.ui.control.Label
        AverageSwingtoStrideratioLabel  matlab.ui.control.Label
        TotalForceLeftFootLabel         matlab.ui.control.Label
        TotalForceRightFootLabel        matlab.ui.control.Label
        Lcenter                         matlab.ui.control.Lamp
        Rcenter                         matlab.ui.control.Lamp
        Image                           matlab.ui.control.Image
        min0NLabel                      matlab.ui.control.Label
        maxLabel                        matlab.ui.control.Label
        Image_2                         matlab.ui.control.Image
        min0NLabel_2                    matlab.ui.control.Label
        GaugemaxLabel                   matlab.ui.control.Label
        enterfilenameTextAreaLabel      matlab.ui.control.Label
        filename                        matlab.ui.control.TextArea
        SliderLabel                     matlab.ui.control.Label
        Slider                          matlab.ui.control.Slider
        enterthetimeEditFieldLabel_3    matlab.ui.control.Label
        time_asking                     matlab.ui.control.NumericEditField
        Label                           matlab.ui.control.Label
        Label_2                         matlab.ui.control.Label
        Label_3                         matlab.ui.control.Label
        Label_4                         matlab.ui.control.Label
        Label_5                         matlab.ui.control.Label
        Label_6                         matlab.ui.control.Label
        Label_7                         matlab.ui.control.Label
        Label_8                         matlab.ui.control.Label
        Label_9                         matlab.ui.control.Label
        Label_10                        matlab.ui.control.Label
        Label_11                        matlab.ui.control.Label
        Label_12                        matlab.ui.control.Label
        Label_13                        matlab.ui.control.Label
        Label_14                        matlab.ui.control.Label
        Label_15                        matlab.ui.control.Label
        Label_16                        matlab.ui.control.Label
        Label_17                        matlab.ui.control.Label
        Label_18                        matlab.ui.control.Label
        Label_19                        matlab.ui.control.Label
        Label_20                        matlab.ui.control.Label
        Label_21                        matlab.ui.control.Label
        Label_22                        matlab.ui.control.Label
        Label_23                        matlab.ui.control.Label
        Label_24                        matlab.ui.control.Label
        PauseButton                     matlab.ui.control.StateButton
        ErrorLabel                      matlab.ui.control.Label
    end

    
    properties (Access = public)
        Stop=0; % Description
    end
    
    
    methods (Access = private)
        
        function result = bigger_zero(app    , x)
            if(x<0)
                x = 0;
            end
            result = x;
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: StartButton
        function StartButtonValueChanged(app, event)
            value = app.StartButton.Value;
            
            %app.filename.Value = 'GaCo01_01';
            str_filename = string(app.filename.Value) + '.txt';
            rawdata=load(str_filename);
            time=rawdata(1:length(rawdata),1);
            fs=1/(time(2)-time(1));
            L1_data=rawdata(1:length(rawdata),2);
            L2_data=rawdata(1:length(rawdata),3);
            L3_data=rawdata(1:length(rawdata),4);
            L4_data=rawdata(1:length(rawdata),5);
            L5_data=rawdata(1:length(rawdata),6);
            L6_data=rawdata(1:length(rawdata),7);
            L7_data=rawdata(1:length(rawdata),8);
            L8_data=rawdata(1:length(rawdata),9);
            R1_data=rawdata(1:length(rawdata),10);
            R2_data=rawdata(1:length(rawdata),11);
            R3_data=rawdata(1:length(rawdata),12);
            R4_data=rawdata(1:length(rawdata),13);
            R5_data=rawdata(1:length(rawdata),14);
            R6_data=rawdata(1:length(rawdata),15);
            R7_data=rawdata(1:length(rawdata),16);
            R8_data=rawdata(1:length(rawdata),17);
            Ltotal=rawdata(1:length(rawdata),18);
            Rtotal=rawdata(1:length(rawdata),19);

            %total peak detection
            Rpks=findpeaks(Rtotal,'MinPeakDistance',100);
            Rtotal_height_mean=mean(Rpks);
            Lpks=findpeaks(Ltotal,'MinPeakDistance',100);
            Ltotal_height_mean=mean(Lpks);

            %sensor 1 peak detection
            L1_pks = findpeaks(L1_data,'MinPeakDistance',100);
            L1_height_mean = mean(L1_pks);
            L1_height_max = max(L1_pks);
            R1_pks = findpeaks(R1_data,'MinPeakDistance',100);
            R1_height_mean = mean(R1_pks);
            R1_height_max = max(R1_pks);
            
            %sensor 2 peak detection
            L2_pks = findpeaks(L2_data,'MinPeakDistance',100);
            L2_height_mean = mean(L2_pks);
            L2_height_max = max(L2_pks);
            R2_pks = findpeaks(R2_data,'MinPeakDistance',100);
            R2_height_mean = mean(R2_pks);
            R2_height_max = max(R2_pks);
            
            %sensor 3 peak detection
            L3_pks = findpeaks(L3_data,'MinPeakDistance',100);
            L3_height_mean = mean(L3_pks);
            L3_height_max = max(L3_pks);
            R3_pks = findpeaks(R3_data,'MinPeakDistance',100);
            R3_height_mean = mean(R3_pks);
            R3_height_max = max(R3_pks);
            
            %sensor 4 peak detection
            L4_pks = findpeaks(L4_data,'MinPeakDistance',100);
            L4_height_mean = mean(L4_pks);
            L4_height_max = max(L4_pks);
            R4_pks = findpeaks(R4_data,'MinPeakDistance',100);
            R4_height_mean = mean(R4_pks);
            R4_height_max = max(R4_pks);
            
            %sensor 5 peak detection
            L5_pks = findpeaks(L5_data,'MinPeakDistance',100);
            L5_height_mean = mean(L5_pks);
            L5_height_max = max(L5_pks);
            R5_pks = findpeaks(R5_data,'MinPeakDistance',100);
            R5_height_mean = mean(R5_pks);
            R5_height_max = max(R5_pks);
            
            %sensor 6 peak detection
            L6_pks = findpeaks(L6_data,'MinPeakDistance',100);
            L6_height_mean = mean(L6_pks);
            L6_height_max = max(L6_pks);
            R6_pks = findpeaks(R6_data,'MinPeakDistance',100);
            R6_height_mean = mean(R6_pks);
            R6_height_max = max(R6_pks);
            
            %sensor 7 peak detection
            L7_pks = findpeaks(L7_data,'MinPeakDistance',100);
            L7_height_mean = mean(L7_pks);
            L7_height_max = max(L7_pks);
            R7_pks = findpeaks(R7_data,'MinPeakDistance',100);
            R7_height_mean = mean(R7_pks);
            R7_height_max = max(R7_pks);
            
            %sensor 8 peak detection
            L8_pks = findpeaks(L8_data,'MinPeakDistance',100);
            L8_height_mean = mean(L8_pks);
            L8_height_max = max(L8_pks);
            R8_pks = findpeaks(R8_data,'MinPeakDistance',100);
            R8_height_mean = mean(R8_pks);
            R8_height_max = max(R8_pks);
            
            
            
            %setting max label for RGB colorbar
            A = [L1_height_max R1_height_max L2_height_max R2_height_max L3_height_max R3_height_max L4_height_max R4_height_max L5_height_max R5_height_max L6_height_max R6_height_max L7_height_max R7_height_max L8_height_max R8_height_max];
            B = [Ltotal_height_mean Rtotal_height_mean];
            max_boundery = max(A);
            app.maxLabel.Text = 'max =' + string(max_boundery) + '(N)';
            app.GaugemaxLabel.Text = 'max='+string(max(B))+'(N)';
            
            %finding stride and swing time
            f1=1;
            j=1;
            f2=1;
           
                while(app.time_asking.Value==0)
                  app.ErrorLabel.Visible=1;
                app.ErrorLabel.Text='Enter Number of Executions';    
                end
            app.ErrorLabel.Visible=0;
            for i=1:length(Rtotal)
                if(Rtotal(i)>20 && f1==1 && f2==1)
                    time1(j)=time(i);
                    f1=0;
                    continue;
            end
                if(Rtotal(i)<20 && f1==0 && f2==1)
                    time2(j)=time(i);
                    f2=0;
                    continue;
            end
                if(Rtotal(i)>20 && f2==0 && f1==0)
                    time3(j)=time(i);
                    f1=1;
                    f2=1;
                    stride(j)=time3(j)-time1(j);
                    swing(j)=time3(j)-time2(j);
                    j=j+1;
                    continue;
                end
            end
%             if(app.time_asking.Value==0)
%                 uialert(app.pressuresensorsUIFigure,'Time not');
%             end
               
                
            %this loop is to limit the overshoots in the pressure value
            for i=1 : (app.time_asking.Value)*fs
                 %total 
                if(Ltotal(i)> Ltotal_height_mean)
                    Ltotal(i) = Ltotal_height_mean;
                end
                if(Rtotal(i)> Rtotal_height_mean)
                    Rtotal(i) = Rtotal_height_mean;
                end
                
                %sensor 1 
                if(L1_data(i)> L1_height_mean)
                    L1_data(i) = L1_height_mean;
                end
                if(R1_data(i)> R1_height_mean)
                    R1_data(i) = R1_height_mean;
                end
                
                %sensor 2 
                if(L2_data(i)> L2_height_mean)
                    L2_data(i) = L2_height_mean;
                end
                if(R2_data(i)> R2_height_mean)
                    R2_data(i) = R2_height_mean;
                end
                
                %sensor 3 
                if(L3_data(i)> L3_height_mean)
                    L3_data(i) = L3_height_mean;
                end
                if(R3_data(i)> R3_height_mean)
                    R3_data(i) = R3_height_mean;
                end
                
                %sensor 4 
                if(L4_data(i)> L4_height_mean)
                    L4_data(i) = L4_height_mean;
                end
                if(R4_data(i)> R4_height_mean)
                    R4_data(i) = R4_height_mean;
                end
                
                %sensor 5 
                if(L5_data(i)> L5_height_mean)
                    L5_data(i) = L5_height_mean;
                end
                if(R5_data(i)> R5_height_mean)
                    R5_data(i) = R5_height_mean;
                end
                
                %sensor 6 
                if(L6_data(i)> L6_height_mean)
                    L6_data(i) = L6_height_mean;
                end
                if(R6_data(i)> R6_height_mean)
                    R6_data(i) = R6_height_mean;
                end
                
                %sensor 7 
                if(L7_data(i)> L7_height_mean)
                    L7_data(i) = L7_height_mean;
                end
                if(R7_data(i)> R7_height_mean)
                    R7_data(i) = R7_height_mean;
                end
                
                %sensor 8 
                if(L8_data(i)> L8_height_mean)
                    L8_data(i) = L8_height_mean;
                end
                if(R8_data(i)> R8_height_mean)
                    R8_data(i) = R8_height_mean;
                end
                
                
            end
            
            %stateLamp turns green indicating there was no problem reading
            %and interperating the file
            app.stateLamp.Color = [0 , 1 , 0];
            
            app.Slider.Limits = [0 , (app.time_asking.Value)];
            
            walkingtime=0;
            j=1;
            totalstride=0;
            stride_average=0;
            swing_average=0;
            flag1=0;
            xLcenter = 0;
            yLcenter = 0;
            xRcenter = 0;
            yRcenter = 0;
            
            %main loop for recordring and monitoring changes
            for i = 1:(app.time_asking.Value)*fs
                if(app.StartButton.Value==1)
                     app.StartButton.Text = 'Stop';
                if((totalstride + stride(j)) < walkingtime )
                    flag1=1;
                    totalstride = totalstride + stride(j);
                    j = j + 1;
                end
                
                %next lines are about changing the backcolor of sensors and
                %gauges according to pressure value
                
                %total force(changing the Gauge color)
                app.TotalForceLeftFootGauge.BackgroundColor = [bigger_zero(app,2*(Ltotal(i)-Ltotal_height_mean/2)/Ltotal_height_mean)  ,1-2*abs((Ltotal_height_mean/2-Ltotal(i))/Ltotal_height_mean) , bigger_zero(app,2*(Ltotal_height_mean/2 - Ltotal(i))/Ltotal_height_mean)  ];
                app.TotalForceRightFootGauge.BackgroundColor = [bigger_zero(app,2*(Rtotal(i)-Rtotal_height_mean/2)/Rtotal_height_mean)  ,1-2*abs((Rtotal_height_mean/2-Rtotal(i))/Rtotal_height_mean) , bigger_zero(app,2*(Rtotal_height_mean/2 - Rtotal(i))/Rtotal_height_mean)  ];
                % sensor 1    
                app.L1.BackgroundColor = [bigger_zero(app,2*(L1_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L1_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L1_data(i))/max_boundery)  ];
                app.R1.BackgroundColor = [bigger_zero(app,2*(R1_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R1_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R1_data(i))/max_boundery)  ];
                % sensor 2    
                app.L2.BackgroundColor = [bigger_zero(app,2*(L2_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L2_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L2_data(i))/max_boundery)  ];
                app.R2.BackgroundColor = [bigger_zero(app,2*(R2_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R2_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R2_data(i))/max_boundery)  ];
                % sensor 3    
                app.L3.BackgroundColor = [bigger_zero(app,2*(L3_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L3_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L3_data(i))/max_boundery)  ];
                app.R3.BackgroundColor = [bigger_zero(app,2*(R3_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R3_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R3_data(i))/max_boundery)  ];
                % sensor 4    
                app.L4.BackgroundColor = [bigger_zero(app,2*(L4_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L4_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L4_data(i))/max_boundery)  ];
                app.R4.BackgroundColor = [bigger_zero(app,2*(R4_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R4_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R4_data(i))/max_boundery)  ];
                % sensor 5    
                app.L5.BackgroundColor = [bigger_zero(app,2*(L5_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L5_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L5_data(i))/max_boundery)  ];
                app.R5.BackgroundColor = [bigger_zero(app,2*(R5_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R5_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R5_data(i))/max_boundery)  ];
                % sensor 6    
                app.L6.BackgroundColor = [bigger_zero(app,2*(L6_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L6_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L6_data(i))/max_boundery)  ];
                app.R6.BackgroundColor = [bigger_zero(app,2*(R6_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R6_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R6_data(i))/max_boundery)  ];
                % sensor 7    
                app.L7.BackgroundColor = [bigger_zero(app,2*(L7_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L7_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L7_data(i))/max_boundery)  ];
                app.R7.BackgroundColor = [bigger_zero(app,2*(R7_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R7_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R7_data(i))/max_boundery)  ];
                % sensor 8    
                app.L8.BackgroundColor = [bigger_zero(app,2*(L8_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-L8_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - L8_data(i))/max_boundery)  ];
                app.R8.BackgroundColor = [bigger_zero(app,2*(R8_data(i)-max_boundery/2)/max_boundery)  ,1-2*abs((max_boundery/2-R8_data(i))/max_boundery) , bigger_zero(app,2*(max_boundery/2 - R8_data(i))/max_boundery)  ];
                
                %changing the Gauge value according to total pressure
                app.TotalForceLeftFootGauge.Value = Ltotal(i)/Ltotal_height_mean*100 ;
                app.TotalForceRightFootGauge.Value = Rtotal(i)/Rtotal_height_mean*100 ;
                
                %monitoring walking time
                app.walkingtimeLabel.Text = 'walking time: ' + string(walkingtime);
                app.Slider.Value = walkingtime;
                if(j>1)
                    
                    
                    %monitoring walking properties
                    app.LastStrideTimeLabel.Text = 'Last Stride Time: '+ string(stride(j-1));
                    app.LastSwingTimeLabel.Text =  'Last Swing Time: ' + string(swing(j-1));
                    app.SwingtoStrideratioLabel.Text = 'Swing to Stride Ratio: ' + string(swing(j-1)/stride(j-1));
                    app.StrideNumberLabel.Text = 'Stride Number: ' + string(j-1);
                end
                
                %calculating and monitoring swing and stride time average(ignoring the first stride and swing becuase it is not reliable)
                if(j>2)
                    if(flag1==1)
                        stride_average = (stride(j-1) + stride_average*(j-3))/(j-2);
                        swing_average = (swing(j-1) + swing_average*(j-3))/(j-2);
                        flag1=0;
                    end
                    app.AverageSwingtoStrideratioLabel.Text = 'Average Swing to Stride Ratio: ' + string(swing_average/stride_average);
                    app.AverageStrideTimeLabel.Text = 'Average Stride Time: ' + string(stride_average);
                    app.AverageSwingTimeLabel.Text = 'Average Swing Time: ' + string(swing_average);  
                end
                
                
               
                
                %pause for 0.01 seconds to have a real time monitoring
                pause(0.01);
                walkingtime = walkingtime + 0.01;
                
                %calculating and monitoring the center of pressure
                if(Rtotal(i)>0 )
                    xRcenter = (app.R1.Position(1)*R1_data(i)+app.R2.Position(1)*R2_data(i)+app.R3.Position(1)*R3_data(i)+app.R4.Position(1)*R4_data(i)+app.R5.Position(1)*R5_data(i)+app.R6.Position(1)*R6_data(i)+app.R7.Position(1)*R7_data(i)+app.R8.Position(1)*R8_data(i))/(R1_data(i)+R2_data(i)+R3_data(i)+R4_data(i)+R5_data(i)+R6_data(i)+R7_data(i)+R8_data(i));
                    yRcenter = (app.R1.Position(2)*R1_data(i)+app.R2.Position(2)*R2_data(i)+app.R3.Position(2)*R3_data(i)+app.R4.Position(2)*R4_data(i)+app.R5.Position(2)*R5_data(i)+app.R6.Position(2)*R6_data(i)+app.R7.Position(2)*R7_data(i)+app.R8.Position(2)*R8_data(i))/(R1_data(i)+R2_data(i)+R3_data(i)+R4_data(i)+R5_data(i)+R6_data(i)+R7_data(i)+R8_data(i));
                end
                if( Ltotal(i)>0)
                    xLcenter = (app.L1.Position(1)*L1_data(i)+app.L2.Position(1)*L2_data(i)+app.L3.Position(1)*L3_data(i)+app.L4.Position(1)*L4_data(i)+app.L5.Position(1)*L5_data(i)+app.L6.Position(1)*L6_data(i)+app.L7.Position(1)*L7_data(i)+app.L8.Position(1)*L8_data(i))/(L1_data(i)+L2_data(i)+L3_data(i)+L4_data(i)+L5_data(i)+L6_data(i)+L7_data(i)+L8_data(i));
                    yLcenter = (app.L1.Position(2)*L1_data(i)+app.L2.Position(2)*L2_data(i)+app.L3.Position(2)*L3_data(i)+app.L4.Position(2)*L4_data(i)+app.L5.Position(2)*L5_data(i)+app.L6.Position(2)*L6_data(i)+app.L7.Position(2)*L7_data(i)+app.L8.Position(2)*L8_data(i))/(L1_data(i)+L2_data(i)+L3_data(i)+L4_data(i)+L5_data(i)+L6_data(i)+L7_data(i)+L8_data(i));
                end
                
                app.Lcenter.Position = [(xLcenter+3) (yLcenter+6) 10 10];
                app.Rcenter.Position = [(xRcenter+3) (yRcenter+6) 10 10];
                
                %applying the changes to the GUI interface
                drawnow
                
                
                %pause button
                if(app.PauseButton.Value==1)
                    waitfor(app.PauseButton,'Value',0);
                end
                elseif(app.StartButton.Value==0)
                    app.StartButton.Text = 'Start';
                break;        
                end
        end
        end

        % Value changed function: filename
        function filenameValueChanged(app, event)
            value = app.filename.Value;
            
        end

        % Value changed function: PauseButton
        function PauseButtonValueChanged(app, event)
            Pausevalue = app.PauseButton.Value;
            if(Pausevalue==1)
            app.PauseButton.Text = 'Resume';
            else
            app.PauseButton.Text = 'Pause';
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create pressuresensorsUIFigure and hide until all components are created
            app.pressuresensorsUIFigure = uifigure('Visible', 'off');
            app.pressuresensorsUIFigure.AutoResizeChildren = 'off';
            app.pressuresensorsUIFigure.Color = [1 1 1];
            app.pressuresensorsUIFigure.Position = [100 100 1200 600];
            app.pressuresensorsUIFigure.Name = 'pressure sensors';
            app.pressuresensorsUIFigure.Resize = 'off';
            app.pressuresensorsUIFigure.Scrollable = 'on';

            % Create Lfoot
            app.Lfoot = uiimage(app.pressuresensorsUIFigure);
            app.Lfoot.Position = [774 118 145 355];
            app.Lfoot.ImageSource = 'Lfoot.jpg';

            % Create Rfoot
            app.Rfoot = uiimage(app.pressuresensorsUIFigure);
            app.Rfoot.Position = [927 118 139 355];
            app.Rfoot.ImageSource = 'Rfoot.jpg';

            % Create L7
            app.L7 = uilabel(app.pressuresensorsUIFigure);
            app.L7.Position = [868 324 17 22];
            app.L7.Text = 'L7';

            % Create L8
            app.L8 = uilabel(app.pressuresensorsUIFigure);
            app.L8.Position = [838 384 17 22];
            app.L8.Text = 'L8';

            % Create L6
            app.L6 = uilabel(app.pressuresensorsUIFigure);
            app.L6.Position = [808 324 17 22];
            app.L6.Text = 'L6';

            % Create L5
            app.L5 = uilabel(app.pressuresensorsUIFigure);
            app.L5.Position = [868 264 17 22];
            app.L5.Text = 'L5';

            % Create L2
            app.L2 = uilabel(app.pressuresensorsUIFigure);
            app.L2.Position = [808 204 17 22];
            app.L2.Text = 'L2';

            % Create L4
            app.L4 = uilabel(app.pressuresensorsUIFigure);
            app.L4.Position = [808 264 17 22];
            app.L4.Text = 'L4';

            % Create L3
            app.L3 = uilabel(app.pressuresensorsUIFigure);
            app.L3.Position = [868 204 17 22];
            app.L3.Text = 'L3';

            % Create L1
            app.L1 = uilabel(app.pressuresensorsUIFigure);
            app.L1.Position = [838 144 17 22];
            app.L1.Text = 'L1';

            % Create R8
            app.R8 = uilabel(app.pressuresensorsUIFigure);
            app.R8.Position = [986 384 17 22];
            app.R8.Text = 'R8';

            % Create R6
            app.R6 = uilabel(app.pressuresensorsUIFigure);
            app.R6.Position = [1018 324 17 22];
            app.R6.Text = 'R6';

            % Create R7
            app.R7 = uilabel(app.pressuresensorsUIFigure);
            app.R7.Position = [958 324 17 22];
            app.R7.Text = 'R7';

            % Create R4
            app.R4 = uilabel(app.pressuresensorsUIFigure);
            app.R4.Position = [1018 264 17 22];
            app.R4.Text = 'R4';

            % Create R5
            app.R5 = uilabel(app.pressuresensorsUIFigure);
            app.R5.Position = [958 264 17 22];
            app.R5.Text = 'R5';

            % Create R3
            app.R3 = uilabel(app.pressuresensorsUIFigure);
            app.R3.Position = [958 204 17 22];
            app.R3.Text = 'R3';

            % Create R2
            app.R2 = uilabel(app.pressuresensorsUIFigure);
            app.R2.Position = [1018 204 17 22];
            app.R2.Text = 'R2';

            % Create R1
            app.R1 = uilabel(app.pressuresensorsUIFigure);
            app.R1.Position = [986 144 17 22];
            app.R1.Text = 'R1';

            % Create StartButton
            app.StartButton = uibutton(app.pressuresensorsUIFigure, 'state');
            app.StartButton.ValueChangedFcn = createCallbackFcn(app, @StartButtonValueChanged, true);
            app.StartButton.Text = 'Start';
            app.StartButton.Position = [540 462 100 22];

            % Create enterfilenameTextAreaLabel_2
            app.enterfilenameTextAreaLabel_2 = uilabel(app.pressuresensorsUIFigure);
            app.enterfilenameTextAreaLabel_2.HorizontalAlignment = 'right';
            app.enterfilenameTextAreaLabel_2.Position = [321 435 87 22];
            app.enterfilenameTextAreaLabel_2.Text = 'and press Start';

            % Create enterthetimeEditFieldLabel_2
            app.enterthetimeEditFieldLabel_2 = uilabel(app.pressuresensorsUIFigure);
            app.enterthetimeEditFieldLabel_2.HorizontalAlignment = 'right';
            app.enterthetimeEditFieldLabel_2.Position = [106 435 84 22];
            app.enterthetimeEditFieldLabel_2.Text = 'of execution(s)';

            % Create stateLamp
            app.stateLamp = uilamp(app.pressuresensorsUIFigure);
            app.stateLamp.Position = [365 401 20 20];
            app.stateLamp.Color = [1 0 0];

            % Create walkingtimeLabel
            app.walkingtimeLabel = uilabel(app.pressuresensorsUIFigure);
            app.walkingtimeLabel.FontSize = 15;
            app.walkingtimeLabel.Position = [251 547 133 32];
            app.walkingtimeLabel.Text = 'walking time: ';

            % Create LastStrideTimeLabel
            app.LastStrideTimeLabel = uilabel(app.pressuresensorsUIFigure);
            app.LastStrideTimeLabel.FontSize = 15;
            app.LastStrideTimeLabel.Position = [79 324 199 22];
            app.LastStrideTimeLabel.Text = 'Last Stride Time: ';

            % Create LastSwingTimeLabel
            app.LastSwingTimeLabel = uilabel(app.pressuresensorsUIFigure);
            app.LastSwingTimeLabel.FontSize = 15;
            app.LastSwingTimeLabel.Position = [77 285 201 22];
            app.LastSwingTimeLabel.Text = 'Last Swing Time: ';

            % Create TotalForceLeftFootGauge
            app.TotalForceLeftFootGauge = uigauge(app.pressuresensorsUIFigure, 'circular');
            app.TotalForceLeftFootGauge.Position = [146 65 120 120];

            % Create TotalForceRightFootGauge
            app.TotalForceRightFootGauge = uigauge(app.pressuresensorsUIFigure, 'circular');
            app.TotalForceRightFootGauge.Position = [365 65 120 120];

            % Create greenfileuplodedcorrectlyLabel
            app.greenfileuplodedcorrectlyLabel = uilabel(app.pressuresensorsUIFigure);
            app.greenfileuplodedcorrectlyLabel.FontSize = 10;
            app.greenfileuplodedcorrectlyLabel.Position = [395 405 128 22];
            app.greenfileuplodedcorrectlyLabel.Text = 'green: file uploded correctly';

            % Create redfileisnotuploadedyetLabel
            app.redfileisnotuploadedyetLabel = uilabel(app.pressuresensorsUIFigure);
            app.redfileisnotuploadedyetLabel.FontSize = 10;
            app.redfileisnotuploadedyetLabel.Position = [395 384 125 22];
            app.redfileisnotuploadedyetLabel.Text = 'red: file is not uploaded yet';

            % Create SwingtoStrideratioLabel
            app.SwingtoStrideratioLabel = uilabel(app.pressuresensorsUIFigure);
            app.SwingtoStrideratioLabel.FontSize = 15;
            app.SwingtoStrideratioLabel.Position = [77 248 237 22];
            app.SwingtoStrideratioLabel.Text = 'Swing to Stride ratio: ';

            % Create AverageStrideTimeLabel
            app.AverageStrideTimeLabel = uilabel(app.pressuresensorsUIFigure);
            app.AverageStrideTimeLabel.FontSize = 15;
            app.AverageStrideTimeLabel.Position = [339 322 202 22];
            app.AverageStrideTimeLabel.Text = 'Average Stride Time: ';

            % Create AverageSwingTimeLabel
            app.AverageSwingTimeLabel = uilabel(app.pressuresensorsUIFigure);
            app.AverageSwingTimeLabel.FontSize = 15;
            app.AverageSwingTimeLabel.Position = [337 285 214 22];
            app.AverageSwingTimeLabel.Text = 'Average Swing Time:  ';

            % Create StrideNumberLabel
            app.StrideNumberLabel = uilabel(app.pressuresensorsUIFigure);
            app.StrideNumberLabel.FontSize = 15;
            app.StrideNumberLabel.Position = [337 248 193 22];
            app.StrideNumberLabel.Text = 'Stride Number: ';

            % Create AverageSwingtoStrideratioLabel
            app.AverageSwingtoStrideratioLabel = uilabel(app.pressuresensorsUIFigure);
            app.AverageSwingtoStrideratioLabel.FontSize = 15;
            app.AverageSwingtoStrideratioLabel.Position = [76 204 309 22];
            app.AverageSwingtoStrideratioLabel.Text = 'Average Swing to Stride ratio: ';

            % Create TotalForceLeftFootLabel
            app.TotalForceLeftFootLabel = uilabel(app.pressuresensorsUIFigure);
            app.TotalForceLeftFootLabel.Position = [150 28 116 22];
            app.TotalForceLeftFootLabel.Text = 'Total Force Left Foot';

            % Create TotalForceRightFootLabel
            app.TotalForceRightFootLabel = uilabel(app.pressuresensorsUIFigure);
            app.TotalForceRightFootLabel.Position = [364 28 124 22];
            app.TotalForceRightFootLabel.Text = 'Total Force Right Foot';

            % Create Lcenter
            app.Lcenter = uilamp(app.pressuresensorsUIFigure);
            app.Lcenter.Position = [841 268 10 10];
            app.Lcenter.Color = [0 0 0];

            % Create Rcenter
            app.Rcenter = uilamp(app.pressuresensorsUIFigure);
            app.Rcenter.Position = [992 269 10 10];
            app.Rcenter.Color = [0 0 0];

            % Create Image
            app.Image = uiimage(app.pressuresensorsUIFigure);
            app.Image.Position = [1147 135 31 302];
            app.Image.ImageSource = 'colorbar3.jpg';

            % Create min0NLabel
            app.min0NLabel = uilabel(app.pressuresensorsUIFigure);
            app.min0NLabel.Position = [1129 114 55 22];
            app.min0NLabel.Text = 'min=0(N)';

            % Create maxLabel
            app.maxLabel = uilabel(app.pressuresensorsUIFigure);
            app.maxLabel.Position = [1101 441 91 22];
            app.maxLabel.Text = 'max=';

            % Create Image_2
            app.Image_2 = uiimage(app.pressuresensorsUIFigure);
            app.Image_2.Position = [540 28 22 177];
            app.Image_2.ImageSource = 'colorbar3.jpg';

            % Create min0NLabel_2
            app.min0NLabel_2 = uilabel(app.pressuresensorsUIFigure);
            app.min0NLabel_2.Position = [514 5 62 22];
            app.min0NLabel_2.Text = 'min = 0(N)';

            % Create GaugemaxLabel
            app.GaugemaxLabel = uilabel(app.pressuresensorsUIFigure);
            app.GaugemaxLabel.Position = [471 204 117 22];
            app.GaugemaxLabel.Text = 'max=';

            % Create enterfilenameTextAreaLabel
            app.enterfilenameTextAreaLabel = uilabel(app.pressuresensorsUIFigure);
            app.enterfilenameTextAreaLabel.HorizontalAlignment = 'right';
            app.enterfilenameTextAreaLabel.Position = [321 458 86 20];
            app.enterfilenameTextAreaLabel.Text = 'enter file name';

            % Create filename
            app.filename = uitextarea(app.pressuresensorsUIFigure);
            app.filename.ValueChangedFcn = createCallbackFcn(app, @filenameValueChanged, true);
            app.filename.Position = [421 441 75 38];

            % Create SliderLabel
            app.SliderLabel = uilabel(app.pressuresensorsUIFigure);
            app.SliderLabel.HorizontalAlignment = 'right';
            app.SliderLabel.Position = [71 517 36 22];
            app.SliderLabel.Text = 'Slider';

            % Create Slider
            app.Slider = uislider(app.pressuresensorsUIFigure);
            app.Slider.Position = [128 526 402 3];

            % Create enterthetimeEditFieldLabel_3
            app.enterthetimeEditFieldLabel_3 = uilabel(app.pressuresensorsUIFigure);
            app.enterthetimeEditFieldLabel_3.HorizontalAlignment = 'right';
            app.enterthetimeEditFieldLabel_3.Position = [106 456 79 22];
            app.enterthetimeEditFieldLabel_3.Text = 'enter the time';

            % Create time_asking
            app.time_asking = uieditfield(app.pressuresensorsUIFigure, 'numeric');
            app.time_asking.Position = [203 435 75 43];

            % Create Label
            app.Label = uilabel(app.pressuresensorsUIFigure);
            app.Label.BackgroundColor = [0.149 0.149 0.149];
            app.Label.Position = [815 80 1 429];

            % Create Label_2
            app.Label_2 = uilabel(app.pressuresensorsUIFigure);
            app.Label_2.BackgroundColor = [0.149 0.149 0.149];
            app.Label_2.Position = [875 80 1 430];

            % Create Label_3
            app.Label_3 = uilabel(app.pressuresensorsUIFigure);
            app.Label_3.BackgroundColor = [0.149 0.149 0.149];
            app.Label_3.Position = [965 80 1 429];

            % Create Label_4
            app.Label_4 = uilabel(app.pressuresensorsUIFigure);
            app.Label_4.BackgroundColor = [0.149 0.149 0.149];
            app.Label_4.Position = [1025 80 1 428];

            % Create Label_5
            app.Label_5 = uilabel(app.pressuresensorsUIFigure);
            app.Label_5.BackgroundColor = [0.149 0.149 0.149];
            app.Label_5.Position = [845 80 1 431];

            % Create Label_6
            app.Label_6 = uilabel(app.pressuresensorsUIFigure);
            app.Label_6.BackgroundColor = [0.149 0.149 0.149];
            app.Label_6.Position = [995 80 1 427];

            % Create Label_7
            app.Label_7 = uilabel(app.pressuresensorsUIFigure);
            app.Label_7.BackgroundColor = [0.149 0.149 0.149];
            app.Label_7.Position = [921 81 1 429];

            % Create Label_8
            app.Label_8 = uilabel(app.pressuresensorsUIFigure);
            app.Label_8.HorizontalAlignment = 'center';
            app.Label_8.FontSize = 10;
            app.Label_8.Position = [797 49 26 22];
            app.Label_8.Text = '-700';

            % Create Label_9
            app.Label_9 = uilabel(app.pressuresensorsUIFigure);
            app.Label_9.HorizontalAlignment = 'center';
            app.Label_9.FontSize = 10;
            app.Label_9.Position = [834 49 26 22];
            app.Label_9.Text = '-500';

            % Create Label_10
            app.Label_10 = uilabel(app.pressuresensorsUIFigure);
            app.Label_10.HorizontalAlignment = 'center';
            app.Label_10.FontSize = 10;
            app.Label_10.Position = [863 49 26 22];
            app.Label_10.Text = '-300';

            % Create Label_11
            app.Label_11 = uilabel(app.pressuresensorsUIFigure);
            app.Label_11.HorizontalAlignment = 'center';
            app.Label_11.FontSize = 10;
            app.Label_11.Position = [909.5 49 25 22];
            app.Label_11.Text = '0';

            % Create Label_12
            app.Label_12 = uilabel(app.pressuresensorsUIFigure);
            app.Label_12.HorizontalAlignment = 'center';
            app.Label_12.FontSize = 10;
            app.Label_12.Position = [953.5 49 25 22];
            app.Label_12.Text = '300';

            % Create Label_13
            app.Label_13 = uilabel(app.pressuresensorsUIFigure);
            app.Label_13.HorizontalAlignment = 'center';
            app.Label_13.FontSize = 10;
            app.Label_13.Position = [984.5 49 25 22];
            app.Label_13.Text = '500';

            % Create Label_14
            app.Label_14 = uilabel(app.pressuresensorsUIFigure);
            app.Label_14.HorizontalAlignment = 'center';
            app.Label_14.FontSize = 10;
            app.Label_14.Position = [1013.5 49 25 22];
            app.Label_14.Text = '700';

            % Create Label_15
            app.Label_15 = uilabel(app.pressuresensorsUIFigure);
            app.Label_15.BackgroundColor = [0 0 0];
            app.Label_15.FontName = 'Bodoni MT Poster Compressed';
            app.Label_15.Position = [734 152 378 6];

            % Create Label_16
            app.Label_16 = uilabel(app.pressuresensorsUIFigure);
            app.Label_16.BackgroundColor = [0 0 0];
            app.Label_16.FontName = 'Bodoni MT Poster Compressed';
            app.Label_16.Position = [733 212 378 6];

            % Create Label_17
            app.Label_17 = uilabel(app.pressuresensorsUIFigure);
            app.Label_17.BackgroundColor = [0 0 0];
            app.Label_17.FontName = 'Bodoni MT Poster Compressed';
            app.Label_17.Position = [733 392 378 6];

            % Create Label_18
            app.Label_18 = uilabel(app.pressuresensorsUIFigure);
            app.Label_18.BackgroundColor = [0 0 0];
            app.Label_18.FontName = 'Bodoni MT Poster Compressed';
            app.Label_18.Position = [734 332 378 6];

            % Create Label_19
            app.Label_19 = uilabel(app.pressuresensorsUIFigure);
            app.Label_19.BackgroundColor = [0 0 0];
            app.Label_19.FontName = 'Bodoni MT Poster Compressed';
            app.Label_19.Position = [734 272 378 6];

            % Create Label_20
            app.Label_20 = uilabel(app.pressuresensorsUIFigure);
            app.Label_20.HorizontalAlignment = 'center';
            app.Label_20.FontSize = 10;
            app.Label_20.Position = [690 384 25 22];
            app.Label_20.Text = '800';

            % Create Label_21
            app.Label_21 = uilabel(app.pressuresensorsUIFigure);
            app.Label_21.HorizontalAlignment = 'center';
            app.Label_21.FontSize = 10;
            app.Label_21.Position = [690 324 25 22];
            app.Label_21.Text = '400';

            % Create Label_22
            app.Label_22 = uilabel(app.pressuresensorsUIFigure);
            app.Label_22.HorizontalAlignment = 'center';
            app.Label_22.FontSize = 10;
            app.Label_22.Position = [690 264 25 22];
            app.Label_22.Text = '0';

            % Create Label_23
            app.Label_23 = uilabel(app.pressuresensorsUIFigure);
            app.Label_23.HorizontalAlignment = 'center';
            app.Label_23.FontSize = 10;
            app.Label_23.Position = [690 204 26 22];
            app.Label_23.Text = '-400';

            % Create Label_24
            app.Label_24 = uilabel(app.pressuresensorsUIFigure);
            app.Label_24.HorizontalAlignment = 'center';
            app.Label_24.FontSize = 10;
            app.Label_24.Position = [690 144 26 22];
            app.Label_24.Text = '-800';

            % Create PauseButton
            app.PauseButton = uibutton(app.pressuresensorsUIFigure, 'state');
            app.PauseButton.ValueChangedFcn = createCallbackFcn(app, @PauseButtonValueChanged, true);
            app.PauseButton.Text = 'Pause';
            app.PauseButton.Position = [540 435 100 22];

            % Create ErrorLabel
            app.ErrorLabel = uilabel(app.pressuresensorsUIFigure);
            app.ErrorLabel.FontSize = 13;
            app.ErrorLabel.FontWeight = 'bold';
            app.ErrorLabel.FontColor = [1 0 0];
            app.ErrorLabel.Visible = 'off';
            app.ErrorLabel.Position = [79 397 259 22];
            app.ErrorLabel.Text = 'Error:';

            % Show the figure after all components are created
            app.pressuresensorsUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = prj1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.pressuresensorsUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.pressuresensorsUIFigure)
        end
    end
end