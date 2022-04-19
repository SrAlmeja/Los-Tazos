void Specular_half (half3 Specular, half3 Smoothness, half3 Direction, half3 Color, half3 WorldNormal, half3 WorldView, out half3 Out)
{
    #if SHADERGRAPH_PREVIEW
    Out = 0;
    #else
    smoothness = exp2(10 * Smoothness) + 1;
    worldNormal = normalize(WorldView);
    worldView = safeNormalize(WorldView);
    Out = LightingSpecular(Color, Direction, worldNormal, worldView, half4 (Specular, 0), smoothness);
    #endif
}