import{s as se,e as b,f as x,c as k,h as I,j as A,d as g,b as f,i as K,k as _,y as Z,r as S,n as _e,g as Q,a as U}from"./scheduler.CCSnUDNs.js";import{S as oe,i as ie,c as j,a as z,m as H,t as m,g as X,b as $,e as Y,d as R}from"./index.BaOberT0.js";import{T as de}from"./Tome.Db7___xs.js";import{f as ee}from"./0.C1v_il9P.js";import{A as pe}from"./APT_Button.CeFmhBTp.js";import{T as te}from"./Trinket.CCMN3unz.js";import{P as ue}from"./Problem.CgG6gZSV.js";import{T as me}from"./Trinket.wUQGL4-y.js";import{R as he}from"./Ride.C-bF3bcc.js";function ne(i){let e,n,r,o;const t=[$e,ge],s=[];function a(l,h){return l[4].stage_name_connected.length>=1?0:1}return e=a(i),n=s[e]=t[e](i),{c(){n.c(),r=Z()},l(l){n.l(l),r=Z()},m(l,h){s[e].m(l,h),K(l,r,h),o=!0},p(l,h){let v=e;e=a(l),e===v?s[e].p(l,h):(X(),$(s[v],1,1,()=>{s[v]=null}),Y(),n=s[e],n?n.p(l,h):(n=s[e]=t[e](l),n.c()),m(n,1),n.m(r.parentNode,r))},i(l){o||(m(n),o=!0)},o(l){$(n),o=!1},d(l){l&&g(r),s[e].d(l)}}}function ge(i){let e,n;return e=new ue({props:{text:"There isn't a wallet connected."}}),{c(){j(e.$$.fragment)},l(r){z(e.$$.fragment,r)},m(r,o){H(e,r,o),n=!0},p:_e,i(r){n||(m(e.$$.fragment,r),n=!0)},o(r){$(e.$$.fragment,r),n=!1},d(r){R(e,r)}}}function $e(i){let e,n,r="APT Transfer",o,t,s,a,l,h,v,w,E,F,L,y,V,W='<span class="badge variant-soft-primary" style="margin: 0 auto; padding: 0.2cm 1cm; "><p style="font-size: 1.2em; font-weight: bold;">Amount</p></span>',M,D,B="1 APT = 1e8 Octas",c,d,q,T,C,N,ae={name:"Origin Address",has_field:"no",on_change:ye,on_prepare:i[11]};s=new te({props:ae}),i[12](s);let le={name:"To Address",on_change:i[8],on_prepare:i[7]};w=new te({props:le}),i[13](w);let ce={on_change:i[5],on_prepare:i[6]};d=new me({props:ce}),i[14](d);let fe={button_text:"Transfer",APT:"0",clicked:i[9],permitted:"yes"};return C=new pe({props:fe}),i[15](C),{c(){e=b("div"),n=b("header"),n.textContent=r,o=x(),t=b("div"),j(s.$$.fragment),a=x(),l=b("div"),h=x(),v=b("div"),j(w.$$.fragment),E=x(),F=b("div"),L=x(),y=b("div"),V=b("div"),V.innerHTML=W,M=x(),D=b("p"),D.textContent=B,c=x(),j(d.$$.fragment),q=x(),T=b("div"),j(C.$$.fragment),this.h()},l(u){e=k(u,"DIV",{style:!0});var p=I(e);n=k(p,"HEADER",{style:!0,"data-svelte-h":!0}),Q(n)!=="svelte-hvntgd"&&(n.textContent=r),o=A(p),t=k(p,"DIV",{style:!0,class:!0});var O=I(t);z(s.$$.fragment,O),O.forEach(g),a=A(p),l=k(p,"DIV",{style:!0}),I(l).forEach(g),h=A(p),v=k(p,"DIV",{style:!0,class:!0});var G=I(v);z(w.$$.fragment,G),G.forEach(g),E=A(p),F=k(p,"DIV",{style:!0}),I(F).forEach(g),L=A(p),y=k(p,"DIV",{class:!0,style:!0});var P=I(y);V=k(P,"DIV",{style:!0,"data-svelte-h":!0}),Q(V)!=="svelte-15u9yzr"&&(V.innerHTML=W),M=A(P),D=k(P,"P",{style:!0,"data-svelte-h":!0}),Q(D)!=="svelte-1qvgo1h"&&(D.textContent=B),c=A(P),z(d.$$.fragment,P),P.forEach(g),q=A(p),T=k(p,"DIV",{style:!0});var J=I(T);z(C.$$.fragment,J),J.forEach(g),p.forEach(g),this.h()},h(){f(n,"font-size","1.5em"),f(n,"text-align","center"),f(t,"width","100%"),U(t,"class","card p-4"),f(l,"height","0.25cm"),f(v,"width","100%"),U(v,"class","card p-4"),f(F,"height","0.25cm"),f(V,"text-align","center"),f(D,"text-align","center"),f(D,"padding-bottom","10px"),U(y,"class","card variant-soft-primary p-4"),f(y,"color","inherit"),f(T,"display","flex"),f(T,"justify-content","right"),f(T,"align-items","center"),f(T,"gap","0.25cm"),f(T,"padding","0.25cm 0"),f(e,"width","100%")},m(u,p){K(u,e,p),_(e,n),_(e,o),_(e,t),H(s,t,null),_(e,a),_(e,l),_(e,h),_(e,v),H(w,v,null),_(e,E),_(e,F),_(e,L),_(e,y),_(y,V),_(y,M),_(y,D),_(y,c),H(d,y,null),_(e,q),_(e,T),H(C,T,null),N=!0},p(u,p){const O={};p&1&&(O.on_prepare=u[11]),s.$set(O);const G={};w.$set(G);const P={};d.$set(P);const J={};C.$set(J)},i(u){N||(m(s.$$.fragment,u),m(w.$$.fragment,u),m(d.$$.fragment,u),m(C.$$.fragment,u),N=!0)},o(u){$(s.$$.fragment,u),$(w.$$.fragment,u),$(d.$$.fragment,u),$(C.$$.fragment,u),N=!1},d(u){u&&g(e),i[12](null),R(s),i[13](null),R(w),i[14](null),R(d),i[15](null),R(C)}}}function ve(i){let e,n,r,o;n=new he({props:{on_change:i[10]}});let t=typeof i[4]=="object"&&ne(i);return{c(){e=b("div"),j(n.$$.fragment),r=x(),t&&t.c(),this.h()},l(s){e=k(s,"DIV",{style:!0});var a=I(e);z(n.$$.fragment,a),r=A(a),t&&t.l(a),a.forEach(g),this.h()},h(){f(e,"box-sizing","border-box"),f(e,"height","100%"),f(e,"width","100%"),f(e,"padding","1cm")},m(s,a){K(s,e,a),H(n,e,null),_(e,r),t&&t.m(e,null),o=!0},p(s,[a]){const l={};a&16&&(l.on_change=s[10]),n.$set(l),typeof s[4]=="object"?t?(t.p(s,a),a&16&&m(t,1)):(t=ne(s),t.c(),m(t,1),t.m(e,null)):t&&(X(),$(t,1,1,()=>{t=null}),Y())},i(s){o||(m(n.$$.fragment,s),m(t),o=!0)},o(s){$(n.$$.fragment,s),$(t),o=!1},d(s){s&&g(e),R(n),t&&t.d()}}}const ye=({effective:i,address_hexadecimal_string:e,exception:n})=>{};function be(i,e,n){let r,o="",t="";const s=({effects:c,actual_amount_of_Octas:d})=>{console.log("on_amount_change",d),c.problem===""&&(t=d)},a=()=>{o.modify({Octas:"0"})};let l="",h={effective:"no",address_hexadecimal_string:"",exception:""};const v=()=>{l.change_address_hexadecimal_string("")},w=({effective:c,address_hexadecimal_string:d,exception:q})=>{h.effective=c,h.address_hexadecimal_string=d,h.exception=q};let E="";const F=async()=>{const c=ee();E.mode("progress");try{const{result:d,note:q,transaction:T}=await c.prompt({petition:{function:"0x1::aptos_account::transfer",type_arguments:[],arguments:[h.address_hexadecimal_string,t]}});console.info("transfer progress",{result:d,note:q,transaction:T}),d==="discovered"?E.mode("success",{note:q}):E.mode("imperfection",{note:q})}catch(d){console.error("imperfection:",d),E.mode("imperfection",{note:"A problem occurred while processing the transfer."})}};let L=!1;const y=({pro_freight:c})=>{n(4,L=c)},V=()=>{const c=ee().propose_for_account_address();console.info({address:c}),r.change_address_hexadecimal_string(c)};function W(c){S[c?"unshift":"push"](()=>{r=c,n(0,r)})}function M(c){S[c?"unshift":"push"](()=>{l=c,n(2,l)})}function D(c){S[c?"unshift":"push"](()=>{o=c,n(1,o)})}function B(c){S[c?"unshift":"push"](()=>{E=c,n(3,E)})}return[r,o,l,E,L,s,a,v,w,F,y,V,W,M,D,B]}let ke=class extends oe{constructor(e){super(),ie(this,e,be,ve,se,{})}};function re(i){let e,n;return e=new ke({}),{c(){j(e.$$.fragment)},l(r){z(e.$$.fragment,r)},m(r,o){H(e,r,o),n=!0},i(r){n||(m(e.$$.fragment,r),n=!0)},o(r){$(e.$$.fragment,r),n=!1},d(r){R(e,r)}}}function Te(i){let e,n,r,o,t=i[1]==="yes"&&re();return{c(){e=b("div"),t&&t.c(),n=x(),r=b("div"),this.h()},l(s){e=k(s,"DIV",{style:!0});var a=I(e);t&&t.l(a),n=A(a),r=k(a,"DIV",{style:!0}),I(r).forEach(g),a.forEach(g),this.h()},h(){f(r,"height","12cm"),f(e,"height","100%"),f(e,"width","100%")},m(s,a){K(s,e,a),t&&t.m(e,null),_(e,n),_(e,r),o=!0},p(s,a){s[1]==="yes"?t?a&2&&m(t,1):(t=re(),t.c(),m(t,1),t.m(e,n)):t&&(X(),$(t,1,1,()=>{t=null}),Y())},i(s){o||(m(t),o=!0)},o(s){$(t),o=!1},d(s){s&&g(e),t&&t.d()}}}function we(i){let e,n,r={on_prepare:i[2],$$slots:{default:[Te]},$$scope:{ctx:i}};return e=new de({props:r}),i[3](e),{c(){j(e.$$.fragment)},l(o){z(e.$$.fragment,o)},m(o,t){H(e,o,t),n=!0},p(o,[t]){const s={};t&18&&(s.$$scope={dirty:t,ctx:o}),e.$set(s)},i(o){n||(m(e.$$.fragment,o),n=!0)},o(o){$(e.$$.fragment,o),n=!1},d(o){i[3](null),R(e,o)}}}function Ee(i,e,n){let r,o="no";const t=()=>{n(1,o="yes")};function s(a){S[a?"unshift":"push"](()=>{r=a,n(0,r)})}return[r,o,t,s]}class He extends oe{constructor(e){super(),ie(this,e,Ee,we,se,{})}}export{He as default};
//# sourceMappingURL=Tome.BR7ehLpj.js.map
