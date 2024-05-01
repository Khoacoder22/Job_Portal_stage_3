<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ResumeView.aspx.cs" Inherits="OnlineJobPortal.Admin.ResumeView" %>

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

            <h3 class="text-center"><strong>Resume</strong></h3>
            <!-- div 1 -->
            <div class="row md-3 pt-sm-3">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record to display" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="AppliedJobsId" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>

                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Title" HeaderText="Job Title">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="CompanyName" HeaderText="Company Name">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Name" HeaderText="User Name">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Email" HeaderText="User Email">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="LastDate" HeaderText="Last day to apply" DataFormatString = "{0:dd-MM-yyyy}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Mobile" HeaderText="User Mobile">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                         
                            <asp:TemplateField HeaderText="Resume">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.Resume","../{0}") %>'><i class="fas fa-download"></i>Download</asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center"/>
                            </asp:TemplateField>

                            <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true"
                                DeleteImageUrl="../assets/img/icon/trashIcon.png" ButtonType="Image">
                                <ControlStyle Height="25px" Width="25px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>

                        </Columns>
                        <HeaderStyle BackColor="#2ecc71" ForeColor="White" />
                    </asp:GridView>
                    <column>
                    </column>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
