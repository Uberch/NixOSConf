{ config, lib, ... }: {
	config = lib.mkIf config.obsidian.enable {
		programs.obsidian = {
			enable = true;
			defaultSettings = {
				app = {
					# Editor
					focusNewTab = true;
					defaultViewMode = "source";
					livePreview = false;
					# Display
					readableLineLength = false;
					strictLineBreaks = false;
					propertiesInDocument = "visible";
					foldHeading = true;
					foldIndent = true;
					showLineNumber = true;
					showIndentGuide = true;
					rightToLeft = false;
					# Behavior
					spellcheck = true;
					autoPairBrackets = false;
					autoPairMarkdown = false;
					smartIndentList = true;
					useTab = true;
					tabSize = 3;
					# Advanced
					autoConvertHtml = true;
					vimMode = true;

					# Files and links
					# openBehaviour = "daily";
					newFileLocation = "current";
					attachmentFolderPath = "Cache";
					# Links
					newLinkFormat = "absolute";
					alwaysUpdateLinks = true;
					useMarkdownLinks = false;
					showUnsupportedFiles = false;
					# Trash
					promptDelete = true;
					trashOption = "local";
					# Advanced
					userIgnoreFilters = [
						"templates/"
						"Шаблоны/"
					];
					uriCallbacks = false;

					# Appearance
					showInlineTitle = true;
				};
				appearance = {
					# General
					theme = "system";
					accentColor = "#6a34ea";
					# Interface
					showViewHeader = false;
					showRibbon = true;
					# Font
					interfaceFontFamily = "";
					textFontFamily = "";
					monospaceFontFamily = "";
					baseFontSize = 16;
					baseFontSizeAction = false;
					nativeMenus = false;
				};
				# corePlugins = {
				# };
				# communityPlugins = {
				# };
				# cssSnippets = {
				# };
				# extraFiles = {
				# };
				hotkeys = {
					"markdown:add-metadata-property" = [
						{
							"modifiers" = [
								"Mod"
							];
							"key" = ";";
						}
					];
					"window:zoom-out" = [
						{
							modifiers = [
								"Mod"
							];
							key = "-";
						}
					];
					"window:zoom-in" = [
						{
							modifiers = [
								"Mod"
							];
							key = "=";
						}
					];
				};
				themes = {
				};
			};
			vaults = {
			};
		};
	};
}
