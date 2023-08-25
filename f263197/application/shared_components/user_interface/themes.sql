prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 263197
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.3'
,p_default_workspace_id=>51657031814996340916
,p_default_application_id=>263197
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HRITIKSPACE'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(53519137311485916959)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(53518502062468916840)
,p_default_dialog_template=>wwv_flow_imp.id(53518496827420916838)
,p_error_template=>wwv_flow_imp.id(53518486886778916833)
,p_printer_friendly_template=>wwv_flow_imp.id(53518502062468916840)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(53518486886778916833)
,p_default_button_template=>wwv_flow_imp.id(53519052227010916913)
,p_default_region_template=>wwv_flow_imp.id(53518978803311916877)
,p_default_chart_template=>wwv_flow_imp.id(53518978803311916877)
,p_default_form_template=>wwv_flow_imp.id(53518978803311916877)
,p_default_reportr_template=>wwv_flow_imp.id(53518978803311916877)
,p_default_tabform_template=>wwv_flow_imp.id(53518978803311916877)
,p_default_wizard_template=>wwv_flow_imp.id(53518978803311916877)
,p_default_menur_template=>wwv_flow_imp.id(53518991297455916883)
,p_default_listr_template=>wwv_flow_imp.id(53518978803311916877)
,p_default_irr_template=>wwv_flow_imp.id(53518968971788916873)
,p_default_report_template=>wwv_flow_imp.id(53519017097199916895)
,p_default_label_template=>wwv_flow_imp.id(53519049748295916912)
,p_default_menu_template=>wwv_flow_imp.id(53519053807687916914)
,p_default_calendar_template=>wwv_flow_imp.id(53519053929193916914)
,p_default_list_template=>wwv_flow_imp.id(53519033425015916904)
,p_default_nav_list_template=>wwv_flow_imp.id(53519045215001916909)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(53519045215001916909)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(53519039802943916907)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(53518914968430916848)
,p_default_dialogr_template=>wwv_flow_imp.id(53518912102960916847)
,p_default_option_label=>wwv_flow_imp.id(53519049748295916912)
,p_default_required_label=>wwv_flow_imp.id(53519051040712916913)
,p_default_navbar_list_template=>wwv_flow_imp.id(53519039494592916906)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/23.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
