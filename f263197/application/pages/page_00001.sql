prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.3'
,p_default_workspace_id=>51657031814996340916
,p_default_application_id=>263197
,p_default_id_offset=>0
,p_default_owner=>'WKSP_HRITIKSPACE'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Timeline'
,p_alias=>'HOME'
,p_step_title=>'Connecto'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.actions.add([{',
'    name: "like",',
'    action: (event, element, args) => {',
'        apex.items.P1_ACTION_ID.value = args.id;',
'        apex.event.trigger(document, ''action-like'');',
'        }',
'    }, {',
'    name: "delete",',
'    action: (event, element, args) => {',
'        apex.items.P1_ACTION_ID.value = args.id;',
'        apex.event.trigger(document, ''action-delete'');',
'        }',
'    }]);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.user-has-liked {',
'color: red;',
'}',
'',
'@media (max-width: 640px) {',
'    .new-post-button {',
'        position: fixed;',
'        bottom: 24px;',
'        right: 24px;',
'        z-index: 1000;',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'HRITIK.A.AGRAHARI@ORACLE.COM'
,p_last_upd_yyyymmddhh24miss=>'20230825065012'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53939424946075523901)
,p_plug_name=>'Post'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize:js-headingLevel-1'
,p_plug_template=>wwv_flow_imp.id(53518954318305916866)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_04'
,p_query_type=>'TABLE'
,p_query_table=>'SM_POSTS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53939427533729523927)
,p_plug_name=>'Timeline'
,p_region_name=>'timeline'
,p_region_css_classes=>'t-Chat'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(53518919286642916850)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    p.id,',
'    p.created_by AS user_name,',
'    p.post_comment AS comment_text,',
'    p.file_blob,',
'    p.file_mime,',
'',
'    apex_util.get_since(p.created) post_date,',
'',
'    (',
'        select count(*) from SM_REACTIONS smr ',
'        where smr.post_id=p.id',
'    ) as REACTIONS,',
'',
'    (',
'        select ''user-has-liked'' from SM_REACTIONS smr ',
'        where smr.post_id=p.id and created_by=:APP_USER',
'    ) USER_REACTION_CSS',
'',
'    from SM_POSTS p ',
'',
'    order by p.created desc'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(53939427634155523928)
,p_region_id=>wwv_flow_imp.id(53939427533729523927)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'POST_DATE'
,p_body_adv_formatting=>false
,p_body_column_name=>'COMMENT_TEXT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'USER_NAME'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'FILE_BLOB'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'SQUARE'
,p_media_sizing=>'COVER'
,p_media_css_classes=>'selectDisable'
,p_media_description=>'&COMMENT_TEXT.'
,p_pk1_column_name=>'ID'
,p_mime_type_column_name=>'FILE_MIME'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(53939427782062523929)
,p_card_id=>wwv_flow_imp.id(53939427634155523928)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'&REACTIONS.'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$like?id=&ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-heart &USER_REACTION_CSS.'
,p_action_css_classes=>'js-heart-button'
,p_is_hot=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(53939427868104523930)
,p_card_id=>wwv_flow_imp.id(53939427634155523928)
,p_action_type=>'BUTTON'
,p_position=>'SECONDARY'
,p_display_sequence=>20
,p_label=>'Delete'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$delete?id=&ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-trash-o'
,p_is_hot=>false
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>':USER_NAME=:APP_USER'
,p_condition_expr2=>'PLSQL'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(53939426820059523920)
,p_button_sequence=>10
,p_button_name=>'ADD_POST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(53519052319564916914)
,p_button_image_alt=>'Add Post'
,p_button_position=>'AFTER_LOGO'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'new-post-button'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(53939427145475523923)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_button_name=>'Save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(53519052227010916913)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'post-button'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939425122298523903)
,p_name=>'P1_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_item_source_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939425287662523904)
,p_name=>'P1_POST_COMMENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_item_source_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_prompt=>'Post'
,p_source=>'POST_COMMENT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(53519049748295916912)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939425304979523905)
,p_name=>'P1_FILE_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_item_source_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_prompt=>'Photo'
,p_source=>'FILE_BLOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(53519049459506916912)
,p_item_css_classes=>'file-upload'
,p_item_icon_css_classes=>'fa-camera-retro'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIME'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_08=>'attachment'
,p_attribute_11=>'image/*'
,p_attribute_12=>'DROPZONE_BLOCK'
,p_attribute_13=>'Share a photo..'
,p_attribute_14=>'Select or drop a photo'
,p_attribute_15=>'10000'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939425632539523908)
,p_name=>'P1_LAT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_item_source_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_source=>'LAT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939425727591523909)
,p_name=>'P1_LON'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_item_source_plug_id=>wwv_flow_imp.id(53939424946075523901)
,p_source=>'LON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53939427910550523931)
,p_name=>'P1_ACTION_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(53939427533729523927)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(53939426937590523921)
,p_name=>'Open post dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(53939426820059523920)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53939427077315523922)
,p_event_id=>wwv_flow_imp.id(53939426937590523921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(53939424946075523901)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(53939427275601523924)
,p_name=>'Submit post'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(53939427145475523923)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''P1_FILE_BLOB'').value.length>0 ||',
'apex.item(''P1_POST_COMMENT'').value.length>0'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53939427325298523925)
,p_event_id=>wwv_flow_imp.id(53939427275601523924)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'Save'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(53939428019535523932)
,p_name=>'action-like'
,p_event_sequence=>30
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-like'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53939428121706523933)
,p_event_id=>wwv_flow_imp.id(53939428019535523932)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'LIKE - update UI (adjust count + heart color)'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const button = $(''[data-id="''+ apex.items.P1_ACTION_ID.value +''"] .js-heart-button''); // get the card',
'',
'    const label = button.find(''.a-CardView-buttonLabel''); // get the likes count section',
'',
'    const icon = button.find(''.a-CardView-buttonIcon''); // gets the element if its liked already',
'',
'    let likeCount = label.text(); // get the like count',
'',
'    if (icon.hasClass(''user-has-liked'')) {',
'        // user has liked this already, and they are unliking it now -- decrement',
'        label.text(--likeCount);',
'',
'    } else {',
'        // user is liking the post -- increment',
'        label.text(++likeCount);',
'    }',
'',
'    icon.toggleClass(''user-has-liked''); // either add this class or remove it'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53939428235187523934)
,p_event_id=>wwv_flow_imp.id(53939428019535523932)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'LIKE -- do database work'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    -- try to store this posts'' reaction from this user',
'    insert into SM_REACTIONS (post_id, reaction, lat, lon)',
'        values (:P1_ACTION_ID, ''LIKED'', :P1_LAT, :P1_LON);',
'    exception when dup_val_on_index then',
'        -- remove it as it already existed',
'        delete from SM_REACTIONS where',
'            post_id=:P1_ACTION_ID and created_by=:APP_USER;',
'    end;'))
,p_attribute_02=>'P1_ACTION_ID,P1_LAT,P1_LON'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(53939428315362523935)
,p_name=>'action-delete'
,p_event_sequence=>40
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'action-delete'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53939428453090523936)
,p_event_id=>wwv_flow_imp.id(53939428315362523935)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>unistr('DELETE \2013 Confirm dialog')
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'You are about to delete this post. Are you sure?'
,p_attribute_02=>'Are you Sure?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53939428559270523937)
,p_event_id=>wwv_flow_imp.id(53939428315362523935)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>unistr('DELETE \2013 do database work')
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'delete from SM_POSTS where id=:P1_ACTION_ID and created_by=:APP_USER;'
,p_attribute_02=>'P1_ACTION_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53939428697556523938)
,p_event_id=>wwv_flow_imp.id(53939428315362523935)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>unistr('DELETE \2013 remove post in UI')
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''[data-id=''+apex.items.P1_ACTION_ID.value+'']'').remove();'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(53939427496609523926)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(53939424946075523901)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Insert Post'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Posted!'
,p_internal_uid=>53939427496609523926
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(53939425038935523902)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(53939424946075523901)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Home'
,p_internal_uid=>53939425038935523902
);
wwv_flow_imp.component_end;
end;
/
