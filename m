Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1706B229F
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRZ96xyWz3cXf
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:20:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VcaBdZhC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VcaBdZhC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VcaBdZhC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VcaBdZhC;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRZ44Tncz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:20:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=VcaBdZhCNdA2qk6UngItWJM2Zsy2DJgYqGVMFCWRvl2uWu5Gf6grEEm8MtDqgnEQOVVCSZ
	6lPELiORVZeOuFVO5ki1VzOQEEKPUqb0hmKe8AcxVHfoKFJFKu1elPmlfWzx8ZlnctBgds
	bD7pwk4/dRg+d/FRy30yDu9hm+zGeZc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=VcaBdZhCNdA2qk6UngItWJM2Zsy2DJgYqGVMFCWRvl2uWu5Gf6grEEm8MtDqgnEQOVVCSZ
	6lPELiORVZeOuFVO5ki1VzOQEEKPUqb0hmKe8AcxVHfoKFJFKu1elPmlfWzx8ZlnctBgds
	bD7pwk4/dRg+d/FRy30yDu9hm+zGeZc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-VEHck71KPDyi6K1rz4021g-1; Thu, 09 Mar 2023 06:20:41 -0500
X-MC-Unique: VEHck71KPDyi6K1rz4021g-1
Received: by mail-wr1-f71.google.com with SMTP id o3-20020a5d6483000000b002cc4fe0f7fcso345484wri.7
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360840;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=3jRfGFTX7Q/snagTA5rUnGqLEV/Z58FKCatTpTN+H6cZWM7uFJ+kD9szZ6acAOOUxj
         zzftyncU78vSsUcxoTTuiStjtL+LjhCVteAEcQuxfwqq0xbOeUzyG72NFJIxJovVIDVd
         +z+Er7ns7coqN4ErCFHc8FZQFtBeL3tG0X6E9dzBvzZdXswyWtnHMyNIi2Dl50bR0j6c
         XwtNKIPPbfQb1qo7IuGM0SdXWyVR8pKJIXklgSSeQygYlU6BlzikEwtwKTE5bzTZU5W9
         oj8H9Eq+hulTnzH4W5NaZFHAHw1y0RshYSlSD4Aoi9T07FPGLbYMpfETlrNZfBSa6ygK
         /V6w==
X-Gm-Message-State: AO0yUKW+xC86GXUVfMBTPJcVvXaSMNoDlfo5iWgBTA6Yxi0Qhxiv/Oqn
	r4ryYwbX5tOHQF/zr+HeCLHLRY6nUlGCQKDOxwj1/KqBqylFMu3R6VoFwtrEy8SsWrKTk9nYiMY
	rpHacK10YvOa+8X0aH0bU6XeKow==
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id v9-20020a05600c444900b003dfe659f9d9mr17924813wmn.34.1678360840101;
        Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-Smtp-Source: AK7set90uCM0Kw514Efx0RC1JOWrOFPoY3H9ZtCG8DZJ7CZ4XdZwaIBFGLtcMSgQBx3eBGbTb1Y4bA==
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id v9-20020a05600c444900b003dfe659f9d9mr17924778wmn.34.1678360839923;
        Thu, 09 Mar 2023 03:20:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b003eaf666cbe0sm2386747wmb.27.2023.03.09.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:39 -0800 (PST)
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
Subject: Re: [PATCH 06/22] drm/fsl-dcu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-7-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-7-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:39 +0100
Message-ID: <87mt4mcgs8.fsf@minerva.mail-host-address-is-not-set>
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

