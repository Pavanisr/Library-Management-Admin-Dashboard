<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="WebApp.Books" MasterPageFile="~/Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .page-header h3 {
            color: #d35400;
            font-weight: bold;
        }

        .btn-back {
            background-color: #e67e22;
            color: white;
            font-weight: bold;
        }

        .btn-back:hover {
            background-color: #d35400;
        }

        .btn-add {
            background-color: #d35400;
            color: white;
            font-weight: bold;
        }

        .btn-add:hover {
            background-color: #e67e22;
        }

        .card-table {
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            padding: 20px;
            background-color: #fff9f2;
        }

        .table th {
            background-color: #d35400;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #fce5d0;
        }

        /* Custom Edit/Delete buttons */
        .btn-edit {
            background-color: #f39c12;
            color: white;
            font-weight: bold;
        }

        .btn-edit:hover {
            background-color: #d35400;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
            font-weight: bold;
        }

        .btn-delete:hover {
            background-color: #c0392b;
        }

        .bi {
            vertical-align: middle;
        }
    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <div class="page-header">
        <h3> Books Management</h3>
        <asp:Button ID="btnBack" runat="server" Text="← Back to Dashboard" CssClass="btn btn-back" OnClick="btnBack_Click" />
    </div>

    <div class="card-table">
        <asp:Button ID="btnAddBook" runat="server" Text=" Add Book" CssClass="btn btn-add mb-3" OnClick="btnAddBook_Click" />

       <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID"
    OnRowEditing="gvBooks_RowEditing" OnRowUpdating="gvBooks_RowUpdating" OnRowCancelingEdit="gvBooks_RowCancelingEdit"
    OnRowDeleting="gvBooks_RowDeleting" CssClass="table table-striped table-bordered table-hover">
    <Columns>
        <asp:BoundField DataField="Title" HeaderText="Title" />
        <asp:BoundField DataField="Author" HeaderText="Author" />
        <asp:TemplateField HeaderText="Category">
            <ItemTemplate>
                <%# Eval("CategoryName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
        
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="btn btn-edit btn-sm">
                    <i class="bi bi-pencil-square"></i> Edit
                </asp:LinkButton>
                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="btn btn-delete btn-sm" OnClientClick="return confirm('Are you sure to delete this book?');">
                    <i class="bi bi-trash"></i> Delete
                </asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CssClass="btn btn-edit btn-sm">
                    <i class="bi bi-check-lg"></i> Update
                </asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" CssClass="btn btn-delete btn-sm">
                    <i class="bi bi-x-lg"></i> Cancel
                </asp:LinkButton>
            </EditItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

    </div>
</asp:Content>
