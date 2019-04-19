<%@ Page Language="C#" enableSessionState="ReadOnly" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title></title>

    <style>
          body , html 
        {  
            margin: 0;
            padding:0;
            height:100%;
            background-image: url(mainpage.jpg);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
         }

       
        
        
        .loginbox a 
        {
            text-decoration:dotted;
            font-size:15px;
            line-height:20px;
            color:#ffc107;
        }

       .loginbox a:hover 
       {    
            color:#81e219;
       }
        .imagebox 
        {
            width: 55%;
            height:90%;
            top:50%;
            left:30%;
            position:absolute;
            transform:translate(-50%,-50%);
            box-sizing: border-box;
            padding:70px 30px;
            background-color:#ffc107;
            background-size:cover;
            background-repeat:no-repeat;
        }


        h1 
        {
            margin:0;
            padding:0 0 20px;
            text-align:center;
            font-size: 50px;
            color:goldenrod
        }

        .loginbox p 
        {
            margin:0;
            padding:0;
            font-weight:bold;
        }

        .loginbox input 
        {
            width:100%;
            margin-bottom:22px;
        }

        .loginbox input[type="text"], input[type="password"] 
        {
            border:none;
            border-bottom:2px solid black;
            background: transparent;
            outline:none;
            height:40px;
            width:400px;
            float:right;
            color:black;
            font-size:20px;
        }

        .loginbox input[type="submit"] 
        {
            border:none;
            outline:none;
            height:40px;
            width:400px;
            float:right;
            background:#fb2525;
            color:#fff;
            font-size:18px;
            border-radius:20px;
            
        }

        .loginbox input[type="submit"]:hover 
        {
            cursor:pointer;
            background:#ffc107;
            color:#000;
        }

        .avatar 
        {
            width:100px;
            height:100px;
            border-radius : 50%;
            position:absolute;
            top: -50px;
            left: calc(50% - 50px);
        }

        .split 
        {
             height: 100%;
             width: 50%;
             position: fixed;
             z-index: 1;
             top: 0;
             overflow-x: hidden;
             padding-top: 20px;
             margin-top:50px;
        }

        .left 
        {
              left: 0;
              
              
        }


        .right
        {
            right: 0;
           
        }

        .sticky 
        {
              width: 400px;
	          height: 400px;
              position: absolute;
	          top:0;
              bottom: 0;
	          left: 0;
	          right: 0;  	
	          margin: auto;
        }

        .l1 
        {
            font-size:larger;
            align-self:center;
            font-family:'Lucida Handwriting';
            color:darkred
        }

        .alignright
        {
            left:92%;
            top : 2%;
            position:absolute;


        }
       </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="loginbox">
             <h1>Sticky Notes</h1>   
           <%-- <asp:Button  ID="Logout" class="btn btn-outline-danger alignright" OnClick="ActionListener"  >Logout</button>--%>
            <asp:Button name="logout" Height="50" Width="100" ID="Logout" class="btn btn-outline-danger alignright" runat="server" Text="Logout" OnClick="ActionListener"  />
            <br><br><br>

            <div >

            <asp:GridView  runat="server" ID="NoteGrid" class="" GridLines="None" AutoGenerateColumns="false"  >

                <Columns >
                    <asp:TemplateField ItemStyle-Width="200" ItemStyle-HorizontalAlign="Center"  ControlStyle-Height="100" ControlStyle-Font-Bold="true" ItemStyle-VerticalAlign="Middle"  >
                        <ItemTemplate >
                                <asp:Label ID="lbl" runat="server"  Font-Size="Larger" Font-Italic="true" CssClass="l1" Text='<%#Bind("Date1") %>' />                                                    
                          </ItemTemplate>
                    </asp:TemplateField> 

                        <asp:TemplateField ItemStyle-Width="200" ItemStyle-HorizontalAlign="Center"  ControlStyle-Height="100" ControlStyle-Font-Bold="true" ItemStyle-VerticalAlign="Middle"  >

                        <ItemTemplate >
                                <asp:TextBox ID="lb2" runat="server" ReadOnly="true"  Font-Size="Larger" Font-Italic="true" CssClass="l1" Text='<%#Bind("Note") %>' />                                                    
                          </ItemTemplate>

                        </asp:TemplateField> 

                        <asp:TemplateField  ItemStyle-Width="100">  
                    
                    <ItemTemplate>  
                        <asp:CheckBox ID="CheckBox1" runat="server" />  
                    </ItemTemplate>  
               
                    </asp:TemplateField>
                </Columns> 
                 

            </asp:GridView>

        </div >

            <div class="split right" >
             <asp:Textbox runat="server" ID="note" name="note" placeholder="Add your note" /><br><br><br><br>
            <asp:Button name="addnote" ID="addnote" runat="server" Text="Add note" OnClick="ActionListener"  /> <br><br><br><br>
            <asp:Button name="deletenote" ID="deletenote" runat="server" Text="Delete note" OnClick="ActionListener"  /><br><br><br><br>
            <asp:Button name="shownote" ID="shownote" runat="server" Text="Show note" OnClick="ActionListener"  /> <br><br><br><br>
            <asp:Button name="updatenote" ID="updatenote" runat="server" Text="Update note" OnClick="ActionListener"  /> <br><br><br><br>

           </div>


        </div>
    </form>
</body>
</html>
