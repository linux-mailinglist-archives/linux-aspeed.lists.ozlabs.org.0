Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C1A6B22D9
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRj270wPz3cLs
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:26:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dyNhlerx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6ECdWdU;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dyNhlerx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6ECdWdU;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRhy2Tb9z3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:26:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=dyNhlerx4KGeQzPVLdJY9VxEpDzCTyrV4VJYcaj79/bXeb17BW28rHrFQeZrrULp0wu0Nk
	Yqg+k0I23aVXEDWC6CXPOgHW4gtwm+aen/P3xovNsKwOt/Xrt2bl3CEELAYS29f9k66XjV
	UsP8oh8wPGAH/qrupd7RhTP5rXhqPbU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=O6ECdWdUZtvs3h4wfnsj2/ogeYJ1Uxg8hxHIcb1NllUetFDbJYCeM2lHmUV6moB6FHrztR
	5gqYDI1KfC3Jp7+/BSONzdyYENUlZ/oEQNvRXs7UvPcDxY+gx7j2LM5yt5KgmRNNkoUgSs
	FpkphkmcAWeXuZNqXt7jzgTKqaPK1tM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-T-_JmkYGPDKGBOQPTJqiBQ-1; Thu, 09 Mar 2023 06:26:38 -0500
X-MC-Unique: T-_JmkYGPDKGBOQPTJqiBQ-1
Received: by mail-wm1-f72.google.com with SMTP id l23-20020a7bc457000000b003e206cbce8dso543224wmi.7
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361197;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=jU50cNH7tXwv8m3d84fUdbz8JfF5fsT78Hfe/rqsC+pINcu64JE1lYfA1w3egbmm5q
         24+en3JLlUXK8skiCGjz1KuxNPm28PAgmtRg3nw9LUwlrykfdwTfkmkUPDoujKq01GxZ
         4rN31ZP7EqKoKFdimoQKrGFbbwLKqW8AFlsPsYd44awWISMt7CnS6M/7tuas5cqN23zw
         1irdrKLUjb+LMVHsQkvZNSl/UUf5L1kx3fD0lRIvGEuza0swVg9e1DswIB5HJeTn68uE
         7M9CTEnKeEyMoeQ2aE6zDyo9DAoJjtnPz/+OJFRX4UKja5PDrsbHpjWwrUt7bp+wykGA
         KOBw==
X-Gm-Message-State: AO0yUKU2Eztpx+SoDGnDB2j10GjKYZg5QecE101UDajSf5pSwebyrY7F
	cq6yw3upUqw5OSP/BU+/VCuAWm+yR8YbiElhyNv4mXYhf2VbTwhcPVBGOiAX541+XnJjLqYvr3S
	EtNDaDR8gy9mRzUYnK96dkHH5VA==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id u15-20020a05600c19cf00b003db05f153a5mr19369375wmq.20.1678361197618;
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+RyBjxyYc/phvqksZd0yr2bTO+U8qhrE/l56ozt/Hpw5EwIkObMj058GJMfnxZhhD8JebzIw==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id u15-20020a05600c19cf00b003db05f153a5mr19369354wmq.20.1678361197403;
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c1c9700b003e21f01c426sm2647711wms.9.2023.03.09.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 15/22] drm/stm: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-16-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-16-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:36 +0100
Message-ID: <87pm9i6u8j.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

