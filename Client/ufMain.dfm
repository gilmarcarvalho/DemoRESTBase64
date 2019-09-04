object fMain: TfMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Main'
  ClientHeight = 565
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 36
    Width = 100
    Height = 13
    Margins.Top = 6
    Margins.Bottom = 6
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'URL Base:'
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 723
    Height = 25
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Webservice REST/JSON com imgem em base64 - Gilmar Carvalho'
    Color = 16761220
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ExplicitWidth = 670
  end
  object Edit1: TEdit
    AlignWithMargins = True
    Left = 109
    Top = 33
    Width = 511
    Height = 21
    Margins.Top = 8
    Margins.Bottom = 8
    ReadOnly = True
    TabOrder = 0
    Text = 'http://localhost:8080/datasnap/rest'
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 96
    Width = 717
    Height = 466
    ActivePage = TabSheet2
    Align = alBottom
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = 'Fotos'
      ImageIndex = 1
      ExplicitHeight = 460
      object DBGrid3: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 447
        Height = 391
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Imagem'
            Width = 90
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 709
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Button2: TButton
          Left = 3
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Processar'
          TabOrder = 0
          OnClick = Button2Click
        end
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 456
        Top = 44
        Width = 250
        Height = 391
        Align = alRight
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 2
        ExplicitHeight = 413
        object Label2: TLabel
          Left = 0
          Top = 197
          Width = 250
          Height = 24
          Align = alTop
          AutoSize = False
          Caption = 'Imagem em base64:'
          Layout = tlBottom
          ExplicitTop = 185
          ExplicitWidth = 185
        end
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 250
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = 'Imagem:'
          ExplicitTop = -7
          ExplicitWidth = 185
        end
        object RichEdit1: TRichEdit
          Left = 0
          Top = 221
          Width = 250
          Height = 170
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          Zoom = 100
          ExplicitHeight = 192
        end
        object Panel3: TPanel
          Left = 0
          Top = 20
          Width = 250
          Height = 177
          Align = alTop
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 1
          object Image1: TImage
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 240
            Height = 167
            Align = alClient
            Center = True
            Proportional = True
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 185
            ExplicitHeight = 165
          end
        end
      end
    end
  end
  object FDMemTable1: TFDMemTable
    AfterScroll = FDMemTable1AfterScroll
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 588
    Top = 228
    object FDMemTable1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object FDMemTable1Nome: TStringField
      FieldName = 'Nome'
      Size = 255
    end
    object FDMemTable1Imagem: TBlobField
      FieldName = 'Imagem'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 588
    Top = 288
  end
end
