require([ "sbt/dom", "sbt/json", "sbt/connections/CommunityService" ], function(dom,json,CommunityService) {
    var communityService = new CommunityService();
    var communityId = "%{sample.communityId}";
    var promise = communityService.getSubCommunities(communityId, {    
            asc : true,
            email : "%{sample.email1}",
            page : 1,
            ps : 10,
            since : "2009-01-04T20:32:31.171Z",
            sortField  : "lastmod"
        });
    promise.then(
        function(communities) {
            dom.setText("json", json.jsonBeanStringify(communities));
        },
        function(error) {
            dom.setText("json", json.jsonBeanStringify(error));
        }
    );
});
