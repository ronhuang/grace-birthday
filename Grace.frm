VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.1#0"; "RICHTX32.OCX"
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  '雙線固定對話方塊
   Caption         =   "Grace"
   ClientHeight    =   6825
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   9405
   BeginProperty Font 
      Name            =   "新細明體"
      Size            =   9.75
      Charset         =   136
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Grace.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Grace.frx":0ECA
   ScaleHeight     =   6825
   ScaleWidth      =   9405
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '系統預設值
   Begin VB.Frame Frame3 
      Caption         =   "抉擇區"
      Height          =   1335
      Left            =   120
      TabIndex        =   6
      ToolTipText     =   "可以聽音樂，列印，和結束程式"
      Top             =   5280
      Width           =   9135
      Begin VB.CommandButton Command3 
         Height          =   675
         Left            =   6600
         Picture         =   "Grace.frx":190DEC
         Style           =   1  '圖片外觀
         TabIndex        =   10
         ToolTipText     =   "按一下就會結束此程式"
         Top             =   360
         Width           =   1860
      End
      Begin VB.CommandButton Command2 
         Height          =   675
         Left            =   3720
         Picture         =   "Grace.frx":191CC7
         Style           =   1  '圖片外觀
         TabIndex        =   9
         ToolTipText     =   "按一下就可以列印欣賞區的圖案"
         Top             =   360
         Width           =   1860
      End
      Begin VB.CommandButton Command1 
         Height          =   675
         Left            =   840
         Picture         =   "Grace.frx":19271C
         Style           =   1  '圖片外觀
         TabIndex        =   8
         ToolTipText     =   "按一下就可以聽音樂"
         Top             =   360
         Width           =   1860
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "欣賞區"
      Height          =   5055
      Left            =   4920
      TabIndex        =   5
      ToolTipText     =   "顧名思義（成語）就是欣賞圖案的區域"
      Top             =   120
      Width           =   4335
      Begin RichTextLib.RichTextBox RichTextBox1 
         Height          =   375
         Left            =   240
         TabIndex        =   7
         ToolTipText     =   "所看圖案的名稱"
         Top             =   360
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   661
         _Version        =   327681
         Enabled         =   -1  'True
         ScrollBars      =   1
         TextRTF         =   $"Grace.frx":196A36
      End
      Begin VB.Image Image1 
         BorderStyle     =   1  '單線固定
         Height          =   3855
         Left            =   240
         ToolTipText     =   "按一下可以看到全圖，不過會不好看"
         Top             =   960
         Width           =   3855
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "檔案區"
      Height          =   5055
      Left            =   120
      TabIndex        =   0
      ToolTipText     =   "可以選擇要看的目錄和檔案"
      Top             =   120
      Width           =   4635
      Begin VB.FileListBox File1 
         Height          =   4380
         Left            =   2640
         Pattern         =   "*.jpg;*.bmp;*.gif"
         TabIndex        =   2
         ToolTipText     =   "選擇要看的檔案"
         Top             =   360
         Width           =   1815
      End
      Begin VB.DirListBox Dir1 
         Height          =   3015
         Left            =   240
         TabIndex        =   1
         ToolTipText     =   "選擇要看的目錄"
         Top             =   360
         Width           =   2175
      End
      Begin VB.Image Image6 
         Height          =   285
         Left            =   240
         Picture         =   "Grace.frx":196DDD
         Stretch         =   -1  'True
         Top             =   3960
         Width           =   255
      End
      Begin VB.Image Image5 
         Height          =   255
         Left            =   240
         Picture         =   "Grace.frx":19768F
         Stretch         =   -1  'True
         Top             =   3480
         Width           =   285
      End
      Begin VB.Label Label2 
         Caption         =   "選擇要看的檔案"
         Height          =   255
         Left            =   600
         TabIndex        =   4
         Top             =   3960
         Width           =   1455
      End
      Begin VB.Label Label1 
         Caption         =   "選擇要看的目錄"
         Height          =   255
         Left            =   600
         TabIndex        =   3
         Top             =   3480
         Width           =   1575
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "檔案(&F)"
      Begin VB.Menu mnuMusic 
         Caption         =   "音樂(&M)"
      End
      Begin VB.Menu mnuPrint 
         Caption         =   "列印(&P)"
      End
      Begin VB.Menu mnuSpace1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "結束(&E)"
      End
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "關於(&A)"
   End
   Begin VB.Menu mnuSorry 
      Caption         =   "對不起(&S)"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  Shell "C:\Program Files\WinAMP\WinAmp.exe E:\迪士尼音樂\Disney.m3u", vbNormalNoFocus
End Sub

Private Sub Command2_Click()
  If Image1.Picture = 0 Then
    MsgBox "要先選擇圖案！", vbOKOnly, "錯誤"
  Else
    Printer.PaintPicture Image1.Picture, 1, 1
    Printer.EndDoc
  End If
End Sub

Private Sub Command3_Click()
  Form2.Show 1
End Sub

Private Sub Dir1_Change()
  File1.Path = Dir1.Path
End Sub

