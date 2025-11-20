<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="WebApp.AddBook" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #fdf6f0; /* Light warm background */
        }

        h3 {
            color: #d35400; /* Match dashboard orange */
            font-weight: bold;
            margin-bottom: 20px;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            padding: 30px;
            background-color: #fff9f2; /* Light warm card background */
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #d35400;
            padding: 10px;
        }

        .form-control:focus {
            border-color: #e67e22;
            box-shadow: 0 0 5px rgba(211,84,0,0.5);
        }

        .btn-primary {
            background-color: #d35400;
            border-color: #d35400;
            font-weight: bold;
            padding: 8px 25px;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background-color: #e67e22;
            border-color: #e67e22;
        }

        .text-success {
            color: #27ae60 !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h3>Add New Book</h3>

            <div class="card">
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control mb-3" placeholder="Book Title"></asp:TextBox>
                <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control mb-3" placeholder="Author"></asp:TextBox>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control mb-3"></asp:DropDownList>
                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control mb-3" placeholder="Quantity" TextMode="Number"></asp:TextBox>

                <asp:Button ID="btnSave" runat="server" Text="Save Book" CssClass="btn btn-primary" OnClick="btnSave_Click" />

                <asp:Label ID="lblMsg" runat="server" CssClass="text-success mt-3 fw-bold"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
