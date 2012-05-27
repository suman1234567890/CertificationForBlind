/*
Copyright (c) 2012 jqWidgets.
http://jqwidgets.com/license/
*/

(function(a){a.jqx=a.jqx||{};a.jqx.define=function(b,c,d){b[c]=function(){if(this.baseType){this.base=new b[this.baseType]();this.base.defineInstance()}this.defineInstance()};b[c].prototype.defineInstance=function(){};b[c].prototype.base=null;b[c].prototype.baseType=undefined;if(d&&b[d]){b[c].prototype.baseType=d}};a.jqx.invoke=function(d,c){if(c.length==0){return}var e=typeof(c)==Array||c.length>0?c[0]:c;var b=typeof(c)==Array||c.length>1?Array.prototype.slice.call(c,1):a({}).toArray();while(d[e]==undefined&&d.base!=null){d=d.base}if(d[e]!=undefined&&a.isFunction(d[e])){return d[e].apply(d,b)}return};a.jqx.hasFunction=function(d,c){if(c.length==0){return false}if(d==undefined){return false}var e=typeof(c)==Array||c.length>0?c[0]:c;var b=typeof(c)==Array||c.length>1?Array.prototype.slice.call(c,1):{};while(d[e]==undefined&&d.base!=null){d=d.base}if(d[e]&&a.isFunction(d[e])){return true}return false};a.jqx.isPropertySetter=function(b){if(b.length==2){return true}return b.length==1&&typeof(b[0])=="object"};a.jqx.set=function(c,b){if(b.length==1&&typeof(b[0])=="object"){a.each(b[0],function(d,e){var f=c;while(f[d]==undefined&&f.base!=null){f=f.base}if(f[d]!=undefined||f[d]==null){a.jqx.setvalueraiseevent(f,d,e)}})}else{if(b.length==2){while(c[b[0]]==undefined&&c.base){c=c.base}if(c[b[0]]!=undefined||c[b[0]]==null){a.jqx.setvalueraiseevent(c,b[0],b[1])}}}};a.jqx.setvalueraiseevent=function(c,d,e){var b=c[d];c[d]=e;if(!c.isInitialized){return}if(c.propertyChangedHandler!=undefined){c.propertyChangedHandler(c,d,b,e)}if(c.propertyChangeMap!=undefined&&c.propertyChangeMap[d]!=undefined){c.propertyChangeMap[d](c,d,b,e)}};a.jqx.get=function(c,b){if(b==undefined||b==null){return undefined}if(c[b]!=undefined){return c[b]}if(b.length!=1){return undefined}while(c[b[0]]==undefined&&c.base){c=c.base}if(c[b[0]]!=undefined){return c[b[0]]}};a.jqx.jqxWidgetProxy=function(h,c,b){var d=a(c);var f=a.data(c,h);if(f==undefined){return undefined}var e=f.instance;if(a.jqx.hasFunction(e,b)){return a.jqx.invoke(e,b)}if(a.jqx.isPropertySetter(b)){a.jqx.set(e,b);return undefined}else{if(typeof(b)=="object"&&b.length==0){return}else{if(typeof(b)=="object"&&b.length>0){return a.jqx.get(e,b[0])}else{if(typeof(b)=="string"){return a.jqx.get(e,b)}}}}throw"jqxCore: Property or method does not exist.";return undefined};a.jqx.jqxWidget=function(b,c,i){try{jqxArgs=Array.prototype.slice.call(i,0)}catch(h){jqxArgs=""}var f=b;var d="";if(c){d="_"+c}a.jqx.define(a.jqx,"_"+f,d);a.fn[f]=function(){var e=Array.prototype.slice.call(arguments,0);var k=null;if(e.length==0||(e.length==1&&typeof(e[0])=="object")){return this.each(function(){var o=a(this);var n=this;var q=a.data(n,f);if(q==null){q={};q.element=n;q.host=o;q.instance=new a.jqx["_"+f]();a.data(n,f,q);var p=new Array();var l=q.instance;while(l){l.isInitialized=false;p.push(l);l=l.base}p.reverse();p[0].theme="";a.jqx.jqxWidgetProxy(f,this,e);for(var m in p){l=p[m];if(m==0){l.host=o;l.element=n}if(l.createInstance!=null){l.createInstance(e)}}for(var m in p){p[m].isInitialized=true}q.instance.refresh();k=this}else{a.jqx.jqxWidgetProxy(f,this,e)}})}else{this.each(function(){var l=a.jqx.jqxWidgetProxy(f,this,e);if(k==null){k=l}})}if(a.browser.msie&&a.browser.version<7){a.jqx.utilities.correctPNG()}return k};try{a.extend(a.jqx["_"+f].prototype,Array.prototype.slice.call(i,0)[0])}catch(h){}a.extend(a.jqx["_"+f].prototype,{toThemeProperty:function(e,k){if(this.theme==""){return e}if(k!=null&&k){return e+"-"+this.theme}return e+" "+e+"-"+this.theme}});a.jqx["_"+f].prototype.refresh=function(){if(this.base){this.base.refresh()}};a.jqx["_"+f].prototype.createInstance=function(){};a.jqx["_"+f].prototype.propertyChangeMap={};a.jqx["_"+f].prototype.addHandler=function(m,k,e,l){switch(k){case"mousewheel":if(window.addEventListener){if(a.browser.mozilla){m[0].addEventListener("DOMMouseScroll",e,false)}else{m[0].addEventListener("mousewheel",e,false)}return false}break;case"mousemove":if(window.addEventListener&&!l){m[0].addEventListener("mousemove",e,false);return false}break}if(l==undefined||l==null){m.bind(k,e)}else{m.bind(k,l,e)}};a.jqx["_"+f].prototype.removeHandler=function(l,k,e){switch(k){case"mousewheel":if(window.removeEventListener){if(a.browser.mozilla){l[0].removeEventListener("DOMMouseScroll",e,false)}else{l[0].removeEventListener("mousewheel",e,false)}return false}break}if(e==undefined){l.unbind(k)}else{l.unbind(k,e)}}};a.jqx.utilities=a.jqx.utilities||{};a.extend(a.jqx.utilities,{correctPNG:function(){var h=navigator.appVersion.split("MSIE");var k=parseFloat(h[1]);if((k>=5.5&&k<7)&&(document.body.filters)){for(var d=0;d<document.images.length;d++){var e=document.images[d];var m=e.src.toUpperCase();if(m.substring(m.length-3,m.length)=="PNG"){var f=(e.id)?"id='"+e.id+"' ":"";var n=(e.className)?"class='"+e.className+"' ":"";var c=(e.title)?"title='"+e.title+"' ":"title='"+e.alt+"' ";var l="display:inline-block;"+e.style.cssText;if(e.align=="left"){l="float:left;"+l}if(e.align=="right"){l="float:right;"+l}if(e.parentElement.href){l="cursor:hand;"+l}var b="<span "+f+n+c+' style="width:'+e.width+"px; height:"+e.height+"px;"+l+";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+e.src+"', sizingMethod='scale');\"></span>";e.outerHTML=b;d=d-1}}}},alphaBlend:function(f,d,h){var e=Array(parseInt("0x"+f.substring(1,3)),parseInt("0x"+f.substring(3,5)),parseInt("0x"+f.substring(5,7)));var c=Array(parseInt("0x"+d.substring(1,3)),parseInt("0x"+d.substring(3,5)),parseInt("0x"+d.substring(5,7)));r="0"+Math.round(e[0]+(c[0]-e[0])*h).toString(16);g="0"+Math.round(e[1]+(c[1]-e[1])*h).toString(16);d="0"+Math.round(e[2]+(c[2]-e[2])*h).toString(16);return"#"+r.substring(r.length-2)+g.substring(g.length-2)+d.substring(d.length-2)}});a.jqx.mobile=a.jqx.mobile||{};a.extend(a.jqx.mobile,{setMobileSimulator:function(c,e){if(this.isTouchDevice()){return}this.simulatetouches=true;if(e==false){this.simulatetouches=false}var d={mousedown:"touchstart",mouseup:"touchend",mousemove:"touchmove"};window.addEventListener("load",function(){for(var f in d){if(c.addEventListener){c.addEventListener(f,function(k){var i=b(d[k.type],k);k.target.dispatchEvent(i);var h=k.target["on"+d[k.type]];if(typeof h==="function"){h(k)}},false)}document.addEventListener(f,function(k){var i=b(d[k.type],k);k.target.dispatchEvent(i);var h=k.target["on"+d[k.type]];if(typeof h==="function"){h(k)}},false)}},false);var b=function(f,i){var h=document.createEvent("MouseEvents");h.initMouseEvent(f,i.bubbles,i.cancelable,i.view,i.detail,i.screenX,i.screenY,i.clientX,i.clientY,i.ctrlKey,i.altKey,i.shiftKey,i.metaKey,i.button,i.relatedTarget);h._pageX=i.pageX;h._pageY=i.pageY;return h}},isTouchDevice:function(){var b="Browser CodeName: "+navigator.appCodeName+"";b+="Browser Name: "+navigator.appName+"";b+="Browser Version: "+navigator.appVersion+"";b+="Cookies Enabled: "+navigator.cookieEnabled+"";b+="Platform: "+navigator.platform+"";b+="User-agent header: "+navigator.userAgent+"";if(b.indexOf("Android")!=-1){return true}if(b.indexOf("IEMobile")!=-1){return true}if(b.indexOf("Windows Phone OS")!=-1){return true}if(b.indexOf("Windows Phone 6.5")!=-1){return true}if(b.indexOf("BlackBerry")!=-1&&b.indexOf("Mobile Safari")!=-1){return true}if(b.indexOf("ipod")!=-1){return true}if(b.indexOf("nokia")!=-1||b.indexOf("Nokia")!=-1){return true}if(b.indexOf("Chrome/17")!=-1){return false}try{document.createEvent("TouchEvent");return true}catch(c){return false}},isChromeMobileBrowser:function(){var c=navigator.userAgent.toLowerCase();var b=c.indexOf("android")!=-1;return b},isOperaMiniMobileBrowser:function(){var c=navigator.userAgent.toLowerCase();var b=c.indexOf("opera mini")!=-1||c.indexOf("opera mobi")!=-1;return b},isOperaMiniBrowser:function(){var c=navigator.userAgent.toLowerCase();var b=c.indexOf("opera mini")!=-1;return b},isSafariMobileBrowser:function(){var c=navigator.userAgent.toLowerCase();var b=c.indexOf("ipad")!=-1||c.indexOf("iphone")!=-1||c.indexOf("ipod")!=-1;return b},isIPhoneSafariMobileBrowser:function(){var c=navigator.userAgent.toLowerCase();var b=c.indexOf("iphone")!=-1;return b},isIPadSafariMobileBrowser:function(){var c=navigator.userAgent.toLowerCase();var b=c.indexOf("ipad")!=-1;return b},isMobileBrowser:function(){var c=navigator.userAgent.toLowerCase();var b=c.indexOf("ipad")!=-1||c.indexOf("iphone")!=-1||c.indexOf("android")!=-1;return b},getTouches:function(b){if(b.originalEvent){if(b.originalEvent.touches&&b.originalEvent.touches.length){return b.originalEvent.touches}else{if(b.originalEvent.changedTouches&&b.originalEvent.changedTouches.length){return b.originalEvent.changedTouches}}}if(!b.touches){b.touches=new Array();b.touches[0]=b.originalEvent}return b.touches},dispatchMouseEvent:function(b,f,d){if(this.simulatetouches){return}var c=document.createEvent("MouseEvent");c.initMouseEvent(b,true,true,f.view,1,f.screenX,f.screenY,f.clientX,f.clientY,false,false,false,false,0,null);d.dispatchEvent(c)},getRootNode:function(b){while(b.nodeType!==1){b=b.parentNode}return b},touchScroll:function(c,t,e,u){if(c==null){return}var v=this;var p=0;var h=0;var i=0;var q=0;var k=0;var l=0;var m=false;var f=false;var n=a(c);var s=["select","input","textarea"];var b=0;var d=0;n.bind("touchstart.touchScroll",function(w){if(a.inArray(w.target.tagName.toLowerCase(),s)!==-1){return}w.preventDefault();w.stopPropagation();var x=v.getTouches(w)[0];v.dispatchMouseEvent("mousedown",x,v.getRootNode(x.target));m=true;f=false;h=x.pageY;k=x.pageX;if(v.simulatetouches){h=x._pageY;k=x._pageX}p=0;q=0;return true});n.bind("touchmove.touchScroll",function(A){if(!m){return}var y=v.getTouches(A)[0].pageY;var z=v.getTouches(A)[0].pageX;if(v.simulatetouches){y=v.getTouches(A)[0]._pageY;z=v.getTouches(A)[0]._pageX}var w=y-h;var x=z-k;d=y;touchHorizontalEnd=z;i=w-p;l=x-q;f=true;p=w;q=x;e(-l*3,-i*3,x,w,A);A.preventDefault();A.stopPropagation();return false});a(window).bind("mouseup.touchScroll",function(w){m=false});if(this.simulatetouches){if(window.frameElement){if(window.top!=null){var o=function(w){m=false};if(window.top.document.addEventListener){window.top.document.removeEventListener("mouseup",o,false);window.top.document.addEventListener("mouseup",o,false)}else{if(window.top.document.attachEvent){window.top.document.attachEvent("onmouseup",o)}}}}}a(document).bind("touchend",function(w){if(!m){return}m=false;var y=v.getTouches(w)[0],x=v.getRootNode(y.target);v.dispatchMouseEvent("mouseup",y,x);v.dispatchMouseEvent("click",y,x)});n.bind("touchend.touchScroll touchcancel.touchScroll",function(w){if(!m){return}m=false;if(f){v.dispatchMouseEvent("mouseup",y,x)}else{var y=v.getTouches(w)[0],x=v.getRootNode(y.target);v.dispatchMouseEvent("mouseup",y,x);v.dispatchMouseEvent("click",y,x)}})}});a.jqx.cookie=a.jqx.cookie||{};a.extend(a.jqx.cookie,{cookie:function(e,f,c){if(arguments.length>1&&String(f)!=="[object Object]"){c=jQuery.extend({},c);if(f===null||f===undefined){c.expires=-1}if(typeof c.expires==="number"){var i=c.expires,d=c.expires=new Date();d.setDate(d.getDate()+i)}f=String(f);return(document.cookie=[encodeURIComponent(e),"=",c.raw?f:encodeURIComponent(f),c.expires?"; expires="+c.expires.toUTCString():"",c.path?"; path="+c.path:"",c.domain?"; domain="+c.domain:"",c.secure?"; secure":""].join(""))}c=f||{};var b,h=c.raw?function(k){return k}:decodeURIComponent;return(b=new RegExp("(?:^|; )"+encodeURIComponent(e)+"=([^;]*)").exec(document.cookie))?h(b[1]):null}});a.jqx.string=a.jqx.string||{};a.extend(a.jqx.string,{contains:function(b,c){if(b==null||c==null){return false}return b.indexOf(c)!=-1},containsIgnoreCase:function(b,c){if(b==null||c==null){return false}return b.toUpperCase().indexOf(c.toUpperCase())!=-1},equals:function(b,c){if(b==null||c==null){return false}b=this.normalize(b);if(c.length==b.length){return b.slice(0,c.length)==c}return false},equalsIgnoreCase:function(b,c){if(b==null||c==null){return false}b=this.normalize(b);if(c.length==b.length){return b.toUpperCase().slice(0,c.length)==c.toUpperCase()}return false},startsWith:function(b,c){if(b==null||c==null){return false}return b.slice(0,c.length)==c},startsWithIgnoreCase:function(b,c){if(b==null||c==null){return false}return b.toUpperCase().slice(0,c.length)==c.toUpperCase()},normalize:function(b){if(b.charCodeAt(b.length-1)==65279){b=b.substring(0,b.length-1)}return b},endsWith:function(b,c){if(b==null||c==null){return false}b=this.normalize(b);return b.slice(-c.length)==c},endsWithIgnoreCase:function(b,c){if(b==null||c==null){return false}b=this.normalize(b);return b.toUpperCase().slice(-c.length)==c.toUpperCase()}});a.extend(jQuery.easing,{easeOutBack:function(f,h,e,l,k,i){if(i==undefined){i=1.70158}return l*((h=h/k-1)*h*((i+1)*h+i)+1)+e},easeInQuad:function(f,h,e,k,i){return k*(h/=i)*h+e},easeInOutCirc:function(f,h,e,k,i){if((h/=i/2)<1){return -k/2*(Math.sqrt(1-h*h)-1)+e}return k/2*(Math.sqrt(1-(h-=2)*h)+1)+e},easeInOutSine:function(f,h,e,k,i){return -k/2*(Math.cos(Math.PI*h/i)-1)+e}})})(jQuery);(function(a){a.fn.extend({ischildof:function(c){var b=a(this).parents().get();for(j=0;j<b.length;j++){if(a(b[j]).is(c)){return true}}return false}})})(jQuery);