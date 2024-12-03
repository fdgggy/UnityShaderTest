// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unity Shaders Book/Chapter 5/Simple Shader"  //shader name, 出现在material下拉列表里
{
    Properties //材质和shader的桥梁，会出现在材质的面板中,可以方便的调整各种材质属性
    {
        //_MainTex ("Texture", 2D) = "white" {}
    }
    SubShader//针对显卡A的子着色器，Unity会选择第一个能在目标平台上运行的SubShader，都不支持就会选择Fallback语义内的指定
    {
        //Tags { "RenderType"="Opaque" }  //用于所有Pass,在Pass内定义只会影响当前Pass. 告诉渲染引擎，如何何时渲染这个对象。只有特定的Tag只能在SubShader定义不能再Pass内定义。

        Pass //定义了一次完整的渲染流程，Pass过多会造成渲染性能下降
        {
          CGPROGRAM

          #pragma vertex vert  //编译指令,为了告诉unity，顶点着色器和片元着色器的函数
          #pragma fragment frag

          float4 vert(float4 v : POSITION) : SV_POSITION { //逐顶点执行
              return UnityObjectToClipPos (v);//该顶点在裁剪空间中的位置 原版：mul (UNITY_MATRIX_MVP, v);
          }

          fixed4 frag() : SV_Target { //把输出颜色存储到一个渲染目标中，默认是帧缓存
              return fixed4(1.0, 1.0, 1.0, 1.0); //颜色在[0,1]
          }
          
          ENDCG
        }
    }
}
