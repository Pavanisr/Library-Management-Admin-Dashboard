<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   
    <header style="position: relative; height: 100vh; width: 100%;">
        <div style="
            background: url('images/library-hero.jpg') no-repeat center center;
            background-size: cover;
            height: 100%;
            width: 100%;
            position: relative;">
            
            
            <div style="position:absolute; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.5);"></div>
            
            
            <div style="
                position:absolute;
                top:50%;
                left:50%;
                transform:translate(-50%, -50%);
                text-align:center;
                color:white;
                z-index:2;">
                <h1 class="fw-bold mb-4" style="font-size:3rem; text-shadow: 2px 2px 6px rgba(0,0,0,0.7);">
                    PLUNGE INTO THE WONDERFUL WORLD OF READING
                </h1>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-lg mt-3" 
                            OnClick="btnLogin_Click" 
                            style="background-color:#d35400; border-color:#d35400; color:white;" />
            </div>
        </div>
    </header>

    
    <section class="container mt-5">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <h3>Getting Started</h3>
                <p>Discover books, explore programs, and learn how to make the most of your library experience.</p>
                <a class="btn btn-outline-primary" href="#">Learn More &raquo;</a>
            </div>
            <div class="col-md-4 mb-4">
                <h3>Programs</h3>
                <p>Check out library events, reading programs, and community engagement activities.</p>
                <a class="btn btn-outline-primary" href="#">View Programs &raquo;</a>
            </div>
            <div class="col-md-4 mb-4">
                <h3>Contact Us</h3>
                <p>Need help? Contact our staff or find directions to the library.</p>
                <a class="btn btn-outline-primary" href="#">Contact &raquo;</a>
            </div>
        </div>
    </section>

</asp:Content>
