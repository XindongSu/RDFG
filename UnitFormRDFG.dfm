object FormRDFG: TFormRDFG
  Left = 588
  Height = 614
  Top = 149
  Width = 424
  Caption = '固定或随机内容文件生成器'
  ClientHeight = 614
  ClientWidth = 424
  Color = clBtnFace
  Font.CharSet = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = '宋体'
  OnShow = FormShow
  LCLVersion = '2.0.6.0'
  object Label4: TLabel
    Left = 0
    Height = 16
    Top = 598
    Width = 424
    Align = alBottom
    Anchors = [akLeft, akBottom]
    Caption = 'RDFG V.2020 By SXD.'
    ParentColor = False
  end
  object PageControl1: TPageControl
    Left = 0
    Height = 598
    Top = 0
    Width = 424
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '数据文件生成'
      ClientHeight = 568
      ClientWidth = 416
      object Label1: TLabel
        Left = 4
        Height = 16
        Top = 8
        Width = 96
        Caption = '生成文件大小'
        ParentColor = False
      end
      object Label2: TLabel
        Left = 4
        Height = 16
        Top = 336
        Width = 96
        Caption = '文件名(前缀)'
        ParentColor = False
      end
      object Label5: TLabel
        Left = 320
        Height = 16
        Top = 8
        Width = 32
        Caption = '字节'
        ParentColor = False
      end
      object Label6: TLabel
        Left = 36
        Height = 16
        Top = 364
        Width = 64
        Caption = '文件数量'
        ParentColor = False
      end
      object Label7: TLabel
        Left = 36
        Height = 16
        Top = 392
        Width = 64
        Caption = '输出位置'
        ParentColor = False
      end
      object Label3: TLabel
        Left = 0
        Height = 16
        Top = 208
        Width = 96
        Caption = '生成文件内容'
        ParentColor = False
      end
      object Label8: TLabel
        Left = 16
        Height = 16
        Top = 280
        Width = 80
        Caption = '自定义内容'
        ParentColor = False
      end
      object Label9: TLabel
        Left = 104
        Height = 16
        Top = 308
        Width = 269
        AutoSize = False
        Font.CharSet = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = '宋体'
        ParentColor = False
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 104
        Height = 24
        Top = 4
        Width = 213
        TabOrder = 0
        Text = '0'
      end
      object RadioGroup1: TRadioGroup
        Left = 104
        Height = 165
        Top = 32
        Width = 117
        AutoFill = True
        Caption = '数据长度'
        ChildSizing.LeftRightSpacing = 6
        ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
        ChildSizing.EnlargeVertical = crsHomogenousChildResize
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 2
        ClientHeight = 144
        ClientWidth = 113
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '1'
          '2'
          '4'
          '8'
          '16'
          '32'
          '64'
          '128'
          '256'
          '512'
          '1024'
          '2048'
        )
        OnClick = RadioGroup1Click
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 104
        Height = 24
        Top = 332
        Width = 269
        TabOrder = 2
      end
      object Button1: TButton
        Left = 332
        Height = 25
        Top = 388
        Width = 41
        Caption = '浏览'
        OnClick = Button1Click
        TabOrder = 3
      end
      object Button2: TButton
        Left = 0
        Height = 44
        Top = 480
        Width = 416
        Align = alBottom
        Caption = '生成'
        OnClick = Button2Click
        TabOrder = 4
      end
      object Button3: TButton
        Left = 0
        Height = 44
        Top = 524
        Width = 416
        Align = alBottom
        Caption = '中断'
        OnClick = Button3Click
        TabOrder = 5
      end
      object RadioGroup2: TRadioGroup
        Left = 224
        Height = 165
        Top = 32
        Width = 93
        AutoFill = True
        Caption = '数据单位'
        ChildSizing.LeftRightSpacing = 6
        ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
        ChildSizing.EnlargeVertical = crsHomogenousChildResize
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 1
        ClientHeight = 144
        ClientWidth = 89
        ItemIndex = 2
        Items.Strings = (
          'Byte'
          'KiB'
          'MiB'
        )
        OnClick = RadioGroup1Click
        TabOrder = 6
      end
      object Edit3: TEdit
        Left = 104
        Height = 24
        Top = 360
        Width = 269
        TabOrder = 7
        Text = '1'
      end
      object Edit4: TEdit
        Left = 104
        Height = 24
        Top = 388
        Width = 225
        TabOrder = 8
      end
      object RadioGroup3: TRadioGroup
        Left = 104
        Height = 69
        Top = 200
        Width = 269
        AutoFill = True
        Caption = '文件内容'
        ChildSizing.LeftRightSpacing = 6
        ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
        ChildSizing.EnlargeVertical = crsHomogenousChildResize
        ChildSizing.ShrinkHorizontal = crsScaleChilds
        ChildSizing.ShrinkVertical = crsScaleChilds
        ChildSizing.Layout = cclLeftToRightThenTopToBottom
        ChildSizing.ControlsPerLine = 3
        ClientHeight = 48
        ClientWidth = 265
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          '随机'
          '$00'
          '$FF'
          '$AA'
          '$55'
          '自定义'
        )
        OnClick = RadioGroup3Click
        TabOrder = 9
      end
      object Edit5: TEdit
        Left = 104
        Height = 24
        Hint = '输入不包含前后缀的2位16进制数'
        Top = 276
        Width = 269
        Enabled = False
        OnChange = Edit5Change
        TabOrder = 10
      end
      object ProgressBar1: TProgressBar
        Left = 0
        Height = 28
        Top = 452
        Width = 416
        Align = alBottom
        Smooth = True
        TabOrder = 11
      end
      object ProgressBar2: TProgressBar
        Left = 0
        Height = 28
        Top = 424
        Width = 416
        Align = alBottom
        Smooth = True
        TabOrder = 12
      end
    end
    object TabSheet2: TTabSheet
      Caption = '使用说明'
      ClientHeight = 568
      ClientWidth = 416
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Height = 568
        Top = 0
        Width = 416
        Align = alClient
        Lines.Strings = (
          '使用说明：'
          ''
          '此程序用于生成测试数据，提供的选项包括：'
          ''
          '1、文件大小'
          ''
          '根据实际需要选用。测试时数据的传输速度越高、或者需'
          '要填充的空间越大，就需要生成较大的文件。'
          ''
          '2、文件内容'
          ''
          '主要分为随机和特定两种。随机模式适合于：'
          '1）传输或存储过程有可能存在透明压缩，需要规避；'
          '2）需要验证传输或存储结果是否正确（可通过校验和计'
          '算软件进行校验）。'
          ''
          '特定内容适合于需要通过外部方式观察传输过程信号情况'
          '的，比如用示波器观察传输过程型号波形。'
          ''
          '3、文件生成'
          '按用户指定的文件名前缀、文件数量在输出位置下生成数'
          '据文件。'
        )
        TabOrder = 0
      end
    end
  end
  object SelectDirectoryDialog1: TSelectDirectoryDialog
    left = 360
    top = 128
  end
end
