import{s as $,e as f,c as p,h as w,d as r,a as b,b as o,i as c,g as y,n as k,r as T,y as h}from"./scheduler.CCSnUDNs.js";import{S as D,i as z,c as M,a as H,m as J,t as L,b as j,d as A}from"./index.BaOberT0.js";import"./0.C1v_il9P.js";import{_ as C}from"./merge.DECNL9ng.js";import{F as I}from"./Fabric.RoKndPPb.js";function m(i){let e,t=i[0]==="Digital Assets 1"&&_();return{c(){t&&t.c(),e=h()},l(n){t&&t.l(n),e=h()},m(n,s){t&&t.m(n,s),c(n,e,s)},p(n,s){n[0]==="Digital Assets 1"?t||(t=_(),t.c(),t.m(e.parentNode,e)):t&&(t.d(1),t=null)},d(n){n&&r(e),t&&t.d(n)}}}function _(i){let e,t='<header style="font-size: 3em; ">Rondovals</header> <div class="card p-4" style="width: 100%; text-align: center; "><header style="font-size: 2em; ">Tivaevae</header> <button type="button" class="btn variant-filled">Establish</button> <button type="button" class="btn variant-filled">Join</button> <button type="button" class="btn variant-filled">Destroy</button></div> <div class="card p-4" style="width: 100%; text-align: center; "><header style="font-size: 2em; ">Geimfaras</header> <button type="button" class="btn variant-filled">Join</button></div> <div class="card p-4" style="width: 100%; text-align: center; "><header style="font-size: 2em; ">Mall</header> <button type="button" class="btn variant-filled">Join</button></div> <div class="card p-4" style="width: 100%; text-align: center; "><header style="font-size: 2em; ">Thermoplastic</header> <button type="button" class="btn variant-filled">Join</button></div>';return{c(){e=f("div"),e.innerHTML=t,this.h()},l(n){e=p(n,"DIV",{style:!0,"data-svelte-h":!0}),y(e)!=="svelte-3bv95u"&&(e.innerHTML=t),this.h()},h(){o(e,"box-sizing","border-box"),o(e,"height","100%"),o(e,"width","100%"),o(e,"padding","1cm"),o(e,"display","flex"),o(e,"justify-content","center"),o(e,"align-items","center"),o(e,"flex-direction","column"),o(e,"gap","0.5cm")},m(n,s){c(n,e,s)},d(n){n&&r(e)}}}function V(i){let e,t=i[2]==="yes"&&m(i);return{c(){e=f("div"),t&&t.c(),this.h()},l(n){e=p(n,"DIV",{slot:!0,style:!0});var s=w(e);t&&t.l(s),s.forEach(r),this.h()},h(){b(e,"slot","leaves"),o(e,"height","100%"),o(e,"width","100%"),o(e,"display","flex"),o(e,"justify-content","center"),o(e,"align-items","center")},m(n,s){c(n,e,s),t&&t.m(e,null)},p(n,s){n[2]==="yes"?t?t.p(n,s):(t=m(n),t.c(),t.m(e,null)):t&&(t.d(1),t=null)},d(n){n&&r(e),t&&t.d()}}}function E(i){let e,t="<div>This is unfinished</div>";return{c(){e=f("div"),e.innerHTML=t,this.h()},l(n){e=p(n,"DIV",{slot:!0,"data-svelte-h":!0}),y(e)!=="svelte-i3jo2i"&&(e.innerHTML=t),this.h()},h(){b(e,"slot","unfinished")},m(n,s){c(n,e,s)},p:k,d(n){n&&r(e)}}}function F(i){let e,t,n={on_change:i[3],on_prepare:i[4],$$slots:{unfinished:[E],leaves:[V]},$$scope:{ctx:i}};return e=new I({props:n}),i[5](e),{c(){M(e.$$.fragment)},l(s){H(e.$$.fragment,s)},m(s,l){J(e,s,l),t=!0},p(s,[l]){const d={};l&4101&&(d.$$scope={dirty:l,ctx:s}),e.$set(d)},i(s){t||(L(e.$$.fragment,s),t=!0)},o(s){j(e.$$.fragment,s),t=!1},d(s){i[5](null),A(e,s)}}}function R(i,e,t){let n="Digital Assets 1",s;const l=()=>{},d=()=>{console.info("on_next_pressed"),s.advance(({freight:a})=>(a.next.permitted==="yes"?current+=1:a.next.has_alert==="yes"&&(a.unfinished.showing="yes"),console.info({freight:a}),a))};let u="no";const v=()=>{s.advance(({freight:a})=>C({},a,{showing:"yes",name:"Rondovals",unfinished:{showing:"no"},back:{text:"Back",permitted:"no",go:async()=>{console.log("back pressed"),s.advance(({freight:x})=>x)}},next:{text:"Unfinished",permitted:"no",has_alert:"yes",go:()=>{d()}},panel:{text:""}})),t(2,u="yes")};function g(a){T[a?"unshift":"push"](()=>{s=a,t(1,s)})}return[n,s,u,l,v,g]}class U extends D{constructor(e){super(),z(this,e,R,F,$,{})}}export{U as default};
//# sourceMappingURL=Trinket.D4U3iOzt.js.map
