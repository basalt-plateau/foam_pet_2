import{s as re,e as c,f as m,t as ht,c as u,h as p,g as R,j as v,d as h,p as ft,b as n,a as d,i as B,k as a,z as G,l as ut,a2 as ne,q as gt,C as ie,n as ce,r as ue}from"./scheduler.CCSnUDNs.js";import{S as le,i as oe,c as Bt,a as Ht,m as Lt,t as J,b as dt,d as Nt,g as he,e as fe}from"./index.BaOberT0.js";import{F as de}from"./Fabric.RoKndPPb.js";import{_ as pe}from"./merge.DECNL9ng.js";import{t as Kt,l as Qt}from"./0.C1v_il9P.js";import{p as Yt}from"./parse_with_commas.D_XauS-A.js";import{T as _e}from"./Trinket.zhO5Sn4n.js";const me=async({amount:i,address:t,URL:s})=>{const e=new URLSearchParams({amount:i,address:t}),r=`${s}?${e.toString()}`;return console.log({ICANN_address:r,amount:i,params:e}),{tx:(await(await fetch(r,{method:"POST",headers:{}})).json())[0]}};function Zt(i){let t,s,e,r,l,f;return{c(){t=c("aside"),s=c("div"),e=c("p"),r=ht(i[4]),l=m(),f=c("div"),this.h()},l(_){t=u(_,"ASIDE",{class:!0,style:!0});var g=p(t);s=u(g,"DIV",{class:!0});var x=p(s);e=u(x,"P",{style:!0});var D=p(e);r=ft(D,i[4]),D.forEach(h),x.forEach(h),g.forEach(h),l=v(_),f=u(_,"DIV",{style:!0}),p(f).forEach(h),this.h()},h(){n(e,"white-space","pre-wrap"),d(s,"class","alert-message"),d(t,"class","alert variant-soft-error"),n(t,"margin","10px 0"),n(f,"height",".5cm")},m(_,g){B(_,t,g),a(t,s),a(s,e),a(e,r),B(_,l,g),B(_,f,g)},p(_,g){g&16&&gt(r,_[4])},d(_){_&&(h(t),h(l),h(f))}}}function te(i){let t,s,e,r;return{c(){t=c("aside"),s=c("div"),e=c("p"),r=ht(i[5]),this.h()},l(l){t=u(l,"ASIDE",{class:!0,style:!0});var f=p(t);s=u(f,"DIV",{class:!0});var _=p(s);e=u(_,"P",{style:!0});var g=p(e);r=ft(g,i[5]),g.forEach(h),_.forEach(h),f.forEach(h),this.h()},h(){n(e,"white-space","pre-wrap"),d(s,"class","alert-message"),d(t,"class","alert variant-filled"),n(t,"margin","10px 0")},m(l,f){B(l,t,f),a(t,s),a(s,e),a(e,r)},p(l,f){f&32&&gt(r,l[5])},d(l){l&&h(t)}}}function ee(i){let t,s,e,r;return{c(){t=c("aside"),s=c("div"),e=c("p"),r=ht(i[6]),this.h()},l(l){t=u(l,"ASIDE",{class:!0,style:!0});var f=p(t);s=u(f,"DIV",{class:!0});var _=p(s);e=u(_,"P",{transaction_message_success:!0,style:!0});var g=p(e);r=ft(g,i[6]),g.forEach(h),_.forEach(h),f.forEach(h),this.h()},h(){d(e,"transaction_message_success",""),n(e,"white-space","pre-wrap"),d(s,"class","alert-message"),d(t,"class","alert variant-filled-success"),n(t,"margin","10px 0")},m(l,f){B(l,t,f),a(t,s),a(s,e),a(e,r)},p(l,f){f&64&&gt(r,l[6])},d(l){l&&h(t)}}}function ve(i){let t,s,e="Faucet",r,l,f="This is for receiving Octas.  This isn't possible on the mainnet.",_,g,x,D,P,K="Faucet Net Path",X,w,Q,H,Y,y,k,yt="To Address",Z,L,Et,N,Ut="Example: 522D906C609A3D23B90F072AD0DC74BF857FB002E211B852CE38AD6761D4C8FD",xt,tt,bt,T,Dt,et,wt,b,S,qt="Amount of Octas",Ct,st,At,U,Mt="The actual amount for the transaction is calculate from the input provided.",It,at,kt,W,$,Tt,rt,Vt,q,$t,nt=Yt(i[2])+"",pt,Ot,lt,Pt,z,O,Xt="Ask for Octas",Ft,_t,mt,vt,ot,zt,j,Rt,it,ct,St,Wt,C=i[4].length>=1&&Zt(i),A=i[5].length>=1&&te(i),I=i[6].length>=1&&ee(i);return j=new _e({props:{text:i[7]}}),{c(){t=c("div"),s=c("header"),s.textContent=e,r=m(),l=c("p"),l.textContent=f,_=m(),g=c("hr"),x=m(),D=c("div"),P=c("header"),P.textContent=K,X=m(),w=c("textarea"),Q=m(),H=c("div"),Y=m(),y=c("div"),k=c("header"),k.textContent=yt,Z=m(),L=c("div"),Et=m(),N=c("p"),N.textContent=Ut,xt=m(),tt=c("div"),bt=m(),T=c("textarea"),Dt=m(),et=c("div"),wt=m(),b=c("div"),S=c("header"),S.textContent=qt,Ct=m(),st=c("div"),At=m(),U=c("p"),U.textContent=Mt,It=m(),at=c("div"),kt=m(),W=c("label"),$=c("input"),Tt=m(),rt=c("div"),Vt=m(),q=c("p"),$t=ht("Actual Octas Amount: "),pt=ht(nt),Ot=m(),lt=c("div"),Pt=m(),z=c("div"),O=c("button"),O.textContent=Xt,Ft=m(),C&&C.c(),_t=m(),A&&A.c(),mt=m(),I&&I.c(),vt=m(),ot=c("div"),zt=m(),Bt(j.$$.fragment),Rt=m(),it=c("div"),this.h()},l(E){t=u(E,"DIV",{style:!0});var o=p(t);s=u(o,"HEADER",{style:!0,"data-svelte-h":!0}),R(s)!=="svelte-1fcur31"&&(s.textContent=e),r=v(o),l=u(o,"P",{style:!0,"data-svelte-h":!0}),R(l)!=="svelte-2z56gz"&&(l.textContent=f),_=v(o),g=u(o,"HR",{class:!0,style:!0}),x=v(o),D=u(o,"DIV",{class:!0,style:!0});var M=p(D);P=u(M,"HEADER",{style:!0,"data-svelte-h":!0}),R(P)!=="svelte-qtd991"&&(P.textContent=K),X=v(M),w=u(M,"TEXTAREA",{ican_net_address:!0,class:!0,style:!0,type:!0,placeholder:!0,rows:!0}),p(w).forEach(h),M.forEach(h),Q=v(o),H=u(o,"DIV",{style:!0}),p(H).forEach(h),Y=v(o),y=u(o,"DIV",{class:!0,style:!0});var F=p(y);k=u(F,"HEADER",{style:!0,"data-svelte-h":!0}),R(k)!=="svelte-1hyjp9u"&&(k.textContent=yt),Z=v(F),L=u(F,"DIV",{style:!0}),p(L).forEach(h),Et=v(F),N=u(F,"P",{style:!0,"data-svelte-h":!0}),R(N)!=="svelte-lrju9t"&&(N.textContent=Ut),xt=v(F),tt=u(F,"DIV",{style:!0}),p(tt).forEach(h),bt=v(F),T=u(F,"TEXTAREA",{to_aptos_address:!0,class:!0,style:!0,type:!0,placeholder:!0,rows:!0}),p(T).forEach(h),F.forEach(h),Dt=v(o),et=u(o,"DIV",{style:!0}),p(et).forEach(h),wt=v(o),b=u(o,"DIV",{class:!0,style:!0});var V=p(b);S=u(V,"HEADER",{style:!0,"data-svelte-h":!0}),R(S)!=="svelte-c9voqd"&&(S.textContent=qt),Ct=v(V),st=u(V,"DIV",{style:!0}),p(st).forEach(h),At=v(V),U=u(V,"P",{style:!0,"data-svelte-h":!0}),R(U)!=="svelte-6ydufs"&&(U.textContent=Mt),It=v(V),at=u(V,"DIV",{style:!0}),p(at).forEach(h),kt=v(V),W=u(V,"LABEL",{class:!0});var Gt=p(W);$=u(Gt,"INPUT",{amount_of_octas:!0,style:!0,class:!0,type:!0,placeholder:!0}),Gt.forEach(h),Tt=v(V),rt=u(V,"DIV",{style:!0}),p(rt).forEach(h),Vt=v(V),q=u(V,"P",{style:!0});var jt=p(q);$t=ft(jt,"Actual Octas Amount: "),pt=ft(jt,nt),jt.forEach(h),V.forEach(h),Ot=v(o),lt=u(o,"DIV",{style:!0}),p(lt).forEach(h),Pt=v(o),z=u(o,"DIV",{class:!0,style:!0});var Jt=p(z);O=u(Jt,"BUTTON",{make_this_transaction:!0,monitor:!0,style:!0,type:!0,class:!0,"data-svelte-h":!0}),R(O)!=="svelte-10cehex"&&(O.textContent=Xt),Jt.forEach(h),Ft=v(o),C&&C.l(o),_t=v(o),A&&A.l(o),mt=v(o),I&&I.l(o),vt=v(o),ot=u(o,"DIV",{style:!0}),p(ot).forEach(h),zt=v(o),Ht(j.$$.fragment,o),Rt=v(o),it=u(o,"DIV",{style:!0}),p(it).forEach(h),o.forEach(h),this.h()},h(){n(s,"text-align","center"),n(s,"font-size","2em"),n(l,"text-align","center"),n(l,"margin-top","10px"),d(g,"class","!border-t-4"),n(g,"margin","1cm 0"),n(P,"text-align","center"),n(P,"font-size","1.5em"),n(P,"padding","10px 0"),d(w,"ican_net_address",""),d(w,"class","textarea"),n(w,"min-height","50px"),n(w,"padding","10px"),d(w,"type","text"),d(w,"placeholder",""),d(w,"rows","1"),d(D,"class","card variant-soft-primary p-4"),n(D,"color","inherit"),n(H,"height","0.5cm"),n(k,"text-align","center"),n(k,"font-size","1.5em"),n(L,"height","0.5cm"),n(N,"text-align","center"),n(tt,"height","0.5cm"),d(T,"to_aptos_address",""),d(T,"class","textarea"),n(T,"min-height","50px"),n(T,"padding","10px"),d(T,"type","text"),d(T,"placeholder",""),d(T,"rows","1"),d(y,"class","card variant-soft-primary p-4"),n(y,"color","inherit"),n(et,"height","0.5cm"),n(S,"text-align","center"),n(S,"font-size","1.5em"),n(st,"height","0.5cm"),n(U,"text-align","center"),n(at,"height","0.5cm"),d($,"amount_of_octas",""),n($,"padding","10px"),d($,"class","input"),d($,"type","number"),d($,"placeholder","Amount of Octas"),d(W,"class","label"),n(rt,"height","0.5cm"),n(q,"text-align","center"),d(b,"class","card variant-soft-primary p-4"),n(b,"color","inherit"),n(lt,"height","0.5cm"),d(O,"make_this_transaction",""),d(O,"monitor","ask for octas"),n(O,"margin-top","10px"),d(O,"type","button"),d(O,"class","btn bg-gradient-to-br variant-gradient-primary-secondary"),d(z,"class","card variant-soft-primary p-4"),n(z,"color","inherit"),n(z,"display","flex"),n(z,"justify-content","right"),n(ot,"height","0.5cm"),n(it,"height","10cm"),n(t,"height","100%"),n(t,"width","100%"),n(t,"overflow","scroll"),n(t,"padding","1cm 0.5cm 0")},m(E,o){B(E,t,o),a(t,s),a(t,r),a(t,l),a(t,_),a(t,g),a(t,x),a(t,D),a(D,P),a(D,X),a(D,w),G(w,i[3]),a(t,Q),a(t,H),a(t,Y),a(t,y),a(y,k),a(y,Z),a(y,L),a(y,Et),a(y,N),a(y,xt),a(y,tt),a(y,bt),a(y,T),G(T,i[0]),a(t,Dt),a(t,et),a(t,wt),a(t,b),a(b,S),a(b,Ct),a(b,st),a(b,At),a(b,U),a(b,It),a(b,at),a(b,kt),a(b,W),a(W,$),G($,i[1]),a(b,Tt),a(b,rt),a(b,Vt),a(b,q),a(q,$t),a(q,pt),a(t,Ot),a(t,lt),a(t,Pt),a(t,z),a(z,O),a(t,Ft),C&&C.m(t,null),a(t,_t),A&&A.m(t,null),a(t,mt),I&&I.m(t,null),a(t,vt),a(t,ot),a(t,zt),Lt(j,t,null),a(t,Rt),a(t,it),ct=!0,St||(Wt=[ut(w,"input",i[10]),ut(T,"input",i[11]),ut($,"input",i[8]),ut($,"input",i[12]),ut(O,"click",i[9])],St=!0)},p(E,[o]){o&8&&G(w,E[3]),o&1&&G(T,E[0]),o&2&&ne($.value)!==E[1]&&G($,E[1]),(!ct||o&4)&&nt!==(nt=Yt(E[2])+"")&&gt(pt,nt),E[4].length>=1?C?C.p(E,o):(C=Zt(E),C.c(),C.m(t,_t)):C&&(C.d(1),C=null),E[5].length>=1?A?A.p(E,o):(A=te(E),A.c(),A.m(t,mt)):A&&(A.d(1),A=null),E[6].length>=1?I?I.p(E,o):(I=ee(E),I.c(),I.m(t,vt)):I&&(I.d(1),I=null);const M={};o&128&&(M.text=E[7]),j.$set(M)},i(E){ct||(J(j.$$.fragment,E),ct=!0)},o(E){dt(j.$$.fragment,E),ct=!1},d(E){E&&h(t),C&&C.d(),A&&A.d(),I&&I.d(),Nt(j),St=!1,ie(Wt)}}}let se="https://api.devnet.aptoslabs.com/v1";function ge(i,t,s){let e="",r="1e8",l="100000000",f="https://faucet.devnet.aptoslabs.com/mint",_="",g="",x="",D="";const P=async()=>{let y=event.target.value,k=parseFloat(y);s(2,l=k.toString())};let K="";const X=Qt({wait:2e3,wait_for_response:"yes",action:async()=>{const{enhanced:y,transaction_fiberized:k}=await Kt({net_path:se,transaction_hash:K});y.success===!0&&(s(6,x="The transaction was successful."),s(7,D=k),X.stop())}}),w=async()=>{s(4,_=""),s(5,g=""),s(6,x=""),s(7,D="");try{if(e.length==0){s(4,_="An Address wasn't choosen.");return}const{tx:y}=await me({amount:l,address:e,URL:f});s(5,g=`
The faucet returned transaction hexadecimal: 
${y}
	
Waiting on transaction success confirmation.
		`.trim());const k=async()=>{const{enhanced:Z,transaction_fiberized:L}=await Kt({net_path:se,transaction_hash:y});return Z.success===!0?(s(6,x="The transaction was successful."),s(7,D=L),"yes"):"no"};K=y,X.play();const yt=await Qt({action:k});return}catch(y){console.error(y),s(4,_=y.message)}};function Q(){f=this.value,s(3,f)}function H(){e=this.value,s(0,e)}function Y(){r=ne(this.value),s(1,r)}return[e,r,l,f,_,g,x,D,P,w,Q,H,Y]}class ye extends le{constructor(t){super(),oe(this,t,ge,ve,re,{})}}function ae(i){let t,s;return t=new ye({}),{c(){Bt(t.$$.fragment)},l(e){Ht(t.$$.fragment,e)},m(e,r){Lt(t,e,r),s=!0},i(e){s||(J(t.$$.fragment,e),s=!0)},o(e){dt(t.$$.fragment,e),s=!1},d(e){Nt(t,e)}}}function Ee(i){let t,s,e=i[1]===1&&ae();return{c(){t=c("div"),e&&e.c(),this.h()},l(r){t=u(r,"DIV",{slot:!0,style:!0});var l=p(t);e&&e.l(l),l.forEach(h),this.h()},h(){d(t,"slot","leaves"),n(t,"height","100%"),n(t,"width","100%"),n(t,"display","flex"),n(t,"justify-content","center"),n(t,"align-items","center")},m(r,l){B(r,t,l),e&&e.m(t,null),s=!0},p(r,l){r[1]===1?e?l&2&&J(e,1):(e=ae(),e.c(),J(e,1),e.m(t,null)):e&&(he(),dt(e,1,1,()=>{e=null}),fe())},i(r){s||(J(e),s=!0)},o(r){dt(e),s=!1},d(r){r&&h(t),e&&e.d()}}}function xe(i){let t,s="<div>This is unfinished</div>";return{c(){t=c("div"),t.innerHTML=s,this.h()},l(e){t=u(e,"DIV",{slot:!0,"data-svelte-h":!0}),R(t)!=="svelte-i3jo2i"&&(t.innerHTML=s),this.h()},h(){d(t,"slot","unfinished")},m(e,r){B(e,t,r)},p:ce,d(e){e&&h(t)}}}function be(i){let t,s,e={on_change:i[2],on_prepare:i[3],$$slots:{unfinished:[xe],leaves:[Ee]},$$scope:{ctx:i}};return t=new de({props:e}),i[4](t),{c(){Bt(t.$$.fragment)},l(r){Ht(t.$$.fragment,r)},m(r,l){Lt(t,r,l),s=!0},p(r,[l]){const f={};l&130&&(f.$$scope={dirty:l,ctx:r}),t.$set(f)},i(r){s||(J(t.$$.fragment,r),s=!0)},o(r){dt(t.$$.fragment,r),s=!1},d(r){i[4](null),Nt(t,r)}}}function De(i,t,s){let e;const r=()=>{};let l=1;const f=()=>{e.advance(({freight:x})=>(x.next.permitted==="yes"?s(1,l+=1):x.next.has_alert==="yes"&&(x.unfinished.showing="yes"),x))},_=()=>{e.advance(({freight:x})=>pe({},x,{showing:"yes",name:"Faucet",unfinished:{showing:"no"},back:{has:"no",text:"Back",permitted:"no",go:()=>{console.log("back pressed")}},next:{has:"no",text:"Unfinished",permitted:"no",has_alert:"yes",go:()=>{f()}},panel:{text:""}}))};function g(x){ue[x?"unshift":"push"](()=>{e=x,s(0,e)})}return[e,l,r,_,g]}class $e extends le{constructor(t){super(),oe(this,t,De,be,re,{})}}export{$e as default};
//# sourceMappingURL=Trinket.BssXFOxl.js.map
