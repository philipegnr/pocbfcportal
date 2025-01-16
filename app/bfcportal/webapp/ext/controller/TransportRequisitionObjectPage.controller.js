sap.ui.define([
	"sap/ui/core/mvc/ControllerExtension",
	"sap/ui/core/Element",
	'sap/ui/core/mvc/Controller',
	'sap/m/MessageStrip',
	'sap/ui/core/InvisibleMessage',
	'sap/ui/core/library'

], function (ControllerExtension, Element, Controller, MessageStrip, InvisibleMessage, library) {
	'use strict';

	return ControllerExtension.extend('bfc.bfcportal.ext.controller.TransportRequisitionObjectPage', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
			 * Called when a controller is instantiated and its View controls (if available) are already created.
			 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
			 * @memberOf bfc.bfcportal.ext.controller.TransportRequisitionObjectPage
			 */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();

			},

			onBeforeRendering: function () {

/* 				this.oInvisibleMessage = InvisibleMessage.getInstance();

				//this.oInvisibleMessage = InvisibleMessage.getInstance();
				var aTypes = ["Information", "Warning", "Error", "Success"],
					sText = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam, quis nostrud exercitation ullamco.",
					sType = aTypes[Math.round(Math.random() * 3)];

				var oMsgStrip = new MessageStrip("msgStrip", {
					text: sText,
					showCloseButton: !(Math.round(Math.random())),
					showIcon: !(Math.round(Math.random())),
					type: sType
				});

				var oHorizontalLayout = new sap.ui.layout.HorizontalLayout("idHorizontalLayout");
				oHorizontalLayout.addContent(oMsgStrip);

				var oContent = this.getView().getAggregation("content");

				oContent[0].setAggregation(oHorizontalLayout); */

				//this.oInvisibleMessage.announce("New Information Bar of type " + sType + " " + sText, InvisibleMessageMode.Assertive);
				//oVC.addContent(oMsgStrip);
			}

		}
	});
});