Private Sub File1_Click()
  Set PreLoadPicture = LoadPicture(File1.Path + "\" + File1.filename)
  '檢查圖案是否大於Image1
  '先檢查Width
'  OriginalWidth1 = 3855 'Original Image1.Width
'  OriginalWidth2 = 4335 'Original Frame2.Width
'  OriginalWidth3 = 9495 'Original Form1.Width
'  OriginalHeight1 = 3855 'Original Image1.Height
'  OriginalHeight2 = 5055 'Original Frame2.Height
'  OriginalHeight3 = 7485 'Original Form1.Height
'  OriginalTop = 5280 'Original Frame3.Top
  If (PreLoadPicture.Width * (7500 / 13229)) > (OriginalWidth1) Then
    NewWidth1 = PreLoadPicture.Width * (7500 / 13229) ' New Image1.Width
    NewWidth2 = OriginalWidth2 - OriginalWidth1 + NewWidth1 'New Frame2.Width
    NewWidth3 = OriginalWidth3 + NewWidth2 - OriginalWidth2 ' New Form1.Width
  Else
    NewWidth1 = OriginalWidth1
    NewWidth2 = OriginalWidth2
    NewWidth3 = OriginalWidth3
  End If
  '再檢查Height
  If (PreLoadPicture.Height * (7500 / 13229)) > (OriginalHeight1) Then
    NewHeight1 = PreLoadPicture.Height * (7500 / 13229) ' New Image1.Height
    NewHeight2 = OriginalHeight2 - OriginalHeight1 + NewHeight1 ' New Frame2.Height
    NewHeight3 = OriginalHeight3 + NewHeight2 - OriginalHeight2 ' New Form1.Height
    'Frame3 也要跟著下去
    NewTop = OriginalTop + NewHeight2 - OriginalHeight2 ' New Frame3.Top
  Else
    NewHeight1 = OriginalHeight1
    NewHeight2 = OriginalHeight2
    NewHeight3 = OriginalHeight3
    NewTop = OriginalTop
  End If
  Image1.Move Image1.Left, Image1.Top, NewWidth1, NewHeight1
  Frame2.Move Frame2.Left, Frame2.Top, NewWidth2, NewHeight2
  Form1.Move Form1.Left, Form1.Top, NewWidth3, NewHeight3
  Frame3.Move Frame3.Left, NewTop
  Image1.Stretch = False
  Image1.Picture = LoadPicture(File1.Path + "\" + File1.filename)
  RichTextBox1.Text = File1.filename
End Sub

Private Sub Form_Load()
  Me.Top = Screen.Height / 50
  Me.Left = Screen.Width / 50
  Dim PreLoadPicture As Picture
'  Dim OriginalWidth1 As Single, OriginalWidth2 As Single, OriginalWidth3 As Single
'  Dim OriginalHeight1 As Single, OriginalHeight2 As Single, OriginalHeight3 As Single
'  Dim OriginalTop As Single
'  Public const OriginalWidth1 As Single=3855, OriginalWidth2 As Single=4335, OriginalWidth3 As Single=9495
'  Dim OriginalHeight1 As Single, OriginalHeight2 As Single, OriginalHeight3 As Single
'  Dim OriginalTop As Single

'  Dim NewWidth1 As Single, NewHeight1 As Single, NewTop As Single
'  Dim NewWidth2 As Single, NewHeight2 As Single
'  Dim NewWidth3 As Single, NewHeight3 As Single
  Dir1.Path = "E:\迪士尼圖片"
End Sub
Private Sub Image1_Click()
  If Image1.Picture = 0 Then
    'Do nothing
  Else
    If Image1.Stretch = False Then
      Image1.Move Image1.Left, Image1.Top, OriginalWidth1, OriginalHeight1
      Frame2.Move Frame2.Left, Frame2.Top, OriginalWidth2, OriginalHeight2
      Form1.Move Form1.Left, Form1.Top, OriginalWidth3, OriginalHeight3
      Frame3.Move Frame3.Left, OriginalTop
      Image1.Stretch = True
    Else
      Image1.Move Image1.Left, Image1.Top, NewWidth1, NewHeight1
      Frame2.Move Frame2.Left, Frame2.Top, NewWidth2, NewHeight2
      Form1.Move Form1.Left, Form1.Top, NewWidth3, NewHeight3
      Frame3.Move Frame3.Left, NewTop
      Image1.Stretch = False
    End If
  End If
End Sub
Private Sub mnuAbout_Click()
  frmAbout.Show 1
End Sub

Private Sub mnuExit_Click()
    Form2.Show 1
End Sub

Private Sub mnuMusic_Click()
    Shell "C:\Program Files\WinAMP\WinAmp.exe E:\迪士尼音樂\Disney.m3u", vbNormalNoFocus
End Sub

Private Sub mnuPrint_Click()
  If Image1.Picture = 0 Then
    MsgBox "要先選擇圖案！", vbOKOnly, "錯誤"
  Else
    Printer.PaintPicture Image1.Picture, 1, 1
    Printer.EndDoc
  End If
End Sub

Private Sub mnuSorry_Click()
  MsgBox "對不起，我必須承認這個程式是我趕出來的，功能非常陽春且畫面也不是十分好看，不過這只是個開始，以後等我學到更好的技術時，我會定期給妳最新的版本。", vbOKOnly, "對不起"
End Sub
