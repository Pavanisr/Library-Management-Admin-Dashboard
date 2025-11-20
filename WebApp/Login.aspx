<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body, html {
            height: 100%;
            margin: 0;
            background: url('images/library-hero.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5); /* subtle dark overlay for contrast */
            z-index: 0;
        }

        .login-card {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.25); /* semi-transparent */
            backdrop-filter: blur(10px); /* frosted glass effect */
            -webkit-backdrop-filter: blur(10px); /* Safari support */
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            padding: 30px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: transform 0.3s;
        }

        .login-card:hover {
            transform: scale(1.02);
        }

        .login-card h3 {
            font-weight: bold;
            color: #d35400; /* dark orange heading */
        }

        /* Dark orange login button */
        .btn-login {
            background-color: #d35400;
            border-color: #d35400;
            color: #fff;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-login:hover {
            background-color: #e67e22; /* lighter orange on hover */
            border-color: #e67e22;
            transform: scale(1.03);
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(211,84,0,.25);
            border-color: #d35400;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <form id="form1" runat="server">
        <div class="d-flex justify-content-center align-items-center vh-100">
            <div class="login-card col-md-4">
                <h3 class="text-center mb-4">Admin Login</h3>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control mb-3" Placeholder="Username"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-3" Placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-login w-100 mb-3" Text="Login" OnClick="btnLogin_Click" />
                <asp:Label ID="lblMsg" runat="server" CssClass="text-danger text-center"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
