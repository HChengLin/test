// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-8292-OUT;n:type:ShaderForge.SFN_Tex2d,id:2838,x:32576,y:32807,ptovrint:False,ptlb:node_2838,ptin:_node_2838,varname:node_2838,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:6780,x:32371,y:33036,varname:node_6780,prsc:2|EXP-4008-OUT;n:type:ShaderForge.SFN_Add,id:8292,x:32835,y:32909,varname:node_8292,prsc:2|A-2838-RGB,B-7050-OUT;n:type:ShaderForge.SFN_Color,id:3449,x:32371,y:33246,ptovrint:False,ptlb:node_3449,ptin:_node_3449,varname:node_3449,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5824503,c2:0.830655,c3:0.9779412,c4:1;n:type:ShaderForge.SFN_Multiply,id:7050,x:32611,y:33122,varname:node_7050,prsc:2|A-6780-OUT,B-3449-RGB;n:type:ShaderForge.SFN_Slider,id:3669,x:31784,y:33126,ptovrint:False,ptlb:node_3669,ptin:_node_3669,varname:node_3669,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3675214,max:1;n:type:ShaderForge.SFN_RemapRange,id:4008,x:32142,y:33036,varname:node_4008,prsc:2,frmn:0,frmx:1,tomn:11,tomx:0.1|IN-3669-OUT;n:type:ShaderForge.SFN_ViewVector,id:553,x:31646,y:32726,varname:node_553,prsc:2;n:type:ShaderForge.SFN_Dot,id:8401,x:31896,y:32607,varname:node_8401,prsc:2,dt:1|A-5762-OUT,B-553-OUT;n:type:ShaderForge.SFN_OneMinus,id:2715,x:32103,y:32632,varname:node_2715,prsc:2|IN-8401-OUT;n:type:ShaderForge.SFN_Slider,id:8030,x:31919,y:32847,ptovrint:False,ptlb:node_8030,ptin:_node_8030,varname:node_8030,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:5.6,max:10;n:type:ShaderForge.SFN_NormalVector,id:5762,x:31646,y:32565,prsc:2,pt:False;n:type:ShaderForge.SFN_Power,id:8950,x:32333,y:32738,cmnt:CustomFresnel,varname:node_8950,prsc:2|VAL-2715-OUT,EXP-8030-OUT;proporder:2838-3449-3669-8030;pass:END;sub:END;*/

Shader "Shader Forge/_03" {
    Properties {
        _node_2838 ("node_2838", 2D) = "gray" {}
        [HDR]_node_3449 ("node_3449", Color) = (0.5824503,0.830655,0.9779412,1)
        _node_3669 ("node_3669", Range(0, 1)) = 0.3675214
        _node_8030 ("node_8030", Range(0.1, 10)) = 5.6
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_2838; uniform float4 _node_2838_ST;
            uniform float4 _node_3449;
            uniform float _node_3669;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _node_2838_var = tex2D(_node_2838,TRANSFORM_TEX(i.uv0, _node_2838));
                float node_6780 = pow(1.0-max(0,dot(normalDirection, viewDirection)),(_node_3669*-10.9+11.0));
                float3 finalColor = (_node_2838_var.rgb+(node_6780*_node_3449.rgb));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
