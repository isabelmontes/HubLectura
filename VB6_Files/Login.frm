VERSION 5.00
Begin VB.Form Login 
   Caption         =   "Form2"
   ClientHeight    =   6015
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   5925
   LinkTopic       =   "Form2"
   ScaleHeight     =   6015
   ScaleWidth      =   5925
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdIngresar 
      BackColor       =   &H8000000D&
      Caption         =   "Ingresar"
      Height          =   615
      Left            =   1800
      TabIndex        =   5
      Top             =   4080
      Width           =   2295
   End
   Begin VB.TextBox txtContra 
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   3120
      Width           =   5295
   End
   Begin VB.TextBox txtEmail 
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   1680
      Width           =   5295
   End
   Begin VB.Label labelPassword 
      Caption         =   "Contrasena"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   2640
      Width           =   2535
   End
   Begin VB.Label labelEmail 
      Caption         =   "Email"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   1200
      Width           =   2535
   End
   Begin VB.Label labelLogin 
      BackColor       =   &H8000000D&
      Caption         =   "  Mega Lectura "
      BeginProperty Font 
         Name            =   "Calisto MT"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000B&
      Height          =   495
      Left            =   1680
      TabIndex        =   0
      Top             =   240
      Width           =   2775
   End
End
Attribute VB_Name = "Login"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdIngresar_Click()
    Dim conexion As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
    
    ' Crear y abrir la conexión a la base de datos
    Set conexion = New ADODB.Connection
    conexion.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=hub_lectura;User=root;Password=;"
    conexion.Open
    
    ' Verificar las credenciales del usuario
    sql = "SELECT id FROM usuarios WHERE email = '" & txtEmail.Text & "' AND password = '" & txtContra.Text & "'"
    Set rs = New ADODB.Recordset
    rs.Open sql, conexion
    
    If Not rs.EOF Then
        ' Credenciales correctas, almacenar el id del usuario en una variable global
        UserID = rs.Fields("id").Value
        rs.Close
        conexion.Close
        ' Cerrar el formulario de login y abrir el formulario principal
        Unload Me
        FrmPrincipal.Show
    Else
        ' Credenciales incorrectas, mostrar un mensaje de error
        MsgBox "Correo electrónico o contraseña incorrectos", vbExclamation
        txtContra.Text = ""
        txtContra.SetFocus
    End If
End Sub


