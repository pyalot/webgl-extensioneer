'''
Copyright (c) 2012, Florian Boesch <pyalot@gmail.com> http://codeflow.org/

WebGL Extensioneer is licensed under any of the following licenses at your choosing:

MIT: see mit-license
GPL: see gpl-license
BSD: see bsd-license
'''

spec_approved = [
    'OES_texture_float'
    'OES_texture_half_float'
    'OES_standard_derivatives'
    'WEBGL_debug_renderer_info'
    'WEBGL_debug_shaders'
    'EXT_texture_filter_anisotropic'
]

vendors = ['MOZ_', 'IE_', 'O_', 'WEBKIT_']

if window.WebGLRenderingContext?
    getExtension = WebGLRenderingContext.prototype.getExtension
    WebGLRenderingContext.prototype.getExtension = (name, {approved, draft, ref}={}) ->
        approved ?= true
        draft ?= false
        ref ?= 'browser'

        supported = false
        for extname in @getSupportedExtensions()
            if extname.indexOf(name) >= 0
                supported = true
                break

        return null if supported is false

        if ref is 'browser'
            is_approved = true
            for vendor in vendors
                if extname.indexOf(vendor) == 0
                    is_approved = false
                    break
        else
            is_approved = spec_approved.indexOf(name) >= 0

        if is_approved and approved
            return getExtension.call @, extname
        else if not is_approved and draft
            return getExtension.call @, extname
        else
            return null
