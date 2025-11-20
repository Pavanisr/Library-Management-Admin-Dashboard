<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WebApp.Category" MasterPageFile="~/Site.Master" %>

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

        .action-btn {
            padding: 4px 12px;
            border-radius: 6px;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }

        .btn-edit {
            background-color: #3498db;
            color: white;
        }

        .btn-edit:hover {
            background-color: #2980b9;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c0392b;
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
    </style>

    
    <div class="page-header">
        <h3> Categories</h3>
        <asp:Button ID="btnBack" runat="server" Text="← Back to Dashboard"
            CssClass="btn btn-back" OnClick="btnBack_Click" />
    </div>

   
    <div class="card-table">
        <asp:Button ID="btnAddCategory" runat="server" Text=" Add Category"
            CssClass="btn btn-add mb-3" OnClick="btnAddCategory_Click" />

        <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False"
            DataKeyNames="CategoryID"
            OnRowEditing="gvCategories_RowEditing"
            OnRowUpdating="gvCategories_RowUpdating"
            OnRowCancelingEdit="gvCategories_RowCancelingEdit"
            OnRowDeleting="gvCategories_RowDeleting"
            CssClass="table table-bordered table-hover">

            <Columns>
                <asp:BoundField DataField="CategoryID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />

                
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit"
                            Text="Edit" CssClass="action-btn btn-edit"></asp:LinkButton>

                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete"
                            Text="Delete" CssClass="action-btn btn-delete"
                            OnClientClick="return confirm('Are you sure you want to delete this category?');">
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update"
                            Text="Update" CssClass="action-btn btn-edit"></asp:LinkButton>

                        <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel"
                            Text="Cancel" CssClass="action-btn btn-delete"></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </div>

</asp:Content>
