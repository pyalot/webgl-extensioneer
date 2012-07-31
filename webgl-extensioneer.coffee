'''
Copyright (c) 2012, Florian Boesch <pyalot@gmail.com> http://codeflow.org/

WebGL Extensioneer is licensed under any of the following licenses at your choosing:

MIT: see mit-license
GPL: see gpl-license
BSD: see bsd-license
'''

registry =
    ratified: []
    approved: [
        'OES_texture_float'
        'OES_texture_half_float'
        'OES_standard_derivatives'
        'WEBGL_debug_renderer_info'
        'WEBGL_debug_shaders'
        'EXT_texture_filter_anisotropic'
    ],
    draft: [
        'WEBGL_lose_context'
        'OES_vertex_array_object'
        'WEBGL_compressed_texture_s3tc'
        'WEBGL_depth_texture'
        'OES_element_index_uint'
    ]

getExtension = WebGLRenderingContext.prototype.getExtension
WebGLRenderingContext.prototype.getExtension = (name, {ratified, approved, draft}={}) ->
    ratified ?= true
    approved ?= true
    draft ?= false

    for supported in @getSupportedExtensions()
        index = supported.indexOf name
        if index >= 0 then break

    if index == -1 then return null

    is_ratified = registry.ratified.indexOf(name) >= 0
    is_approved = registry.approved.indexOf(name) >= 0
    is_draft = registry.draft.indexOf(name) >= 0

    if is_ratified and ratified
        return getExtension.call @, supported
    else if is_approved and approved
        return getExtension.call @, supported
    else if is_draft and draft
        return getExtension.call @, supported
    else
        return null
