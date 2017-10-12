<%-- _lcid="1033" _version="14.0.4762" _dal="1" --%>
<%-- _LocalBinding --%>

<%@ Page Language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c"
    meta:progid="SharePoint.WebPartPage.Document" meta:webpartpageexpansion="full" %>

<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    <SharePoint:ListItemProperty ID="ListItemProperty1" Property="BaseName" MaxLength="40" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    <WebPartPages:WebPartZone runat="server" Title="loc:TitleBar" ID="TitleBar" AllowLayoutChange="false"
        AllowPersonalization="false">
        <ZoneTemplate></ZoneTemplate>
    </WebPartPages:WebPartZone>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderTitleAreaClass" runat="server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <meta name="GENERATOR" content="Microsoft SharePoint" />
    <meta name="ProgId" content="SharePoint.WebPartPage.Document" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="CollaborationServer" content="SharePoint Team Web Site" />
    <style type="text/css">
        #sideNavBox {
            display: none;
        }

        #contentRow {
            padding-top: 0px !important;
        }

        #contentBox {
            margin-left: 25px !important;
        }

        .s4-ca {
            margin-left: 0px;
        }
        Div.ms-titleareaframe {
            height: 100%;
        }

        .ms-pagetitleareaframe table {
            background: none;
        }
    </style>
    <script type="text/javascript"> 
        
            
       
        // <![CDATA[
        getCurrentUserGroupColl();
        var navBarHelpOverrideKey = "WSSEndUser";
        // ]]>
    </script>
    <script src="/_layouts/15/arKMedes/TOSJS/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/_layouts/15/datepicker.js"></script>
    <script src="/_layouts/15/arKMedes/TOSJS/jquery-ui.js" type="text/javascript"></script>
    <SharePoint:CssRegistration runat="server" ID="CssRegistration1" After="corev15.css" Name="/_layouts/15/arKMedes/TOS_TRACKINGCSS/bootstrap.min.css" />
    <SharePoint:CssRegistration runat="server" ID="CssRegistration2" After="corev15.css" Name="/_layouts/15/arKMedes/TOS_TRACKINGCSS/jquery-ui.css" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PlaceHolderSearchArea" runat="server">
    <SharePoint:DelegateControl ID="DelegateControl1" runat="server"
        ControlId="SmallSearchInputBox" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderLeftActions" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="PlaceHolderPageDescription" runat="server">
    <SharePoint:ProjectProperty ID="ProjectProperty1" Property="Description" runat="server" />
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="PlaceHolderBodyRightMargin" runat="server">
    <div height="100%" class="ms-pagemargin">
        <img src="/_layouts/images/blank.gif" width="10" height="1" alt="" />
    </div>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <table cellpadding="4" cellspacing="0" border="0" width="100%">
        <tr>
            <td id="_invisibleIfEmpty" name="_invisibleIfEmpty" colspan="3" valign="top" width="100%">
                <WebPartPages:WebPartZone runat="server" Title="loc:Header" ID="Header" FrameType="TitleBarOnly">
                    <ZoneTemplate></ZoneTemplate>
                </WebPartPages:WebPartZone>
            </td>
        </tr>
        <tr>
            <td id="Td1" name="_invisibleIfEmpty" valign="top" height="100%">
                <WebPartPages:WebPartZone runat="server" Title="loc:LeftColumn" ID="LeftColumn" FrameType="TitleBarOnly">
                    <ZoneTemplate></ZoneTemplate>
                </WebPartPages:WebPartZone>
            </td>
            <td id="Td2" name="_invisibleIfEmpty" valign="top" height="100%">
                <WebPartPages:WebPartZone runat="server" Title="loc:MiddleColumn" ID="MiddleColumn"
                    FrameType="TitleBarOnly">
                    <ZoneTemplate></ZoneTemplate>
                </WebPartPages:WebPartZone>
            </td>
            <td id="Td3" name="_invisibleIfEmpty" valign="top" height="100%">
                <WebPartPages:WebPartZone runat="server" Title="loc:RightColumn" ID="RightColumn"
                    FrameType="TitleBarOnly">
                    <ZoneTemplate></ZoneTemplate>
                </WebPartPages:WebPartZone>
            </td>
        </tr>
        <tr>
            <td id="Td4" name="_invisibleIfEmpty" colspan="3" valign="top" width="100%">
                <WebPartPages:WebPartZone runat="server" Title="loc:Footer" ID="Footer" FrameType="TitleBarOnly">
                    <ZoneTemplate></ZoneTemplate>
                </WebPartPages:WebPartZone>
            </td>
        </tr>
        <script type="text/javascript" language="javascript">if (typeof (MSOLayout_MakeInvisibleIfEmpty) == "function") { MSOLayout_MakeInvisibleIfEmpty(); }</script>
    </table>
</asp:Content>
