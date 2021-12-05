//
//  VertexDescriptor.swift
//  MGE
//
//  Created by 최승민 on 2021/12/04.
//

import ModelIO

extension MDLVertexDescriptor
{
    static var defaultVertexDescriptor: MDLVertexDescriptor =
    {
        let vertexDescriptor = MDLVertexDescriptor()
        var offset = 0;
        
        // position
        vertexDescriptor.attributes[Int(Position.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributePosition,
                                                                                 format: .float3,
                                                                                 offset: 0,
                                                                                 bufferIndex: Int(BufferIndexVertices.rawValue))
        offset += MemoryLayout<float3>.stride
        
        // normal
        vertexDescriptor.attributes[Int(Normal.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributeNormal,
                                                                               format: .float3,
                                                                               offset: offset,
                                                                               bufferIndex: Int(BufferIndexVertices.rawValue))
        offset += MemoryLayout<float3>.stride
        
        // uv
        vertexDescriptor.attributes[Int(UV.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributeTextureCoordinate,
                                                                           format: .float2,
                                                                           offset: offset,
                                                                           bufferIndex: Int(BufferIndexVertices.rawValue))
        offset += MemoryLayout<float2>.stride
        
        // tangent
        vertexDescriptor.attributes[Int(Tangent.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributeTangent,
                                                                                format: .float3,
                                                                                offset: 0,
                                                                                bufferIndex: 1)
        // bitangent
        vertexDescriptor.attributes[Int(Bitangent.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributeBitangent,
                                                                                  format: .float3,
                                                                                  offset: 0,
                                                                                  bufferIndex: 2)
        
        // color
        vertexDescriptor.attributes[Int(Color.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributeColor,
                                                                           format: .float3,
                                                                           offset: offset,
                                                                           bufferIndex: Int(BufferIndexVertices.rawValue))
        offset += MemoryLayout<float3>.stride
        
        // joints
        vertexDescriptor.attributes[Int(Joints.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributeJointIndices,
                                                                           format: .uShort4,
                                                                           offset: offset,
                                                                           bufferIndex: Int(BufferIndexVertices.rawValue))
        offset += MemoryLayout<ushort>.stride * 4
        
        // joint weights
        vertexDescriptor.attributes[Int(Weights.rawValue)] = MDLVertexAttribute(name: MDLVertexAttributeJointWeights,
                                                                           format: .float4,
                                                                           offset: offset,
                                                                           bufferIndex: Int(BufferIndexVertices.rawValue))
        offset += MemoryLayout<float4>.stride
        
        vertexDescriptor.layouts[0] = MDLVertexBufferLayout(stride: offset)
        vertexDescriptor.layouts[1] = MDLVertexBufferLayout(stride: MemoryLayout<float3>.stride)
        vertexDescriptor.layouts[2] = MDLVertexBufferLayout(stride: MemoryLayout<float3>.stride)
        return vertexDescriptor
    }()
}
