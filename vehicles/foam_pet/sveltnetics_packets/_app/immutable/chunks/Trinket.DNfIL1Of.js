import{s as Ce,y as me,i as ne,d as v,o as Te,m as we,e as _,f as z,t as F,c as u,h as x,g as J,j as M,p as K,a as D,b as s,z as ee,A as Ie,k as r,B as ve,l as te,C as Ee,q as ce,D as De}from"./scheduler.CCSnUDNs.js";import{S as Ne,i as Pe,t as G,g as fe,b as R,e as de,c as W,a as Y,m as Z,d as $}from"./index.BaOberT0.js";import{l as Ae,b as Ve}from"./0.C1v_il9P.js";import{C as Se}from"./ConicGradient._cKkD-5a.js";import{P as ze}from"./Problem.CgG6gZSV.js";import{T as ge}from"./Trinket.DvrdNySR.js";import{T as xe}from"./Trinket.C13Je671.js";function ye(p){let e,t,n='<header style="font-size: 1.4em; line-height: 100%; ">Group</header>',a,l,o,T,w,i,k,N,f,d,h,g,y,P,b,V,B="mainnet",m,E="devnet",c,S="other",O,j,X,H,q,se,re,ae,pe,_e;w=new ge({props:{text:"Town"}}),g=new ge({props:{text:"Blockchain"}});const ue=[He,Me],Q=[];function he(C,I){return C[2]==="other"?0:1}H=he(p),q=Q[H]=ue[H](p);let L=typeof p[5]=="number"&&be(p),A=p[4].length>=1&&ke(p);return{c(){e=_("div"),t=_("div"),t.innerHTML=n,a=z(),l=_("div"),o=_("p"),T=F("This is for net that "),W(w.$$.fragment),i=F(" connects to."),k=z(),N=_("div"),f=z(),d=_("p"),h=F("The "),W(g.$$.fragment),y=F(" is currently based on the response from one address."),P=z(),b=_("select"),V=_("option"),V.textContent=B,m=_("option"),m.textContent=E,c=_("option"),c.textContent=S,O=z(),j=_("div"),X=z(),q.c(),se=z(),L&&L.c(),re=z(),A&&A.c(),this.h()},l(C){e=u(C,"DIV",{net_group_choices:!0,style:!0});var I=x(e);t=u(I,"DIV",{class:!0,style:!0,"data-svelte-h":!0}),J(t)!=="svelte-1j9h1l3"&&(t.innerHTML=n),a=M(I),l=u(I,"DIV",{style:!0});var U=x(l);o=u(U,"P",{style:!0});var le=x(o);T=K(le,"This is for net that "),Y(w.$$.fragment,le),i=K(le," connects to."),le.forEach(v),k=M(U),N=u(U,"DIV",{style:!0}),x(N).forEach(v),f=M(U),d=u(U,"P",{style:!0});var oe=x(d);h=K(oe,"The "),Y(g.$$.fragment,oe),y=K(oe," is currently based on the response from one address."),oe.forEach(v),U.forEach(v),P=M(I),b=u(I,"SELECT",{"nets-choices":!0,class:!0});var ie=x(b);V=u(ie,"OPTION",{"data-svelte-h":!0}),J(V)!=="svelte-1sx3bry"&&(V.textContent=B),m=u(ie,"OPTION",{"data-svelte-h":!0}),J(m)!=="svelte-3ac022"&&(m.textContent=E),c=u(ie,"OPTION",{"data-svelte-h":!0}),J(c)!=="svelte-2jatou"&&(c.textContent=S),ie.forEach(v),O=M(I),j=u(I,"DIV",{style:!0}),x(j).forEach(v),X=M(I),q.l(I),se=M(I),L&&L.l(I),re=M(I),A&&A.l(I),I.forEach(v),this.h()},h(){D(t,"class","card p-2 variant-soft-surface"),s(t,"padding","0.2cm 1cm"),s(t,"margin","0.2cm auto 0.5cm"),s(t,"max-width","4cm"),s(t,"text-align","center"),s(o,"text-align","center"),s(o,"font-size","1em"),s(N,"height","12px"),s(d,"text-align","center"),s(d,"font-size","1em"),s(l,"padding","0 0 0.5cm"),V.__value="mainnet",ee(V,V.__value),m.__value="devnet",ee(m,m.__value),c.__value="other",ee(c,c.__value),D(b,"nets-choices",""),D(b,"class","select"),p[2]===void 0&&Ie(()=>p[13].call(b)),s(j,"height","6px"),D(e,"net_group_choices",""),s(e,"width","100%")},m(C,I){ne(C,e,I),r(e,t),r(e,a),r(e,l),r(l,o),r(o,T),Z(w,o,null),r(o,i),r(l,k),r(l,N),r(l,f),r(l,d),r(d,h),Z(g,d,null),r(d,y),r(e,P),r(e,b),r(b,V),r(b,m),r(b,c),ve(b,p[2],!0),r(e,O),r(e,j),r(e,X),Q[H].m(e,null),r(e,se),L&&L.m(e,null),r(e,re),A&&A.m(e,null),ae=!0,pe||(_e=[te(b,"change",p[13]),te(b,"change",p[8])],pe=!0)},p(C,I){I&4&&ve(b,C[2]);let U=H;H=he(C),H===U?Q[H].p(C,I):(fe(),R(Q[U],1,1,()=>{Q[U]=null}),de(),q=Q[H],q?q.p(C,I):(q=Q[H]=ue[H](C),q.c()),G(q,1),q.m(e,se)),typeof C[5]=="number"?L?L.p(C,I):(L=be(C),L.c(),L.m(e,re)):L&&(L.d(1),L=null),C[4].length>=1?A?(A.p(C,I),I&16&&G(A,1)):(A=ke(C),A.c(),G(A,1),A.m(e,null)):A&&(fe(),R(A,1,1,()=>{A=null}),de())},i(C){ae||(G(w.$$.fragment,C),G(g.$$.fragment,C),G(q),G(A),ae=!0)},o(C){R(w.$$.fragment,C),R(g.$$.fragment,C),R(q),R(A),ae=!1},d(C){C&&v(e),$(w),$(g),Q[H].d(),L&&L.d(),A&&A.d(),pe=!1,Ee(_e)}}}function Me(p){let e,t,n,a,l,o,T="<span>ICANN Address</span>",w,i,k,N,f;return a=new xe({}),{c(){e=_("div"),t=_("div"),n=_("div"),W(a.$$.fragment),l=z(),o=_("div"),o.innerHTML=T,w=z(),i=_("div"),k=_("span"),N=F(p[1]),this.h()},l(d){e=u(d,"DIV",{style:!0});var h=x(e);t=u(h,"DIV",{style:!0});var g=x(t);n=u(g,"DIV",{style:!0});var y=x(n);Y(a.$$.fragment,y),y.forEach(v),g.forEach(v),l=M(h),o=u(h,"DIV",{class:!0,style:!0,"data-svelte-h":!0}),J(o)!=="svelte-3k3h54"&&(o.innerHTML=T),w=M(h),i=u(h,"DIV",{class:!0,style:!0});var P=x(i);k=u(P,"SPAN",{icann_net_address:!0});var b=x(k);N=K(b,p[1]),b.forEach(v),P.forEach(v),h.forEach(v),this.h()},h(){s(n,"position","relative"),s(n,"top","0"),s(n,"left","0"),s(t,"position","relative"),s(t,"display","flex"),s(t,"align-items","center"),s(t,"justify-content","center"),D(o,"class","card p-2"),D(o,"style",""),D(k,"icann_net_address",""),D(i,"class","card p-2"),s(i,"flex","1 1 200px"),s(e,"display","flex"),s(e,"gap","5px"),s(e,"width","100%")},m(d,h){ne(d,e,h),r(e,t),r(t,n),Z(a,n,null),r(e,l),r(e,o),r(e,w),r(e,i),r(i,k),r(k,N),f=!0},p(d,h){(!f||h&2)&&ce(N,d[1])},i(d){f||(G(a.$$.fragment,d),f=!0)},o(d){R(a.$$.fragment,d),f=!1},d(d){d&&v(e),$(a)}}}function He(p){let e,t,n,a,l,o,T,w,i,k='<span icann_net_address="">Net Path</span>',N,f,d,h,g,y,P,b,V,B;return a=new Se({props:{stops:[{color:"transparent",start:0,end:25},{color:"rgb(var(--color-primary-500))",start:75,end:100}],spin:!0,width:"w-6"}}),T=new xe({}),{c(){e=_("div"),t=_("div"),n=_("div"),W(a.$$.fragment),l=z(),o=_("div"),W(T.$$.fragment),w=z(),i=_("div"),i.innerHTML=k,N=z(),f=_("textarea"),d=z(),h=_("div"),g=_("button"),y=F("Confirm Address"),this.h()},l(m){e=u(m,"DIV",{other_net_path_region:!0,style:!0});var E=x(e);t=u(E,"DIV",{style:!0});var c=x(t);n=u(c,"DIV",{style:!0});var S=x(n);Y(a.$$.fragment,S),l=M(S),o=u(S,"DIV",{style:!0});var O=x(o);Y(T.$$.fragment,O),O.forEach(v),S.forEach(v),w=M(c),i=u(c,"DIV",{class:!0,style:!0,"data-svelte-h":!0}),J(i)!=="svelte-1gcz6qw"&&(i.innerHTML=k),c.forEach(v),N=M(E),f=u(E,"TEXTAREA",{icann_net_address:!0,style:!0,class:!0,type:!0,placeholder:!0,rows:!0}),x(f).forEach(v),d=M(E),h=u(E,"DIV",{style:!0});var j=x(h);g=u(j,"BUTTON",{type:!0,class:!0});var X=x(g);y=K(X,"Confirm Address"),X.forEach(v),j.forEach(v),E.forEach(v),this.h()},h(){s(o,"position","absolute"),s(o,"top","10px"),s(o,"left","10px"),s(n,"display","flex"),s(n,"align-items","center"),s(n,"justify-content","center"),s(n,"padding","0 10px"),s(n,"opacity",p[3]==="yes"?1:0),D(i,"class","card p-2"),s(i,"display","flex"),s(i,"flex-grow","1"),s(i,"align-items","center"),s(t,"grid-column","span 1"),s(t,"grid-row","span 1"),s(t,"display","flex"),s(t,"width","100%"),D(f,"icann_net_address",""),s(f,"grid-column","span 2"),s(f,"grid-row","span 1"),s(f,"padding","5px 10px "),D(f,"class","textarea"),D(f,"type","text"),D(f,"placeholder",""),D(f,"rows","1"),D(g,"type","button"),D(g,"class","btn variant-filled"),g.disabled=P=p[3]==="yes",s(h,"grid-column","span 1"),s(h,"grid-row","span 1"),s(h,"min-width","100px"),D(e,"other_net_path_region",""),s(e,"display","grid"),s(e,"grid-template-columns","repeat(auto-fit, minmax(150px, 1fr))"),s(e,"gap","4px")},m(m,E){ne(m,e,E),r(e,t),r(t,n),Z(a,n,null),r(n,l),r(n,o),Z(T,o,null),r(t,w),r(t,i),r(e,N),r(e,f),ee(f,p[1]),r(e,d),r(e,h),r(h,g),r(g,y),b=!0,V||(B=[te(f,"keyup",p[9]),te(f,"input",p[14]),te(g,"click",p[10])],V=!0)},p(m,E){(!b||E&8)&&s(n,"opacity",m[3]==="yes"?1:0),E&2&&ee(f,m[1]),(!b||E&8&&P!==(P=m[3]==="yes"))&&(g.disabled=P)},i(m){b||(G(a.$$.fragment,m),G(T.$$.fragment,m),b=!0)},o(m){R(a.$$.fragment,m),R(T.$$.fragment,m),b=!1},d(m){m&&v(e),$(a),$(T),V=!1,Ee(B)}}}function be(p){let e,t,n,a="Chain ID",l,o,T,w,i,k,N="Epoch",f,d,h,g,y,P,b="Block Height",V,B,m;return{c(){e=_("div"),t=_("span"),n=_("span"),n.textContent=a,l=z(),o=_("span"),T=F(p[5]),w=z(),i=_("span"),k=_("span"),k.textContent=N,f=z(),d=_("span"),h=F(p[6]),g=z(),y=_("span"),P=_("span"),P.textContent=b,V=z(),B=_("span"),m=F(p[7]),this.h()},l(E){e=u(E,"DIV",{style:!0});var c=x(e);t=u(c,"SPAN",{class:!0,style:!0});var S=x(t);n=u(S,"SPAN",{"data-svelte-h":!0}),J(n)!=="svelte-qvce0s"&&(n.textContent=a),l=M(S),o=u(S,"SPAN",{class:!0});var O=x(o);T=K(O,p[5]),O.forEach(v),S.forEach(v),w=M(c),i=u(c,"SPAN",{class:!0,style:!0});var j=x(i);k=u(j,"SPAN",{"data-svelte-h":!0}),J(k)!=="svelte-163iz11"&&(k.textContent=N),f=M(j),d=u(j,"SPAN",{class:!0});var X=x(d);h=K(X,p[6]),X.forEach(v),j.forEach(v),g=M(c),y=u(c,"SPAN",{class:!0,style:!0});var H=x(y);P=u(H,"SPAN",{"data-svelte-h":!0}),J(P)!=="svelte-6z18ia"&&(P.textContent=b),V=M(H),B=u(H,"SPAN",{class:!0});var q=x(B);m=K(q,p[7]),q.forEach(v),H.forEach(v),c.forEach(v),this.h()},h(){D(o,"class","badge variant-filled-surface"),D(t,"class","badge variant-soft"),s(t,"position","relative"),s(t,"font-size","1.2em"),D(d,"class","badge variant-filled-surface"),D(i,"class","badge variant-soft"),s(i,"position","relative"),s(i,"font-size","1.1em"),D(B,"class","badge variant-filled-surface"),D(y,"class","badge variant-soft"),s(y,"position","relative"),s(y,"font-size","1.1em"),s(e,"display","grid"),s(e,"grid-template-columns","repeat(auto-fit, minmax(200px, 1fr))"),s(e,"gap","4px"),s(e,"width","100%"),s(e,"margin","4px 0")},m(E,c){ne(E,e,c),r(e,t),r(t,n),r(t,l),r(t,o),r(o,T),r(e,w),r(e,i),r(i,k),r(i,f),r(i,d),r(d,h),r(e,g),r(e,y),r(y,P),r(y,V),r(y,B),r(B,m)},p(E,c){c&32&&ce(T,E[5]),c&64&&ce(h,E[6]),c&128&&ce(m,E[7])},d(E){E&&v(e)}}}function ke(p){let e,t;return e=new ze({props:{text:p[4]}}),{c(){W(e.$$.fragment)},l(n){Y(e.$$.fragment,n)},m(n,a){Z(e,n,a),t=!0},p(n,a){const l={};a&16&&(l.text=n[4]),e.$set(l)},i(n){t||(G(e.$$.fragment,n),t=!0)},o(n){R(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Le(p){let e,t,n=p[0]==="yes"&&ye(p);return{c(){n&&n.c(),e=me()},l(a){n&&n.l(a),e=me()},m(a,l){n&&n.m(a,l),ne(a,e,l),t=!0},p(a,[l]){a[0]==="yes"?n?(n.p(a,l),l&1&&G(n,1)):(n=ye(a),n.c(),G(n,1),n.m(e.parentNode,e)):n&&(fe(),R(n,1,1,()=>{n=null}),de())},i(a){t||(G(n),t=!0)},o(a){R(n),t=!1},d(a){a&&v(e),n&&n.d(a)}}}function Oe(p,e,t){let n,a,l,o,T,w,i,k,{prepare:N=()=>({net_name:a})}=e,{every_enhance:f=()=>{}}=e;const d={mainnet:{name:"mainnet",path:"https://api.mainnet.aptoslabs.com/v1"},devnet:{name:"devnet",path:"https://api.devnet.aptoslabs.com/v1"},other:{name:"other",path:""}};let h=0;const g=()=>{console.info("clear info"),t(5,o=""),t(7,T=""),t(6,w=""),t(3,k="no"),t(4,i="")},y=Ae({wait:2e3,wait_for_response:"yes",action:async()=>{if((typeof l=="string"&&l.length>=1)!==!0){console.info(`There's not a "net path" for the ledger loop.`);return}h+=1;const S=h;try{const{enhanced:O}=await Ve({net_path:l});if(h==S){console.info("Modifying the latest stats.");const{chain_id:j}=O;t(5,o=j),t(7,T=O.block_height),t(6,w=O.epoch),t(4,i=""),f({net_name:a,net_path:l,net_connected:"yes",chain_id:o})}}catch(O){t(4,i=O.message),f({net_name:a,net_path:l,net_connected:"no",chain_id:""})}}}),P=async c=>{y.stop(),g(),t(2,a=c.target.value);let S=d[a];t(1,l=S.path),t(3,k="no"),console.log({net:S}),a!=="other"&&y.play()},b=async c=>{y.stop(),g(),t(1,l=c.target.value),t(3,k="no")},V=()=>{y.stop(),g(),t(3,k="yes"),y.play()},B=()=>{y.stop(),g();const c=N();t(2,a=c.net_name);let S=d[a];t(1,l=S.path),t(0,n="yes"),y.play()};Te(()=>{B()}),we(()=>{y.stop()});function m(){a=De(this),t(2,a)}function E(){l=this.value,t(1,l)}return p.$$set=c=>{"prepare"in c&&t(11,N=c.prepare),"every_enhance"in c&&t(12,f=c.every_enhance)},t(0,n="no"),t(2,a="mainnet"),t(1,l=""),t(5,o=""),t(7,T=""),t(6,w=""),t(4,i=""),t(3,k="no"),[n,l,a,k,i,o,w,T,P,b,V,N,f,m,E]}class Fe extends Ne{constructor(e){super(),Pe(this,e,Oe,Le,Ce,{prepare:11,every_enhance:12})}}export{Fe as T};
//# sourceMappingURL=Trinket.DNfIL1Of.js.map
