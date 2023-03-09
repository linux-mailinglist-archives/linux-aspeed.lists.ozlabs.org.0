Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F16B2282
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:18:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRVw38R2z3cP0
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:18:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFI5NolL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFI5NolL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFI5NolL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFI5NolL;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRVp1ZTxz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:17:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=KFI5NolLW00M30XYJxkQ4MIHgLq0upzBFWGrVN73sW1eARaypBeC/FuDewBCvaVTJctFoq
	iIEqDyM+fu03ea/H2UFE5LU+JNir/dQlYcXI9pEKpD+V8yEto9nPEZstTrMkLCPOFg16Bf
	eJHZuZApcuEiBi9juOPLHameLIR0iU8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=KFI5NolLW00M30XYJxkQ4MIHgLq0upzBFWGrVN73sW1eARaypBeC/FuDewBCvaVTJctFoq
	iIEqDyM+fu03ea/H2UFE5LU+JNir/dQlYcXI9pEKpD+V8yEto9nPEZstTrMkLCPOFg16Bf
	eJHZuZApcuEiBi9juOPLHameLIR0iU8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-K70GmbShM0C-47AxUWOoXw-1; Thu, 09 Mar 2023 06:17:49 -0500
X-MC-Unique: K70GmbShM0C-47AxUWOoXw-1
Received: by mail-wm1-f70.google.com with SMTP id z6-20020a7bc7c6000000b003e0107732f4so537599wmk.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360668;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=V7HOwvepzUseMa5iQknOUoAOtDSxIW05Y2FJHIRVMa5XEqh2M4R3Heeh4Ef8q1ppTM
         ZBnK1cPJiNbZlYWvPzEVvM9LJD4gROr3IIw4eIuLr3/648ikQeRbeE1KYJU0761SL2aK
         DaWNPUQxCVvDrIoYUj3aVI85GHqXCTSwv0Dx+EWWSL+Y9/GSy9/uupycE3a1C8u42Vxw
         qJyEODbVDuG/HntsTmtIb4AaE8X8p+KQibYNl5Z0YVGkMODD9cYXvkUpkd3zVnikedIc
         DzEzfsrisqMpmu62ETIosa+CG0BhnvbENMW1XNEGDRfxjNePko04mDhyf8W/m+aavJ8V
         SWgA==
X-Gm-Message-State: AO0yUKUaqcg5wrWKIe988WNkMnoCEg4J8Heha3x6ArfpianyDJk/M8qA
	0fjXqOpyaVF72tz9NIN+voCgzbsGq2l1u4OLAUQsc8NLUDSLIFZhXyLoEwUkme8CnLl6Bg1D1f+
	+G/ibQKOuFUNNP9X8PZRqGYg4Ew==
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id o13-20020a5d670d000000b002c713197b1dmr13606683wru.39.1678360668801;
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8t7W3VVjilkedn2prHPhya2P0ttMZiu2dHkADuEES7J7gfekac/bMcyXv4f/qMKVji9jryrA==
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id o13-20020a5d670d000000b002c713197b1dmr13606665wru.39.1678360668526;
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c12-20020a5d63cc000000b002c5801aa9b0sm17711159wrw.40.2023.03.09.03.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:17:48 -0800 (PST)
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
Subject: Re: [PATCH 02/22] arm/hdlcd: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-3-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-3-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:17:47 +0100
Message-ID: <87y1o6cgx0.fsf@minerva.mail-host-address-is-not-set>
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

