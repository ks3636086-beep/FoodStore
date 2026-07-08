<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/auth/admin.master" CodeFile="add-timeslot.aspx.cs" Inherits="auth_add_timeslot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <div class="alert" id="alert_container"></div>

    <div id="accordion-container">
        <div class="panel-group" id="accordion">


                 <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration: none">Add City
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <br />

                              

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Start Time<span style="color: red">&nbsp;*</span> </label>
                                    <asp:TextBox ID="txtstart" TextMode="Time" runat="server" class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">End Time<span style="color: red">&nbsp;*</span> </label>
                                    <asp:TextBox ID="txtend" TextMode="Time" runat="server" class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="submit" id="btnsave" runat="server" class="btn btn-success" onserverclick="btnsave_ServerClick">Submit & Save</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>


   

</asp:Content>


