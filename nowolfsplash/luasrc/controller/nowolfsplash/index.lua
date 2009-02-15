module("luci.controller.nowolfsplash.index", package.seeall)

function index()
    entry({"nowolfsplash"}, call("show_agreement"), "Click here", 10).dependent=false
end
 
function show_agreement()
    local remote_addr = luci.sys.getenv("REMOTE_ADDR") 
    local mac = luci.sys.net.ip4mac(luci.http.getenv("REMOTE_ADDR")) or "" 
    local isAccepted = luci.http.formvalue ("submit")  	
    if isAccepted then
    	require "os"
--	os.execute("iptables" .. mac .. "ciao")
    	luci.template.render("nowolfsplash/welcome", {})
    else
    	luci.template.render("nowolfsplash/splash", {}) 
    end
end

        