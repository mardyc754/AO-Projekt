classdef gui < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        WykrywanietekstuUIFigure  matlab.ui.Figure
        GridLayout                matlab.ui.container.GridLayout
        WynikTextArea             matlab.ui.control.TextArea
        WynikTextAreaLabel        matlab.ui.control.Label
        KopiujButton              matlab.ui.control.Button
        WykryjtekstButton         matlab.ui.control.Button
        Image                     matlab.ui.control.Image
        ZapiszButton              matlab.ui.control.Button
        WczytajobrazButton        matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: WczytajobrazButton
        function LoadImageButtonPushed(app, event)
            [file,path] = uigetfile({'*.jpg; *.jpeg; *.png', 'Obraz (*.jpg, *.jpeg, *.png)'; ...
                                        '*.*', 'Wszytkie pliki (*.*)'}, ...
                                        'Wybierz obraz');
            if(file)
                app.Image.ImageSource = fullfile(path, file);
                app.WykryjtekstButton.Enable = true;
            end
        end

        % Button pushed function: WykryjtekstButton
        function WykryjtekstButtonPushed(app, event)
            
            text = im2text(app.Image.ImageSource);
            app.ZapiszButton.Enable = true;
            app.KopiujButton.Enable = true;
            app.WynikTextArea.Value = text;
        end

        % Button pushed function: KopiujButton
        function KopiujButtonPushed(app, event)
            if(app.WynikTextArea.Value ~= "")
                clipboard('copy', string(app.WynikTextArea.Value))
            end
        end

        % Button pushed function: ZapiszButton
        function ZapiszButtonPushed(app, event)
            [filename, path] = uiputfile({'*.txt', 'Plik tekstowy (*.txt)'; ...
                                        '*.*', 'Wszystkie pliki (*.*)'}, 'Zapisz wynik', 'result.txt');
            if(filename)
                file = fopen(fullfile(path, filename), 'w');
                fprintf(file, "%s", string(app.WynikTextArea.Value));
                fclose(file);
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create WykrywanietekstuUIFigure and hide until all components are created
            app.WykrywanietekstuUIFigure = uifigure('Visible', 'off');
            app.WykrywanietekstuUIFigure.Position = [100 100 776 564];
            app.WykrywanietekstuUIFigure.Name = 'Wykrywanie tekstu';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.WykrywanietekstuUIFigure);
            app.GridLayout.ColumnWidth = {'1x', '5x', '3x', '5x', '1x'};
            app.GridLayout.RowHeight = {'1x', '7x', '0.5x', '1x', '1x', '0.7x', '0.7x', '0.5x'};

            % Create WczytajobrazButton
            app.WczytajobrazButton = uibutton(app.GridLayout, 'push');
            app.WczytajobrazButton.ButtonPushedFcn = createCallbackFcn(app, @LoadImageButtonPushed, true);
            app.WczytajobrazButton.Layout.Row = 4;
            app.WczytajobrazButton.Layout.Column = 2;
            app.WczytajobrazButton.Text = 'Wczytaj obraz';

            % Create ZapiszButton
            app.ZapiszButton = uibutton(app.GridLayout, 'push');
            app.ZapiszButton.ButtonPushedFcn = createCallbackFcn(app, @ZapiszButtonPushed, true);
            app.ZapiszButton.Enable = 'off';
            app.ZapiszButton.Layout.Row = 7;
            app.ZapiszButton.Layout.Column = 4;
            app.ZapiszButton.Text = 'Zapisz';

            % Create Image
            app.Image = uiimage(app.GridLayout);
            app.Image.Layout.Row = 2;
            app.Image.Layout.Column = [2 4];

            % Create WykryjtekstButton
            app.WykryjtekstButton = uibutton(app.GridLayout, 'push');
            app.WykryjtekstButton.ButtonPushedFcn = createCallbackFcn(app, @WykryjtekstButtonPushed, true);
            app.WykryjtekstButton.Enable = 'off';
            app.WykryjtekstButton.Layout.Row = 4;
            app.WykryjtekstButton.Layout.Column = 4;
            app.WykryjtekstButton.Text = 'Wykryj tekst';

            % Create KopiujButton
            app.KopiujButton = uibutton(app.GridLayout, 'push');
            app.KopiujButton.ButtonPushedFcn = createCallbackFcn(app, @KopiujButtonPushed, true);
            app.KopiujButton.Enable = 'off';
            app.KopiujButton.Layout.Row = 6;
            app.KopiujButton.Layout.Column = 4;
            app.KopiujButton.Text = 'Kopiuj';

            % Create WynikTextAreaLabel
            app.WynikTextAreaLabel = uilabel(app.GridLayout);
            app.WynikTextAreaLabel.HorizontalAlignment = 'right';
            app.WynikTextAreaLabel.Layout.Row = 6;
            app.WynikTextAreaLabel.Layout.Column = 1;
            app.WynikTextAreaLabel.Text = 'Wynik';

            % Create WynikTextArea
            app.WynikTextArea = uitextarea(app.GridLayout);
            app.WynikTextArea.Editable = 'off';
            app.WynikTextArea.Layout.Row = [6 7];
            app.WynikTextArea.Layout.Column = [2 3];

            % Show the figure after all components are created
            app.WykrywanietekstuUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = gui

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.WykrywanietekstuUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.WykrywanietekstuUIFigure)
        end
    end
end