require(["sbt/dom", "sbt/connections/controls/vcard/ProfileVCard"], function(dom, ProfileVCard) {
    var profileCard = new ProfileVCard({ userName : "%{sample.displayName1}", userId : "%{sample.id1}" });
   
    dom.byId("vcardDiv").appendChild(profileCard.domNode);
});
