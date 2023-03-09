Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15386B22FB
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:28:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRlD4Fjdz3cMN
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:28:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=byuRJFsg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6EWGSlB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=byuRJFsg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R6EWGSlB;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRl441BJz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:28:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=byuRJFsgwIbmwDoClgXjpGIRY7fzH9iO0cMStxilik1zPmdx7J0FLlIb5ch1zowP9Qs8Md
	1hQ+angNnLqqW5CPIQgTMWFQusJw3av0PZp3pMUI6QgOcylvGMWAprKL7ybDnp6aBLIdhS
	n7iYiQPDhJHLsFHs9yn2X4AobuDRLBQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=R6EWGSlBvFxksTxhhBgfGDWue2APbF3pNxltM0yUPTyOnDLYvZocUJiYjpqYbU6cZ2ldbz
	DAvTwrnBxJJ9xJbW92HU3qyTbYo75/V9i6KB/s8Kb/yrQnndOteOzBxIfBbycL6nG6qFW8
	Ttr2HRvM1j/C1N7Lua9oIt2UA8/ZSzs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-6-3kBu7aPtGTmdpFjpF2rQ-1; Thu, 09 Mar 2023 06:28:28 -0500
X-MC-Unique: 6-3kBu7aPtGTmdpFjpF2rQ-1
Received: by mail-wm1-f69.google.com with SMTP id j32-20020a05600c1c2000b003e9bdf02c9fso2250743wms.6
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361308;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=kggjsVMeXUJfTB325unEe0tK7ZhpnLEEpbR0RPll9EeEVcHDQf2+SDP08EEuNvxn7U
         7Scxq+MJCcWTNDlEuRSMw5vBJHV1GXSSkgdC/RPj4a7hyf7XjT+YSQa1MXL9TVzZ/qQm
         6nxH1O7/Xt2rqki8Y/38U0RJ3765PQ08bMB2qvauTxumX2H9aDssJSPCVZPAM9HhAq6t
         gzOO4Dx5Ahsw4jUUBUmgE+wp+K0QIyGuey21kQZJV7BHAdmjcWzJFRqtLhppuhuKLzBU
         2R5Vs4e0nS1HKiJ/F17jZAihX6JFRUyfRZuoOIFnXXPrgOjOwHk+We2zeJMUgLgHrZtl
         bxSA==
X-Gm-Message-State: AO0yUKVC1n5DHYzQWYxt6gytVPlO6w3Bkv2nhCypU6fCksi56KxlQcDF
	OQMWet4evZMyshls29goJFDBsYRAQwx61JCAunBcoLguCx4lCv+t370oiNlKdbiArSl27WITnF8
	oVYmjV0G9jtUtW2VeeUhVcfrA8Q==
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id z11-20020adfe54b000000b002ce7b1462famr5641272wrm.18.1678361307866;
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9maKowzBLXhrmVUURVySuRkGf+S+tkdt6mfteqqV00Jt+aM76M3w51SKUbdQy9Rrz6LZ2GlQ==
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id z11-20020adfe54b000000b002ce7b1462famr5641233wrm.18.1678361307645;
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003eb68bb61c8sm2498550wmo.3.2023.03.09.03.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
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
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-21-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:26 +0100
Message-ID: <87bkl26u5h.fsf@minerva.mail-host-address-is-not-set>
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

