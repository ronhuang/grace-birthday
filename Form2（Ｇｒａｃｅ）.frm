VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   3  '雙線固定對話方塊
   Caption         =   "妳確定要結束此程式？"
   ClientHeight    =   6105
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3525
   Icon            =   "Form2（Ｇｒａｃｅ）.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form2（Ｇｒａｃｅ）.frx":164A
   ScaleHeight     =   6105
   ScaleWidth      =   3525
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '系統預設值
   Begin VB.CommandButton Command2 
      Caption         =   "ＮＯ"
      Height          =   1695
      Left            =   1920
      Picture         =   "Form2（Ｇｒａｃｅ）.frx":6702
      Style           =   1  '圖片外觀
      TabIndex        =   2
      ToolTipText     =   "不要"
      Top             =   4200
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ＹＥＳ"
      Height          =   1695
      Left            =   120
      Picture         =   "Form2（Ｇｒａｃｅ）.frx":70A9
      Style           =   1  '圖片外觀
      TabIndex        =   1
      ToolTipText     =   "要"
      Top             =   4200
      Width           =   1575
   End
   Begin VB.Label Label1 
      Alignment       =   2  '靠中對齊
      BackStyle       =   0  '透明
      Caption         =   "妳確定要結束此程式？"
      BeginProperty Font 
         Name            =   "標楷體"
         Size            =   15.75
         Charset         =   136
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   0
      TabIndex        =   0
      Top             =   3600
      Width           =   3495
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Unload Me
  Unload Form1
End Sub

Private Sub Command2_Click()
  Unload Me
End Sub
