VERSION 5.00
Begin VB.Form frmSplash 
   BorderStyle     =   3  '���u�T�w��ܤ��
   ClientHeight    =   4245
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   7380
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash(Grace).frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '�ù�����
   Begin VB.Frame Frame1 
      Height          =   4050
      Left            =   150
      TabIndex        =   0
      Top             =   60
      Width           =   7080
      Begin VB.Timer Timer1 
         Interval        =   2000
         Left            =   3240
         Top             =   720
      End
      Begin VB.Image imgLogo 
         Height          =   3300
         Left            =   360
         Picture         =   "frmSplash(Grace).frx":000C
         Stretch         =   -1  'True
         Top             =   435
         Width           =   2175
      End
      Begin VB.Label lblCompany 
         Alignment       =   1  '�a�k���
         Caption         =   "���q�GFeces'"
         Height          =   255
         Left            =   4560
         TabIndex        =   2
         Top             =   3360
         Width           =   2415
      End
      Begin VB.Label lblVersion 
         Alignment       =   1  '�a�k���
         AutoSize        =   -1  'True
         Caption         =   "����"
         BeginProperty Font 
            Name            =   "�s�ө���"
            Size            =   12
            Charset         =   136
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   6330
         TabIndex        =   3
         Top             =   2760
         Width           =   525
      End
      Begin VB.Label lblPlatform 
         Alignment       =   1  '�a�k���
         AutoSize        =   -1  'True
         Caption         =   "�ϥΥ��x�GWindows98"
         BeginProperty Font 
            Name            =   "�s�ө���"
            Size            =   15.75
            Charset         =   136
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   3615
         TabIndex        =   4
         Top             =   2400
         Width           =   3240
      End
      Begin VB.Label lblProductName 
         AutoSize        =   -1  'True
         Caption         =   "���~"
         BeginProperty Font 
            Name            =   "�з���"
            Size            =   48
            Charset         =   136
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   960
         Left            =   3840
         TabIndex        =   5
         Top             =   1320
         Width           =   1965
      End
      Begin VB.Label lblLicenseTo 
         Alignment       =   1  '�a�k���
         Caption         =   "�ϥ��v�ݩ�G����"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   6855
      End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
    Unload Me
    Form1.Show
End Sub

Private Sub Form_Load()
    lblVersion.Caption = "���� " & App.Major & "." & App.Minor & "." & App.Revision
    lblProductName.Caption = App.Title
End Sub

Private Sub Frame1_Click()
    Unload Me
    Form1.Show
End Sub

Private Sub imgLogo_Click()
    Unload Me
    Form1.Show
End Sub

Private Sub lblCompany_Click()
    Unload Me
    Form1.Show
End Sub

Private Sub lblLicenseTo_Click()
    Unload Me
    Form1.Show
End Sub

Private Sub lblPlatform_Click()
    Unload Me
    Form1.Show
End Sub

Private Sub lblProductName_Click()
    Unload Me
    Form1.Show
End Sub

Private Sub lblVersion_Click()
    Unload Me
    Form1.Show
End Sub

Private Sub Timer1_Timer()
  Unload Me
  Form1.Show
End Sub
