// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New AmplifyShader"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_Text("Text", 2D) = "white" {}
		_Speed("Speed", Float) = 0.0001
		_MonoLED("MonoLED", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float2 texcoord_0;
			float2 texcoord_1;
		};

		uniform sampler2D _MonoLED;
		uniform float4 _MonoLED_ST;
		uniform sampler2D _Text;
		uniform float _Speed;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float mulTime5 = _Time.y * _Speed;
			float2 temp_cast_0 = (mulTime5).xx;
			o.texcoord_0.xy = v.texcoord.xy * float2( 0.5,0.7 ) + temp_cast_0;
			o.texcoord_1.xy = v.texcoord.xy * float2( 0.1,1 ) + float2( 0,0 );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_MonoLED = i.uv_texcoord * _MonoLED_ST.xy + _MonoLED_ST.zw;
			float2 appendResult16 = (float2(i.texcoord_0.x , i.texcoord_1.y));
			float4 temp_output_22_0 = ( tex2D( _MonoLED, uv_MonoLED ) * tex2D( _Text, appendResult16 ) );
			o.Albedo = temp_output_22_0.xyz;
			o.Emission = ( temp_output_22_0 * ( float4(1,0,0,0) * 5.0 ) ).xyz;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=13101
-1017;461;1010;692;2120.247;319.8972;2.137023;True;True
Node;AmplifyShaderEditor.RangedFloatNode;19;-1779.374,397.9834;Float;False;Property;_Speed;Speed;2;0;0.0001;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleTimeNode;5;-1593.888,403.2328;Float;False;1;0;FLOAT;1.0;False;1;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;8;-992.1369,397.3987;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.5,0.7;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;18;-996.6752,546.106;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.DynamicAppendNode;16;-711.9742,508.4857;Float;False;FLOAT2;4;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;1;FLOAT2
Node;AmplifyShaderEditor.SamplerNode;2;-714.7081,184.5685;Float;True;Property;_Text;Text;1;0;Assets/LedDisplay/textLedScreenGETYOURAVATAR 2.jpeg;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SamplerNode;23;-1104.082,-97.31547;Float;True;Property;_MonoLED;MonoLED;3;0;Assets/LedDisplay/MonoLED.jpg;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.ColorNode;48;-474.5405,376.0125;Float;False;Constant;_Color0;Color 0;3;0;1,0,0,0;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;50;-297.7408,560.6122;Float;False;Constant;_Float0;Float 0;3;0;5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;51;-197.641,353.9131;Float;False;2;2;0;COLOR;0.0;False;1;FLOAT;0.0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-246.5829,36.58451;Float;False;2;2;0;FLOAT4;0.0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-130.0409,166.7129;Float;False;2;2;0;FLOAT4;0.0;False;1;COLOR;0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.SamplerNode;1;-754.5398,-437.9749;Float;True;Property;_Mask;Mask;0;0;Assets/LedDisplay/GridLED_000.jpg;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SmoothstepOpNode;46;-1244.142,840.1122;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;40.29999,37.69999;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New AmplifyShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;19;0
WireConnection;8;1;5;0
WireConnection;16;0;8;1
WireConnection;16;1;18;2
WireConnection;2;1;16;0
WireConnection;51;0;48;0
WireConnection;51;1;50;0
WireConnection;22;0;23;0
WireConnection;22;1;2;0
WireConnection;49;0;22;0
WireConnection;49;1;51;0
WireConnection;0;0;22;0
WireConnection;0;2;49;0
ASEEND*/
//CHKSM=F958179D2A3E78323B2AACF20A9BB802787B1E60