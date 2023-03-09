Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4836B22F5
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:28:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRkn035vz3cMT
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:28:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U3QmQiwO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X9elkJ+o;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U3QmQiwO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X9elkJ+o;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRkg4g0Zz3brQ
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=U3QmQiwOG2L5ks0Rhj0fWFvBjisjYigNj9RK4QwE10iRclRIRWP1dxaMgh7QXaKqBx6tEl
	YqES2lwLKK+h7t1RYAnnHs3qUJ2IMBj5TMpxlRaHaHXQG2BmjYJNRohplCQ73yrwEtlNOO
	iWI8jeSflcJ8hgywBGCrdayfPplN4Po=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=X9elkJ+oG+F43/92K4ZY+JBB40u81XDmDcsMocP1CMNF64HH3NGjy+IeuuGmXL4aWlGXJB
	Uy1TFl1uRU4JKj/93K99rWIz/SzD74lzhAm1zeygmHguyG+jf4gDK2PpGxbHZ/xOQuSiGm
	Usxu387OziyY+uQcthN3DEFQQjVsKA0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-0Y-dvqGFNkeJwBIDzrO51Q-1; Thu, 09 Mar 2023 06:28:08 -0500
X-MC-Unique: 0Y-dvqGFNkeJwBIDzrO51Q-1
Received: by mail-wm1-f71.google.com with SMTP id az12-20020a05600c600c00b003e8910ec2fdso544960wmb.6
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361287;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=pQ/9HGcP0iJl1mR5FsELIWdIbLSBq5zM3DJhjtFio0qhnRZ4vl+9l4M63wT3rRok06
         cYbCCHem0mVRRGA4O09Sc5IlMyaXoYO/SQPcPLA/ZouecRzL/Q3FBMvb7JwgsfFHEZIr
         E9NkONbIj71dENMRSPZlAC1nf54AnPDc9YqxFw1pcTr+yIqdv8x32Gr0tF8XIR8V8V1+
         dzWzX/qQHC5To5qo9d6B7BxgWyivF0yxRx3xK+c/s0TQ6ab2Rsg4imhi/Qs7olvznMMB
         f9yDDgjIehMU7tuIbjtV/MoYQs07VGna/eueFEAWf3fplL4hpD+Xn12f359M2Y3bIMIu
         229w==
X-Gm-Message-State: AO0yUKXXV5xLIN7hmzwQnk0vBmuso9MRfQWx1QgAIz+HD5Dy+FgE47Up
	mMbxfjcM3bgrul2l0duwFt3GxW5r5Uf9Uwq5I/R2jv2piX0ZneAqsXNKM/SDtcmebFygMrSI5Mr
	0nSA+HYGvB5pfCuMcvQVvLFu56Q==
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id s6-20020a05600c45c600b003eb2e1ebeaemr18094387wmo.25.1678361286868;
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/WVkqnZjpkmSmEiWhaQK18CsrOsasLB6GMCz1AC0uyDvVk4dRPtB1UV7OYFbDbrMsIDiabKA==
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id s6-20020a05600c45c600b003eb2e1ebeaemr18094343wmo.25.1678361286535;
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d4dca000000b002c70bfe505esm17395825wru.82.2023.03.09.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
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
Subject: Re: [PATCH 19/22] drm/arcpgu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-20-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-20-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:05 +0100
Message-ID: <87edpy6u62.fsf@minerva.mail-host-address-is-not-set>
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

