VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FrmPrincipal 
   Caption         =   "Form1"
   ClientHeight    =   9450
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   14325
   LinkTopic       =   "Form1"
   ScaleHeight     =   9450
   ScaleWidth      =   14325
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lvCatalago 
      Height          =   4455
      Left            =   240
      TabIndex        =   7
      Top             =   3000
      Width           =   13575
      _ExtentX        =   23945
      _ExtentY        =   7858
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.CommandButton cmdLibrosWish 
      Caption         =   "Wishlsit"
      Height          =   855
      Left            =   11640
      TabIndex        =   6
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton cmdLibrosDislike 
      Caption         =   "No recomendados"
      Height          =   855
      Left            =   9360
      TabIndex        =   5
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton cmdLibrosRecomendados 
      Caption         =   "Libros Recomendados"
      Height          =   855
      Left            =   7080
      TabIndex        =   4
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton cmdLibrosLeidos 
      Caption         =   "Libros Leídos"
      Height          =   855
      Left            =   4800
      TabIndex        =   3
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton cdmGenerosFavoritos 
      Caption         =   "Generos Favoritos"
      Height          =   855
      Left            =   2520
      TabIndex        =   2
      Top             =   1200
      Width           =   2055
   End
   Begin VB.CommandButton cmdFavorites 
      Caption         =   "Favoritos"
      Height          =   855
      Left            =   240
      TabIndex        =   1
      Top             =   1200
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "Catalago"
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   2640
      Width           =   3255
   End
   Begin VB.Label labelCatalago 
      BackColor       =   &H8000000D&
      Caption         =   " Mega Lectura Inicio"
      BeginProperty Font 
         Name            =   "Calisto MT"
         Size            =   30
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000B&
      Height          =   900
      Left            =   4080
      TabIndex        =   0
      Top             =   120
      Width           =   5655
   End
End
Attribute VB_Name = "FrmPrincipal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cdmGenerosFavoritos_Click()

End Sub

Private Sub cmdFavorites_Click()
    Dim conexion As ADODB.Connection
    Dim sql As String
    
    ' Asegurarse de que un libro esté seleccionado en el ListView
    If lvCatalago.SelectedItem Is Nothing Then
        MsgBox "Seleccione un libro del catálogo", vbExclamation
        Exit Sub
    End If
    
    ' Crear y abrir la conexión a la base de datos
    Set conexion = New ADODB.Connection
    conexion.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=hub_lectura;User=root;Password=;"
    conexion.Open
    
    ' Obtener el ID del libro seleccionado
    Dim LibroID As Long
    LibroID = lvCatalago.SelectedItem.Tag
    
    ' Insertar el libro en la lista de favoritos
    sql = "INSERT INTO favoritos (id_usuario, id_libro) VALUES (" & UserID & ", " & LibroID & ")"
    conexion.Execute sql
    
    MsgBox "Libro añadido a favoritos", vbInformation
    conexion.Close
End Sub

Private Sub cmdLibrosDislike_Click()

    Dim conexion As ADODB.Connection
    Dim sql As String
    
    ' Asegurarse de que un libro esté seleccionado en el ListView
    If lvCatalago.SelectedItem Is Nothing Then
        MsgBox "Seleccione un libro del catálogo", vbExclamation
        Exit Sub
    End If
    
    ' Crear y abrir la conexión a la base de datos
    Set conexion = New ADODB.Connection
    conexion.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=hub_lectura;User=root;Password=;"
    conexion.Open
    
    ' Obtener el ID del libro seleccionado
    Dim LibroID As Long
    LibroID = lvCatalago.SelectedItem.Tag
    
    ' Insertar el libro en la lista de libros no gustados
    sql = "INSERT INTO libros_no_gustados (id_usuario, id_libro) VALUES (" & UserID & ", " & LibroID & ")"
    conexion.Execute sql
    
    MsgBox "Libro añadido a la lista de libros no gustados", vbInformation
    conexion.Close

End Sub

Private Sub cmdLibrosLeidos_Click()
    Dim conexion As ADODB.Connection
    Dim sql As String
    
    ' Asegurarse de que un libro esté seleccionado en el ListView
    If lvCatalago.SelectedItem Is Nothing Then
        MsgBox "Seleccione un libro del catálogo", vbExclamation
        Exit Sub
    End If
    
    ' Crear y abrir la conexión a la base de datos
    Set conexion = New ADODB.Connection
    conexion.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=hub_lectura;User=root;Password=;"
    conexion.Open
    
    ' Obtener el ID del libro seleccionado
    Dim LibroID As Long
    LibroID = lvCatalago.SelectedItem.Tag
    
    ' Insertar el libro en la lista de libros leídos
    sql = "INSERT INTO libros_leidos (id_usuario, id_libro) VALUES (" & UserID & ", " & LibroID & ")"
    conexion.Execute sql
    
    MsgBox "Libro añadido a la lista de libros leídos", vbInformation
    conexion.Close
End Sub

Private Sub cmdLibrosWish_Click()

    Dim conexion As ADODB.Connection
    Dim sql As String
    
    ' Asegurarse de que un libro esté seleccionado en el ListView
    If lvCatalago.SelectedItem Is Nothing Then
        MsgBox "Seleccione un libro del catálogo", vbExclamation
        Exit Sub
    End If
    
    ' Crear y abrir la conexión a la base de datos
    Set conexion = New ADODB.Connection
    conexion.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=hub_lectura;User=root;Password=;"
    conexion.Open
    
    ' Obtener el ID del libro seleccionado
    Dim LibroID As Long
    LibroID = lvCatalago.SelectedItem.Tag
    
    ' Insertar el libro en la lista de libros deseados
    sql = "INSERT INTO libros_deseados (id_usuario, id_libro) VALUES (" & UserID & ", " & LibroID & ")"
    conexion.Execute sql
    
    MsgBox "Libro añadido a la lista de libros deseados", vbInformation
    conexion.Close

End Sub

Private Sub Form_Load()
   With lvCatalago
        .ColumnHeaders.Add , , "Titulo", 3000
        .ColumnHeaders.Add , , "Autor", 1000
        .ColumnHeaders.Add , , "Editorial", 1500
        .ColumnHeaders.Add , , "Genero", 1500
        .ColumnHeaders.Add , , "Año", 1505
    End With
    
    Dim conexion As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim item As ListItem
    
    Set conexion = New ADODB.Connection

    conexion.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=hub_lectura;User=root;Password=;"
    conexion.Open
    
    Set rs = New ADODB.Recordset
    
    sql = "SELECT * FROM libros"
    rs.Open sql, conexion
    
    lvCatalago.ListItems.Clear
    
    Do While Not rs.EOF
        Set Item = lvCatalago.ListItems.Add(, , rs.Fields("nombre").Value)
        Item.SubItems(1) = rs.Fields("autor").Value
        Item.SubItems(2) = rs.Fields("id_genero").Value
        Item.SubItems(3) = rs.Fields("editorial").Value
        Item.SubItems(4) = rs.Fields("anio").Value
        
        Item.Tag = rs.Fields("id").Value
        
        rs.MoveNext
    Loop
        
    rs.Close


End Sub

