prompt --application/shared_components/security/app_access_control/administrator
begin
--   Manifest
--     ACL ROLE: Administrator
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.3'
,p_default_workspace_id=>51657031814996340916
,p_default_application_id=>263197
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HRITIKSPACE'
);
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(55333643171560078641)
,p_static_id=>'ADMINISTRATOR'
,p_name=>'Administrator'
);
wwv_flow_imp.component_end;
end;
/
