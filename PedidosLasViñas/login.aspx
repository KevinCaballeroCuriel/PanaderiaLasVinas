<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PedidosLasViñas.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="include/img/ico.png" />
        <title>Login</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600&display=swap" rel="stylesheet" />
        <link href="include/fontawesome/css/all.min.css" rel="stylesheet" />
        <link href="include/css/estilosLasVinas.css" rel="stylesheet" />
        <link href="include/css/w3.css" rel="stylesheet" />
        <link type="text/css" href="include/bootstrap/css/bootstrap.min.css" rel="stylesheet" />    
        <link href="include/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="include/js/login.js"></script>
</head>
<body class="bg-primary">
    <center><img id="imgLogo" src="include/img/logo.png" style="height:233px; width:264px;" alt="Las Viñas" /></center>
    
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-2">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form id="form1" runat="server">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                                <asp:TextBox ID="txtEmail" class="form-control"  runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Contraseña</label>
                                                <asp:TextBox ID="txtContrasena" class="form-control"  runat="server" type="Password"></asp:TextBox>
                                            </div>
                                            <center><div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input " id="mostrarPasswordCheck" type="checkbox" />
                                                    <label class="custom-control-label" for="mostrarPasswordCheck">Mostrar Contraseña</label>
                                                </div>
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                    <label class="custom-control-label" for="rememberPasswordCheck">Recuerdame</label>
                                                </div>
                                            </div>
                                            <div class="form-group d-fle align-items-center justify-content-between mt-4 mb-0">
                                                <asp:Button ID="btnIngresar" CssClass="btnLogin" runat="server" Text="Login" OnClick="btnIngresar_Click" />
                                            </div></center>
                                            <div id="mensajeError" visible="false" runat="server" class="alert alert-danger mt-1" role="alert">
                                                Correo y/o Contrasena invalidos
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
        
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="include/js/scripts.js"></script>
</body>
</html>