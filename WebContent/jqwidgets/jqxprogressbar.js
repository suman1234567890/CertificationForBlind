/*
jQWidgets v1.8.0 (2012-03-09)
Copyright (c) 2011-2012 jQWidgets.
License: http://jqwidgets.com/license/
*/

(function(a){a.jqx.jqxWidget("jqxProgressBar","",{});a.extend(a.jqx._jqxProgressBar.prototype,{defineInstance:function(){this.value=0;this.oldValue=null;this.max=100;this.min=0;this.orientation="horizontal";this.width=null;this.height=null;this.showText=false;this.animationDuration=300;this.disabled=false;this.events=["valuechanged","invalidvalue","complete"]},createInstance:function(c){var b=this;this.host.addClass(this.toThemeProperty("jqx-progressbar"));this.host.addClass(this.toThemeProperty("jqx-rc-all"));if(this.width!=null&&this.width.toString().indexOf("px")!=-1){this.host.width(this.width)}else{if(this.width!=undefined&&!isNaN(this.width)){this.host.width(this.width)}}if(this.height!=null&&this.height.toString().indexOf("px")!=-1){this.host.height(this.height)}else{if(this.height!=undefined&&!isNaN(this.height)){this.host.height(this.height)}}this.valueDiv=a("<div></div>").appendTo(this.element);if(this.orientation=="horizontal"){this.valueDiv.width(0);this.valueDiv.addClass(this.toThemeProperty("jqx-progressbar-value"))}else{this.valueDiv.height(0);this.valueDiv.addClass(this.toThemeProperty("jqx-progressbar-value-vertical"))}this.feedbackElementHost=a("<div style='width: 100%; height: 100%; position: relative;'></div>").appendTo(this.host);this.feedbackElement=a("<span class='text'></span>").appendTo(this.feedbackElementHost);this.feedbackElement.addClass(this.toThemeProperty("jqx-progressbar-text"));this.oldValue=this._value();this.refresh();a(window).resize(function(){b.refresh()})},destroy:function(){this.host.removeClass();this.valueDiv.removeClass();this.valueDiv.remove();this.feedbackElement.remove()},_raiseevent:function(g,d,f){if(this.isInitialized!=undefined&&this.isInitialized==true){var c=this.events[g];var e=new jQuery.Event(c);e.previousValue=d;e.currentValue=f;e.owner=this;var b=this.host.trigger(e);return b}},actualValue:function(b){if(b===undefined){return this._value()}a.jqx.setvalueraiseevent(this,"value",b);return this._value()},propertyChangedHandler:function(c,d,b,f){if(!this.isInitialized){return}var e=this;if(d=="min"&&c.value<f){c.value=f}else{if(d=="max"&&c.value>f){c.value=f}}if(d==="value"&&e.value!=undefined){e.value=f;e.oldValue=b;if(f<e.min||f>e.max){e._raiseevent(1,b,f)}e.refresh();if(e._value()===e.max){e._raiseevent(2,b,f)}}if(d=="renderText"||d=="orientation"||d=="showText"||d=="min"||d=="max"){e.refresh()}else{if(d=="width"&&e.width!=undefined){if(e.width!=undefined&&!isNaN(e.width)){e.host.width(e.width);e.refresh()}}else{if(d=="height"&&e.height!=undefined){if(e.height!=undefined&&!isNaN(e.height)){e.host.height(e.height);e.refresh()}}}}},_value:function(){var c=this.value;if(typeof c!=="number"){var b=parseInt(c);if(isNaN(b)){c=0}else{c=b}}return Math.min(this.max,Math.max(this.min,c))},_percentage:function(){return 100*this._value()/this.max},_textwidth:function(d){var c=a("<span>"+d+"</span>");a(this.host).append(c);var b=c.width();c.remove();return b},_textheight:function(d){var c=a("<span>"+d+"</span>");a(this.host).append(c);var b=c.height();c.remove();return b},refresh:function(){var i=this.actualValue();var l=this._percentage();if(this.disabled){this.host.addClass(this.toThemeProperty("jqx-progressbar-disabled"));a(this.element.children[0]).hide();return}else{this.host.removeClass(this.toThemeProperty("jqx-progressbar-disabled"));a(this.element.children[0]).show()}if(isNaN(i)){return}if(isNaN(l)){return}if(this.oldValue!==i){this._raiseevent(0,this.oldValue,i);this.oldValue=i}var j=this.host.outerHeight();var b=this.host.outerWidth();if(this.width!=null){b=parseInt(this.width)}if(this.height!=null){j=parseInt(this.height)}var c=parseInt(this.host.outerWidth())/2;var f=parseInt(this.host.outerHeight())/2;if(isNaN(l)){l=0}var g=this;try{if(this.orientation=="horizontal"){a(this.element.children[0]).toggle(i>=this.min);a(this.element.children[0]).animate({width:l.toFixed(0)+"%"},this.animationDuration,function(){});this.feedbackElementHost.css("margin-top",-this.host.height())}else{a(this.element.children[0]).toggle(i>=this.min);this.feedbackElementHost.animate({"margin-top":-(l.toFixed(0)*g.host.height())/100},this.animationDuration,function(){});a(this.element.children[0]).animate({height:l.toFixed(0)+"%"},this.animationDuration,function(){})}}catch(e){}this.feedbackElement.html(l.toFixed(0)+"%").toggle(this.showText==true);if(this.renderText){this.feedbackElement.html(this.renderText(l.toFixed(0)+"%"))}this.feedbackElement.css("position","absolute");this.feedbackElement.css("top","50%");this.feedbackElement.css("left","0");var h=this.feedbackElement.height();var d=this.feedbackElement.width();var k=Math.floor(c-(parseInt(d)/2));this.feedbackElement.css({left:(k),"margin-top":-parseInt(h)/2+"px"})}})})(jQuery);