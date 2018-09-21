/**
 * @license Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	 // Define changes to default configuration here. For example:
    config.language = 'ko';
    config.uiColor = '#FCE4C5';
    config.font_names = '맑은 고딕; 돋움; 바탕; 돋음; 궁서; Nanum Gothic Coding; Quattrocento Sans;' + CKEDITOR.config.font_names; 
    config.height = '250px';  //Editor 높이  
    config.width = '100%';
    config.enterMode =CKEDITOR.ENTER_BR;
    config.toolbarCanCollapse = true;
    config.docType = "<!DOCTYPE html>";
    config.filebrowserFlashUploadUrl = 'imageUpload'
    config.filebrowserImageUploadUrl = 'imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다.
    config.removePlugins = 'save'
};


