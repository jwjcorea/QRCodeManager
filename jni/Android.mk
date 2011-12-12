# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE    := iriverdicple
LOCAL_SRC_FILES := /source/engine/dicengine/DicEngine/Dicple_DBEngine_BufferSwitching.c \
				   /source/engine/dicengine/DicEngine/Dicple_DBEngine_Debug.c \
				   /source/engine/dicengine/DicEngine/Dicple_DBEngine_GetStruct.c \
				   /source/engine/dicengine/DicEngine/Dicple_DBEngine_Resource.c \
				   /source/engine/dicengine/DicEngine/queryInterface.c \
				   /source/engine/dicengine/DicEngine/queryInterfaceEtcFunctions.c \
				   /source/engine/dicengine/DicEngine/DICAPI/BUSU/Dicple_DBEngine_BusuList.c \
				   /source/engine/dicengine/DicEngine/DICAPI/BUSU/Dicple_DBEngine_GetBusu.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CATEGORYLIST/Dicple_DBEngine_CATGDisplay.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CATEGORYLIST/Dicple_DBEngine_CATGMove.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CLIP/Dicple_DBEngine_Clip.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CONTENT/Dicple_DBEngine_CTCSDInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CONTENT/Dicple_DBEngine_CTDisplay.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CONTENT/Dicple_DBEngine_CTDrag.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CONTENT/Dicple_DBEngine_CTGetData.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CONTENT/Dicple_DBEngine_CTMove.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CONTENT/Dicple_DBEngine_CTParsing.c \
				   /source/engine/dicengine/DicEngine/DICAPI/CONTENT/Dicple_DBEngine_CTTabInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/DECODER/Dicple_DBEngine_jzDecoder.c \
				   /source/engine/dicengine/DicEngine/DICAPI/E_CONTENT/Dicple_DBEngine_CTSpring.c \
				   /source/engine/dicengine/DicEngine/DICAPI/E_CONTENT/Dicple_DBEngine_HanjaPopupList.c \
				   /source/engine/dicengine/DicEngine/DICAPI/E_CONTENT/Dicple_DBEngine_HanjaPrackList.c \
				   /source/engine/dicengine/DicEngine/DICAPI/FK_CONJ/Dicple_DBEngine_FK_CONJ_List.c \
				   /source/engine/dicengine/DicEngine/DICAPI/FK_CONJ/Dicple_DBEngine_Get_FK_CONJ.c \
				   /source/engine/dicengine/DicEngine/DICAPI/GK_KONJ/Dicple_DBEngine_Get_GK_KONJ.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HELP/Dicple_DBEngine_Option_HelpList.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HIGHLIGHT/Dicple_DBEngine_HPen.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HIGHLIGHT/Dicple_DBEngine_HPen_CTProc.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HISTORY/Dicple_DBEngine_History_Info.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HISTORY/Dicple_DBEngine_History_List.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HWLIST/Dicple_DBEngine_ALLHWDisplay.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HWLIST/Dicple_DBEngine_ALLHWMove.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HWLIST/Dicple_DBEngine_HWDisplay.c \
				   /source/engine/dicengine/DicEngine/DICAPI/HWLIST/Dicple_DBEngine_HWMove.c \
				   /source/engine/dicengine/DicEngine/DICAPI/IME/Dicple_DBEngine_conv_sungjo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/IME/Dicple_DBEngine_Trans_EngToJap.c \
				   /source/engine/dicengine/DicEngine/DICAPI/IME/Dicple_DBEngine_Trans_EngToKor.c \
				   /source/engine/dicengine/DicEngine/DICAPI/JUMP/Dicple_DBEngine_Jump.c \
				   /source/engine/dicengine/DicEngine/DICAPI/LINKSEARCH/Dicple_DBEngine_LinkSearch.c \
				   /source/engine/dicengine/DicEngine/DICAPI/MENU/Dicple_DBEngine_DicInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/MENU/Dicple_DBEngine_MenuList.c \
				   /source/engine/dicengine/DicEngine/DICAPI/MENU/Dicple_DBEngine_SearchInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/OPTION/Dicple_DBEngine_OptionInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/RAWINFO/Dicple_DBEngine_GetRawInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/RAWINFO/Dicple_DBEngine_GetTTSInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/RESUME/Dicple_DBEngiine_Resume.c \
				   /source/engine/dicengine/DicEngine/DICAPI/SEARCH/Dicple_DBEngine_GeneralSearch.c \
				   /source/engine/dicengine/DicEngine/DICAPI/SEARCH/Dicple_DBEngine_TotalSearch.c \
				   /source/engine/dicengine/DicEngine/DICAPI/VIEW/Dicple_DBEngiine_ChangeView.c \
				   /source/engine/dicengine/DicEngine/DICAPI/VIEW/Dicple_DBEngine_View.c \
				   /source/engine/dicengine/DicEngine/DICAPI/WORD/Dicple_DBEngine_WordEdit.c \
				   /source/engine/dicengine/DicEngine/DICAPI/WORD/Dicple_DBEngine_WordInfo.c \
				   /source/engine/dicengine/DicEngine/DICAPI/WORD/Dicple_DBEngine_WordList.c \
				   /source/engine/dicengine/DicEngine/DICAPI/WORD/Dicple_DBEngine_WordMain.c \
				   /source/engine/dicengine/DicEngine/DICAPI/WORD/Dicple_DBEngine_WordSetting.c \
				   /source/engine/dicengine/DicEngine/DICFILEFUNC/Dicple_DBEngine_FileFunc.c \
				   /source/engine/dicengine/DicEngine/DICFONT/Dicple_DBEngine_DicFontFunc.c \
				   /source/engine/dicengine/DicEngine/DICGDI/Dicple_DBEngine_GDIFunc.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/Dicple_DBEngine_S_SearchUI.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/SEARCH/Dicple_DBEngine_S_Constant.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/SEARCH/Dicple_DBEngine_S_FileAccess.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/SEARCH/Dicple_DBEngine_S_GetSearchWord.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/SEARCH/Dicple_DBEngine_S_String.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/SEARCH/Dicple_DBEngine_Search1Item.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/SEARCH/Dicple_DBEngine_Search.c \
				   /source/engine/dicengine/DicEngine/DICSEARCH/SEARCH/Dicple_DBEngine_SearchTotal.c \
				   /source/engine/dicengine/DicEngine/DICSTRCONT/Dicple_DBEngine_DicStrFunc.c \
				   /source/engine/dicengine/DicEngine/DICSTRCONT/Dicple_DBEngine_OtherFunc.c \
				   /source/engine/dicengine/DicEngine/DICSTRCONT/Dicple_DBEngine_StrFunc.c \
				   /source/engine/dicengine/DicEngine/DICSTRCONT/Dicple_DBEngine_WStrFunc.c \
				   /source/util/utility.c \
				   /source/ui/dic/dic/Common/crc32.c \
				   
LOCAL_LDLIBS := -llog 
				 
				   

				   
include $(BUILD_SHARED_LIBRARY)