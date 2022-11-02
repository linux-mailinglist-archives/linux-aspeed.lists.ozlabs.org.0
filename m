Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF9615FC8
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 10:32:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2M9n2dqmz3cLx
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 20:32:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g86kVOmV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g86kVOmV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g86kVOmV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g86kVOmV;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2M9c0rWWz3cC0
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Nov 2022 20:32:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667381536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
	b=g86kVOmVqcJ3jvx7QLkap7dOJqWx4Jkz4xwCyM5E3D5uU39i8xAefQvqxOKN5H5LoxvUsS
	PIC72S+nNsAaw1AjBB0WT2jmkEDsxqvhrcNE9IXrbtcn7F5l8j3iSkrfnqjMOP901MtXZm
	CJcXGUj8XU5QGMG0V3YLjmFRZQfk710=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667381536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
	b=g86kVOmVqcJ3jvx7QLkap7dOJqWx4Jkz4xwCyM5E3D5uU39i8xAefQvqxOKN5H5LoxvUsS
	PIC72S+nNsAaw1AjBB0WT2jmkEDsxqvhrcNE9IXrbtcn7F5l8j3iSkrfnqjMOP901MtXZm
	CJcXGUj8XU5QGMG0V3YLjmFRZQfk710=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-T6TNUFirOK6y9pE_sSD6LQ-1; Wed, 02 Nov 2022 05:32:15 -0400
X-MC-Unique: T6TNUFirOK6y9pE_sSD6LQ-1
Received: by mail-wm1-f70.google.com with SMTP id r187-20020a1c44c4000000b003c41e9ae97dso825829wma.6
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 02:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
        b=DuBmO1p+lqinFuSwhiHFwc6btkvErbN4gEuGwCCydijaKe/OpNh96PiPZL8ZfVm+Gh
         bJYC+thK4u6L9aoTtMNc0jozevlEKdRpYMD7LsL5ca0q7Yq7r8+bz7R5EuuyYU4CMhjH
         nbJ24LjBSvkoyKBmB4VT/bJxF4FtGjAaJbKYrWL1Y9QiWt6CyerP0a9A7NyPmm/cSkrR
         Nj9m8mBFHdoK1udrASXKuLd5OX7fa14cedTXsi/h93HeAc/YWwVloYI1m2yEj+Lo7s6m
         LBsXeu+Vj85CZjRiweY6Baq9/V+Ht0k0odanJ1gl7h7L3Yx2HRg+zFr6kZJYkshlQvTr
         /1Qw==
X-Gm-Message-State: ACrzQf0hVkdjTb46AnN1UuyanOxNO1kak7ki4c3Xg2gWQSAQ1egbav1S
	RYahoRwPglsANaHhwlF6OrraFDOth9UqBVV+o8kBEUsxOEHvqKNN80xIYyzFPfyLHXwxYXG8EcN
	GAzdS7hrQmD3egd2c2Pxv4odFDA==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443607wmb.154.1667381534283;
        Wed, 02 Nov 2022 02:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iks5yFnak5X2iZPcs6wSoPN4c8RmVdgyjVaQzUQOEwDY0j8GZM7MD/vLKrS0XyFefd22bEw==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443583wmb.154.1667381533975;
        Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x21-20020a1c7c15000000b003b492753826sm1361990wmc.43.2022.11.02.02.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Message-ID: <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
Date: Wed, 2 Nov 2022 10:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the
 same implementation
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-18-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-18-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org, spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Implement the fbdev's read/write helpers with the same functions. Use
> the generic fbdev's code as template. Convert all drivers.
> 
> DRM's fb helpers must implement regular I/O functionality in struct
> fb_ops and possibly perform a damage update. Handle all this in the
> same functions and convert drivers. The functionality has been used
> as part of the generic fbdev code for some time. The drivers don't
> set struct drm_fb_helper.fb_dirty, so they will not be affected by
> damage handling.
> 
> For I/O memory, fb helpers now provide drm_fb_helper_cfb_read() and
> drm_fb_helper_cfb_write(). Several drivers require these. Until now
> tegra used I/O read and write, although the memory buffer appears to
> be in system memory. So use _sys_ helpers now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
> +				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
> +{

[...]

> +	/*
> +	 * Copy to framebuffer even if we already logged an error. Emulates
> +	 * the behavior of the original fbdev implementation.
> +	 */
> +	ret = write_screen(info, buf, count, pos);
> +	if (ret < 0)
> +		return ret; /* return last error, if any */
> +	else if (!ret)
> +		return err; /* return previous error, if any */
> +
> +	*ppos += ret;
> +

Should *ppos be incremented even if the previous error is returned?

The write_screen() succeeded anyways, even when the count written was
smaller than what the caller asked for.

>  /**
> - * drm_fb_helper_sys_read - wrapper around fb_sys_read
> + * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
>   * @info: fb_info struct pointer
>   * @buf: userspace buffer to read from framebuffer memory
>   * @count: number of bytes to read from framebuffer memory
>   * @ppos: read offset within framebuffer memory
>   *
> - * A wrapper around fb_sys_read implemented by fbdev core
> + * Returns:
> + * The number of read bytes on success, or an error code otherwise.
>   */

This sentence sounds a little bit off to me. Shouldn't be "number of bytes read"
instead? I'm not a native English speaker though, so feel free to just ignore me.

[...]

>  
> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
> +				   loff_t pos)
> +{
> +	const char __iomem *src = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Do you really need these two? AFAIK ssize_t is a signed type
so you can just use the ret variable to store and return the
errno value.

[...]

> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> +				    loff_t pos)
> +{
> +	char __iomem *dst = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Same here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

