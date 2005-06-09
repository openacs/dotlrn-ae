ad_library {
    Procedures for registering implementations for the
    dotlrn anon-eval package. 

    @creation-date 2005-06-01
    @author Anny Flores (annyflores@viaro.net)
    @author Viaro Networks (www.viaro.net)

}

namespace eval dotlrn_ae {}

ad_proc -public dotlrn_ae::install {} {
    dotLRN Anon Eval package install proc
} {
    register_portal_datasource_impl
}

ad_proc -public dotlrn_ae::uninstall {} {
    dotLRN Anon Eval package uninstall proc
} {
    unregister_portal_datasource_impl
}

ad_proc -public dotlrn_ae::register_portal_datasource_impl {} {
    Register the service contract implementation for the dotlrn_applet service contract
} {
    set spec {
        name "dotlrn_ae"
	contract_name "dotlrn_applet"
	owner "dotlrn-ae"
        aliases {
	    GetPrettyName dotlrn_ae::get_pretty_name
	    AddApplet dotlrn_ae::add_applet
	    RemoveApplet dotlrn_ae::remove_applet
	    AddAppletToCommunity dotlrn_ae::add_applet_to_community
	    RemoveAppletFromCommunity dotlrn_ae::remove_applet_from_community
	    AddUser dotlrn_ae::add_user
	    RemoveUser dotlrn_ae::remove_user
	    AddUserToCommunity dotlrn_ae::add_user_to_community
	    RemoveUserFromCommunity dotlrn_ae::remove_user_from_community
	    AddPortlet dotlrn_ae::add_portlet
	    RemovePortlet dotlrn_ae::remove_portlet
	    Clone dotlrn_ae::clone
	    ChangeEventHandler dotlrn_ae::change_event_handler
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}

ad_proc -public dotlrn_ae::unregister_portal_datasource_impl {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "dotlrn_applet" \
        -impl_name "dotlrn_ae"
}

