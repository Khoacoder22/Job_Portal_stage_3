<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="JobsList.aspx.cs" Inherits="OnlineJobPortal.Admin.JobsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
   <!-- message --> 
    <div class="container pt-4 pb-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
    <!-- Job list-->
        
        <h3 class="text-center"><strong>Jobs List</strong></h3>
        <!-- div 1 -->
        <div class="row md-3 pt-sm-3">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display" AutoGenerateColumns="False" AllowPaging="True" Pagesize="5" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="JobId" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
                      <columns>

                          <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>
                          
                          <asp:BoundField DataField="Title" HeaderText="Job Title">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="Position" HeaderText="No. Positions">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="Qualification" HeaderText="Qualification">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="Experience" HeaderText="Experience">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="LastDate" HeaderText="Last day to apply" DataFormatString="{0:dd MM yyyy}">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="CompanyName" HeaderText="Company Name">
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>


                          <asp:TemplateField HeaderText="Edit">
                              <ItemTemplate>
                                  <asp:LinkButton ID-="btnEditJob" runat="server" CommandName="EditJob" CommandArgument='<%# Eval("JobId") %>'>
                                      <asp:Image ID="img" runat="server" ImageUrl="../assets/img/icon/editPencil.png" Height="25px" />
                                  </asp:LinkButton>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="50px" />
                          </asp:TemplateField>

                          <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true" 
                              DeleteImageUrl="../assets/img/icon/trashIcon.png" ButtonType="Image">
                          <ControlStyle Height="25px" Width="25px" />
                          <ItemStyle HorizontalAlign="Center" />
                          </asp:CommandField>

                     </columns>
                    <HeaderStyle BackColor="#2ecc71" ForeColor="White" />
                </asp:GridView>
                <column>
               </column>
            </div>
        </div>

    </div>
    </div>

</asp:Content>
