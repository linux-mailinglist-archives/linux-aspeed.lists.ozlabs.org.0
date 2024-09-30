Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4898B040
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkc2df8z3fvY
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697881;
	cv=none; b=csSU6/y9BYqIVLEZ0+ZaHLiAQf32JjOqgnBCTnN8Ww0YzKoRxKS58LyPGkchatC4Om3G2DBiyCCdxQF27ctSTN8aXzzFew2O31tnzYXHERMgxVO1TjWiJ4wkAW47C2972XyUpUFZZpr4KOrTy2J6Eyi2lIF9RZRunjcXsmrOEEsQh4bOJTRLoCo3hXJR5yP3nZMEoSG78FcuZ2ARIxzXCjGl1vNdqRe1sM4pKrCsq1oRKdFkDFU53t/xJuJmcZhB99FGEE5bfeN52rJBy6furUEz+CdP5IfCL3dHteD6nDAK9ffsQ4Xdh0xVcQfUxZ74JyDEZslbWgNZpolT2LV9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697881; c=relaxed/relaxed;
	bh=W54Rxedr36zEnsk929u7YgHxA5FxY+YC4oIk0CEmtoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhfsV0Pz6JiqU3pfQ/sYfOSUp358nbePrGVYOv6+pcZh2Mm2XiNdOSLt30e76W+MEoffJjCaUy4tchZcD9/e9Fo+aXM+CdlzcI2+rMeUuwLbaiBaWUFjHw2lY5SfM19DgpOjClE+nR4m0KICnNezKBf73L76AVqNTSNOTr2zbU3QGDlsYoF1a8687e1yF/h09ZWtl4kS7x3ILp7aVkIQwGj+VzQSQMnfv5icDYvRPrYyZQlKB40zQwRvmjhNhPpvB3G6brVKdItrcAvAWudhg0utiy3l08haqaVLPxU7ejcaw0VGTTTHNmRfmGeWPCvNxx9avLxVil285haUWe4uCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Sq2Bx3IN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Sq2Bx3IN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWF2S0yz2yPq
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:41 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6cb3ba0a9a2so24000736d6.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697878; x=1728302678; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W54Rxedr36zEnsk929u7YgHxA5FxY+YC4oIk0CEmtoU=;
        b=Sq2Bx3INGcQscl1PqLkk4/Yg/Ux0p8Tfk9A0MBiJ6r8BXyGddJrjJIbreaPIXryptM
         o2/YBh1zHGg+iMgyfJP112fekagoM/1fFglSrfZVsck0tAMEqlDmJQaErsLKbiCYyomr
         VqbocmKDF0nr2DBsiAZZdabQ6Q8P8Z83vkSuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697878; x=1728302678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W54Rxedr36zEnsk929u7YgHxA5FxY+YC4oIk0CEmtoU=;
        b=msXWD8wZ49B7KSZLZ7edK3tjgf69zYpYuVUhAOUiGI/ievn7ZAUjYvgwRc9Fee1+mV
         xfCNigNFvzcmgL85IR6wuCke5labIRh45APx/mCH6CSJxC5jPTiZBU2WHA3gQOY8h91n
         JKSJBa6Gy0a0u9cYAKTZ01x0/pWbMTdvqCHJKd5LIWgrUM3fmzdeg8O2MyzRI3YNUD3w
         yauNmTAkOsGXoGXjfTFuwkwxZTDr2D22lppT9D+uCl7JZr+VkDCqjElYXUXT5QeHb/Fc
         IImtOhWTjcfm8gtUyhCmOh5JsrJDGjGuPveGl5KvaaI1FwBCOOOEC7afv8tOU0bp2BJp
         ns+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPxFOxgXFhIEoMN0CBEzRC+FfTQOPPfjS7XFVlk70BFxqQzLOQKhvZmcJrXxgQg9hQ+UylfLMOmmgSHfI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0zEmufRzlQJkxdJdWCvRTWaSR8RCa8zVubskyIe+D8yx+VFm3
	1e8jRc55WcH4aruBFTniFtl6YVKFY7XQth1eccEqD3S5K86PKHpaofAvbFRc1g==
X-Google-Smtp-Source: AGHT+IGgo8OgcYFtsubdwQ48E/Z3+k42qUYOU3xS8KlzOd05WOz0ImPebYZJQvx35b0omDgntAq/gQ==
X-Received: by 2002:ad4:580c:0:b0:6cb:3b6d:2775 with SMTP id 6a1803df08f44-6cb3b6d2d88mr154770176d6.17.1727697878145;
        Mon, 30 Sep 2024 05:04:38 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:11 +0000
Subject: [PATCH 16/45] media: pci: ivtv: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-16-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The following cocci warnings are fixed:
drivers/media/pci/ivtv/ivtvfb.c:809:3-57: opportunity for str_on_off(( var -> vmode & FB_VMODE_MASK ) == FB_VMODE_NONINTERLACED)
drivers/media/pci/ivtv/ivtvfb.c:609:3-57: opportunity for str_on_off(( var -> vmode & FB_VMODE_MASK ) == FB_VMODE_NONINTERLACED)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ivtv/ivtvfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index 90c584cf97c2..bd07afc68191 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -606,7 +606,7 @@ static int ivtvfb_set_var(struct ivtv *itv, struct fb_var_screeninfo *var)
 		      var->left_margin, var->upper_margin);
 
 	IVTVFB_DEBUG_INFO("Display filter: %s\n",
-			(var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED ? "on" : "off");
+			str_on_off((var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED));
 	IVTVFB_DEBUG_INFO("Color space: %s\n", var->nonstd ? "YUV" : "RGB");
 
 	return 0;
@@ -806,7 +806,7 @@ static int _ivtvfb_check_var(struct fb_var_screeninfo *var, struct ivtv *itv)
 		      var->left_margin, var->upper_margin);
 
 	IVTVFB_DEBUG_INFO("Display filter: %s\n",
-			(var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED ? "on" : "off");
+			str_on_off((var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED));
 	IVTVFB_DEBUG_INFO("Color space: %s\n", var->nonstd ? "YUV" : "RGB");
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

