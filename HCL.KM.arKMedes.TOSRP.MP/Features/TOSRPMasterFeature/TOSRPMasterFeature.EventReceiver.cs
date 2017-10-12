using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Publishing.Navigation;
using System.Linq;
using Microsoft.SharePoint.Publishing;
using Microsoft.SharePoint.Navigation;

namespace HCL.KM.arKMedes.TOSRP.MP.Features.TOSRPMasterFeature
{
    /// <summary>
    /// This class handles events raised during feature activation, deactivation, installation, uninstallation, and upgrade.
    /// </summary>
    /// <remarks>
    /// The GUID attached to this class may be used during packaging and should not be modified.
    /// </remarks>

    [Guid("ff0a37f9-2e52-4a41-aafe-cb9405dc1460")]
    public class TOSRPMasterFeatureEventReceiver : SPFeatureReceiver
    {
        // Uncomment the method below to handle the event raised after a feature has been activated.

        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
            SPSecurity.RunWithElevatedPrivileges(delegate()
            {
                SPWeb curWeb = (SPWeb)properties.Feature.Parent;
                //Create full matser page URL
                Uri masterUri = new Uri(curWeb.Url + "/_catalogs/masterpage/TOSRPMaster.master");
                Uri systemMasterUri = new Uri(curWeb.Url + "/_catalogs/masterpage/TOSRPMaster.master");

                curWeb.MasterUrl = systemMasterUri.AbsolutePath.Replace("%20", " ");
                curWeb.CustomMasterUrl = masterUri.AbsolutePath.Replace("%20", " ");
                curWeb.SiteLogoUrl = new Uri(curWeb.Url + "/_layouts/15/images/arKMedes/TOS/OnboardingLogo.png").AbsolutePath;
                curWeb.Update();
                //create groups


                string[] groupNames = { "ERS", "INFRA", "NewVista", "KO", "Others", "SI&Apps" };
                SPUser _SPUser = curWeb.EnsureUser("SharePoint\\system");
                SPMember groupOwner = _SPUser;
                SPUser defaultUser = _SPUser;
                try
                {
                    curWeb.AllowUnsafeUpdates = true;
                    foreach (string groupName in groupNames)
                    {
                        if (!curWeb.HasUniqueRoleAssignments)
                        {
                            // Removing any existing permissions from Site
                            curWeb.BreakRoleInheritance(false);
                            //curWeb.Update();
                        }

                        int Count = curWeb.SiteGroups.OfType<SPGroup>().Count(g => g.Name.Equals(groupName));
                        if (Count == 0)
                        {
                            if (groupName == "KO")
                            {
                                string strDesc = "Use " + groupName + " group to give people Full Control permissions for this site";
                                CreateGroup(curWeb, groupOwner, defaultUser, groupName, strDesc, SPRoleType.Administrator);
                            }
                            else
                            {
                                string strDesc = "Use " + groupName + " group to give people Read permissions for this site";
                                CreateGroup(curWeb, groupOwner, defaultUser, groupName, strDesc, SPRoleType.Reader);
                            }

                        }
                    }
                    curWeb.AllowUnsafeUpdates = false;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
                //CreateSiteNavigation(properties);

            });
        }

        private static void CreateGroup(SPWeb curWeb, SPMember groupOwner, SPUser defaultUser, string groupName, string strDesc, SPRoleType _SPRoleType)
        {
            curWeb.SiteGroups.Add(groupName, groupOwner, defaultUser, strDesc);
            curWeb.Update();

            //Set group to a unique permission
            SPGroup group = curWeb.SiteGroups[groupName];
            SPRoleAssignment spRoleAssignment = new SPRoleAssignment(group);
            SPRoleDefinition roleDefinition = curWeb.RoleDefinitions.GetByType(_SPRoleType);
            spRoleAssignment.RoleDefinitionBindings.Add(roleDefinition);

            curWeb.RoleAssignments.Add(spRoleAssignment);
            curWeb.Update();
        }
        //private static void CreateRootFolder(SPWeb curweb, string folderName, string folderDescription)
        //{
        //    curweb.Lists.Add(folderName, folderDescription, SPListTemplateType.DocumentLibrary);
        //    curweb.RootFolder
        //}

        // Uncomment the method below to handle the event raised before a feature is deactivated.
        private static void CreateSiteNavigation(SPFeatureReceiverProperties prop)
        {
            SPSite site = prop.Feature.Parent as SPSite;
            SPWeb rootWeb = site.RootWeb;
            SPNavigationNodeCollection topNavNodes = rootWeb.Navigation.TopNavigationBar;

            



            SPNavigationNode node = new SPNavigationNode("DashboardNav", "", true);
            topNavNodes.AddAsLast(node);          

            SPNavigationNode oNewNode = new SPNavigationNode("Org Browser", "");
            rootWeb.Navigation.TopNavigationBar.AddAsLast(oNewNode);
            oNewNode.Properties.Add("NodeType", "Heading");
            oNewNode.Update();

            SPNavigationNode oChild1 = new SPNavigationNode("Official", "");
            oNewNode.Children.AddAsFirst(oChild1);
            oChild1.Properties.Add("NodeType", "Heading");
            oChild1.Update();



           // rootWeb.Navigation.UseShared = false;
            rootWeb.Update();

            //SPNavigationNode oNewNode = new SPNavigationNode("Org Browser", "");
            //rootWeb.Navigation.TopNavigationBar.AddAsLast(oNewNode);
            //oNewNode.Properties.Add("NodeType", "Heading");
            //oNewNode.Update();
           
        }
        public override void FeatureDeactivating(SPFeatureReceiverProperties properties)
        {
            SPWeb curWeb = (SPWeb)properties.Feature.Parent;
            //Create full matser page URL
            Uri masterUri = new Uri(curWeb.Url + "/_catalogs/masterpage/seattle.master");
            Uri systemMasterUri = new Uri(curWeb.Url + "/_catalogs/masterpage/seattle.master");

            curWeb.MasterUrl = systemMasterUri.AbsolutePath.Replace("%20", " ");
            curWeb.CustomMasterUrl = masterUri.AbsolutePath.Replace("%20", " ");
            curWeb.SiteLogoUrl = "";//"/_layouts/15/images/siteIcon.png";

            curWeb.Update();
        }


        // Uncomment the method below to handle the event raised after a feature has been installed.

        //public override void FeatureInstalled(SPFeatureReceiverProperties properties)
        //{
        //}


        // Uncomment the method below to handle the event raised before a feature is uninstalled.

        //public override void FeatureUninstalling(SPFeatureReceiverProperties properties)
        //{
        //}

        // Uncomment the method below to handle the event raised when a feature is upgrading.

        //public override void FeatureUpgrading(SPFeatureReceiverProperties properties, string upgradeActionName, System.Collections.Generic.IDictionary<string, string> parameters)
        //{
        //}
    }
}
