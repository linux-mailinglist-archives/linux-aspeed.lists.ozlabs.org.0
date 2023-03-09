Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728956B22A9
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 12:21:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXRb11rfHz3cTk
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 22:21:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CU40T/dh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CU40T/dh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CU40T/dh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CU40T/dh;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXRZw163jz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 22:21:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CU40T/dhvBztNwrsVnlRl1wprx1SK03OK+kO20wyYBCfHjLSrOzvCMrcJr8eMnaabGSwIh
	rqf/haMMXQc/ahc1CEeEffYvx33ny7wNJXLmUDu8XDDt1OlIiAdOI799V1fy5g+wAOqDNL
	XtBiep6tjUK7UqV/VT5k/GhgUf8UOGU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CU40T/dhvBztNwrsVnlRl1wprx1SK03OK+kO20wyYBCfHjLSrOzvCMrcJr8eMnaabGSwIh
	rqf/haMMXQc/ahc1CEeEffYvx33ny7wNJXLmUDu8XDDt1OlIiAdOI799V1fy5g+wAOqDNL
	XtBiep6tjUK7UqV/VT5k/GhgUf8UOGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-kOPB3Qi_N1mi3LV6xBrUBA-1; Thu, 09 Mar 2023 06:21:24 -0500
X-MC-Unique: kOPB3Qi_N1mi3LV6xBrUBA-1
Received: by mail-wm1-f72.google.com with SMTP id k20-20020a05600c1c9400b003e2249bd2b4so539511wms.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Mar 2023 03:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360883;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=PvKRV565Lvw9ZMIjj1Pnj9PmfYysYTFAzVb4KaV0MUHN38UlmSwx6Z507+b3hxOxFu
         G6P11xH13NyAliuEIzVxlxiFGutdiRlSPyL8oiuBvnZcpp6vooXNEOYTyUowrVvWdMlu
         czRK0B2/hNI2K/wFLwGD6iNMPfH0j+7FBylgTocfayrEvB0qD7tDmOeDKfBsgDbFwzBp
         cONZtw3ktAQH51s9JQEnSjnq8Le+PeT0Gpi8tPriyzH/+bJeQ+8KzO1jk+V75y96q8LL
         veU7OImhPn/gSotQ+2RSmFzHd5fGBA7TQeW7q4leMIHhgXEXMYrRaSukVugLHQ32FNK0
         PnxA==
X-Gm-Message-State: AO0yUKWHMVpfhscNUFJT+qIxLyhsZtCnzRR92ZDyRHbn8MZCf2i7du6u
	6xH0ceaTK+I2Vwwvz+olcA+3a+SuyOzRTZJqVjLIZZ6g7PMO40Mb0AhszbZMnM/omz6GeGRchoj
	XYhxBi3GKdtbuVoUL3x7QDzBfRw==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr18809453wmq.30.1678360883236;
        Thu, 09 Mar 2023 03:21:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9QvIelUa3ZPRMnnDZU4wSkpr+jKhTz8vzz9MlATkeg82OLoMst/ctfKDlY/kc1tAF7ljMTyg==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id u15-20020a05600c19cf00b003e7772d22demr18809404wmq.30.1678360882944;
        Thu, 09 Mar 2023 03:21:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bca50000000b003eb5a0873e0sm2237300wml.39.2023.03.09.03.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:22 -0800 (PST)
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
Subject: Re: [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:22 +0100
Message-ID: <87h6uucgr1.fsf@minerva.mail-host-address-is-not-set>
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

