sap.ui.define(
    ["sap/fe/core/AppComponent"],
    function (Component) {
        "use strict";

        return Component.extend("quickapp.Component", {
            metadata: {
                manifest: "json"
            },
            PressSend: function() {
                console.log("PressSend");
            }
        });
    }
);