import{E as w,F as A,G as S,H as P,I as L,J as I,K as x,L as T,M as G,N as R,O as V,P as B,Q as D,R as E,S as N,U as q,V as g,W as H,X as U,Y as J,Z as K,z as Q}from"./0.C1v_il9P.js";var W=w,X=A;function Y(r,e,n){(n!==void 0&&!X(r[e],n)||n===void 0&&!(e in r))&&W(r,e,n)}var m=Y;function Z(r){return function(e,n,i){for(var t=-1,s=Object(e),o=i(e),a=o.length;a--;){var f=o[r?a:++t];if(n(s[f],f,s)===!1)break}return e}}var z=Z,k=z,ee=k(),re=ee,ne=S,te=P;function ae(r){return te(r)&&ne(r)}var ie=ae,se=L,oe=I,fe=P,ue="[object Object]",le=Function.prototype,ve=Object.prototype,M=le.toString,ce=ve.hasOwnProperty,ge=M.call(Object);function _e(r){if(!fe(r)||se(r)!=ue)return!1;var e=oe(r);if(e===null)return!0;var n=ce.call(e,"constructor")&&e.constructor;return typeof n=="function"&&n instanceof n&&M.call(n)==ge}var pe=_e;function de(r,e){if(!(e==="constructor"&&typeof r[e]=="function")&&e!="__proto__")return r[e]}var j=de,be=x,ye=T;function Oe(r){return be(r,ye(r))}var $e=Oe,d=m,he=G,Ae=R,Se=V,Pe=B,b=D,y=E,Te=ie,me=N,Me=q,je=g,Ce=pe,Fe=H,O=j,we=$e;function Le(r,e,n,i,t,s,o){var a=O(r,n),f=O(e,n),_=o.get(f);if(_){d(r,n,_);return}var u=s?s(a,f,n+"",r,e,o):void 0,l=u===void 0;if(l){var v=y(f),c=!v&&me(f),p=!v&&!c&&Fe(f);u=f,v||c||p?y(a)?u=a:Te(a)?u=Se(a):c?(l=!1,u=he(f,!0)):p?(l=!1,u=Ae(f,!0)):u=[]:Ce(f)||b(f)?(u=a,b(a)?u=we(a):(!je(a)||Me(a))&&(u=Pe(f))):l=!1}l&&(o.set(f,u),t(u,f,i,s,o),o.delete(f)),d(r,n,u)}var Ie=Le,xe=U,Ge=m,Re=re,Ve=Ie,Be=g,De=T,Ee=j;function C(r,e,n,i,t){r!==e&&Re(e,function(s,o){if(t||(t=new xe),Be(s))Ve(r,e,o,n,C,i,t);else{var a=i?i(Ee(r,o),s,o+"",r,e,t):void 0;a===void 0&&(a=s),Ge(r,o,a)}},De)}var Ne=C;function qe(r){return r}var F=qe;function He(r,e,n){switch(n.length){case 0:return r.call(e);case 1:return r.call(e,n[0]);case 2:return r.call(e,n[0],n[1]);case 3:return r.call(e,n[0],n[1],n[2])}return r.apply(e,n)}var Ue=He,Je=Ue,$=Math.max;function Ke(r,e,n){return e=$(e===void 0?r.length-1:e,0),function(){for(var i=arguments,t=-1,s=$(i.length-e,0),o=Array(s);++t<s;)o[t]=i[e+t];t=-1;for(var a=Array(e+1);++t<e;)a[t]=i[t];return a[e]=n(o),Je(r,this,a)}}var Qe=Ke;function We(r){return function(){return r}}var Xe=We,Ye=Xe,h=J,Ze=F,ze=h?function(r,e){return h(r,"toString",{configurable:!0,enumerable:!1,value:Ye(e),writable:!0})}:Ze,ke=ze,er=800,rr=16,nr=Date.now;function tr(r){var e=0,n=0;return function(){var i=nr(),t=rr-(i-n);if(n=i,t>0){if(++e>=er)return arguments[0]}else e=0;return r.apply(void 0,arguments)}}var ar=tr,ir=ke,sr=ar,or=sr(ir),fr=or,ur=F,lr=Qe,vr=fr;function cr(r,e){return vr(lr(r,e,ur),r+"")}var gr=cr,_r=A,pr=S,dr=K,br=g;function yr(r,e,n){if(!br(n))return!1;var i=typeof e;return(i=="number"?pr(n)&&dr(e,n.length):i=="string"&&e in n)?_r(n[e],r):!1}var Or=yr,$r=gr,hr=Or;function Ar(r){return $r(function(e,n){var i=-1,t=n.length,s=t>1?n[t-1]:void 0,o=t>2?n[2]:void 0;for(s=r.length>3&&typeof s=="function"?(t--,s):void 0,o&&hr(n[0],n[1],o)&&(s=t<3?void 0:s,t=1),e=Object(e);++i<t;){var a=n[i];a&&r(e,a,i,s)}return e})}var Sr=Ar,Pr=Ne,Tr=Sr,mr=Tr(function(r,e,n){Pr(r,e,n)}),Mr=mr;const Cr=Q(Mr);export{Cr as _};
//# sourceMappingURL=merge.DECNL9ng.js.map
