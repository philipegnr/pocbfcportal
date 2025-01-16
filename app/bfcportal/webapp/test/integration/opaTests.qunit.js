sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'bfc/bfcportal/test/integration/FirstJourney',
		'bfc/bfcportal/test/integration/pages/TransportRequisitionList',
		'bfc/bfcportal/test/integration/pages/TransportRequisitionObjectPage',
		'bfc/bfcportal/test/integration/pages/TransportRequisitionItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, TransportRequisitionList, TransportRequisitionObjectPage, TransportRequisitionItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('bfc/bfcportal') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTransportRequisitionList: TransportRequisitionList,
					onTheTransportRequisitionObjectPage: TransportRequisitionObjectPage,
					onTheTransportRequisitionItemObjectPage: TransportRequisitionItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);