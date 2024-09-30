Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B22CF98B051
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkk4XSxz3g98
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697913;
	cv=none; b=MnkfyzKYbZxM7Vi16kZk3M4/+0lJJbqpMFmMGVGj38AudsvVf0zu2GkxY8txHg9UnOapOgFvLX5ZH+oSJFc7iwn0b7fqCcq8QSju8Xd78fLMV8tXmuGFBO2qFY8NLjTwTOPVLr4E1ouI57j7Jn2hYCrCpqZdTEpXVrsncbRf7QMdTzHX3ndjjh8YtbUGy71ZoRx70eutagzU4/6hJkFxYXedwKXba4metPXXDGHw7wHxK55E1v+yWjo3zyaYZlGWHCmMD9knPNTdZMdvOTP73G2nS/uq0GOHwa3DYJ7vIPwMXuoQIYcNLbDNHI3E+x3F0+U+Jyh9cFKqEH3YEXNBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697913; c=relaxed/relaxed;
	bh=D8e26HE+3E35YBzu5RrV0IHIpztUFBPs/lzx1XUAlbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ls+7eADBtxMq5PWcdfCXHf7QG9LaAAogHHC/VlZqFL9F4QjEMD6aqtvEA5FUumjwRnGlxismTBp9TrcIC5F+DLkpgT1NvU2nPTrMgOFwq8I0iSZ/4gi50XWq/pL0Kg8oJS+fW9TGyrf95bQdEylH/zZy7kTh7KFokaQoROlC/YUhmWK6lnZog7QJD75Xryi18JdfFVk9qbY3+VNTSqIz/J7opaP+NBcAlvDf4qEYvBu+bUPvVwCwjfVoieN/Ua5xD4CxH6VwpZBsi41cUsrOBbzDYD91a4BS/hL5+JA4ljCVGOiq1Pqi6wP7yH0qNOE7LPUh/+ZKObnHEMTpReuptQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hWAQaWkr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hWAQaWkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWs1hBrz2ysX
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:13 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6c5ab2de184so30239136d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697911; x=1728302711; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8e26HE+3E35YBzu5RrV0IHIpztUFBPs/lzx1XUAlbA=;
        b=hWAQaWkrh0OVbTbMhRbf8PF1t27PFj2lwAYTGpOw7XamOTtlTSaR/jJRVsbZrvVOhh
         XEZExyTt1WNOb9CmFtTFEs3P1FBaEKzJ4wlEvF3L6esHaxirmhfTJJW9q/My6rIZ9ELu
         p/3RL8PwJG8Q3Dzzrh9+FRhGJGXaFfV1qbpmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697911; x=1728302711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8e26HE+3E35YBzu5RrV0IHIpztUFBPs/lzx1XUAlbA=;
        b=CG8Qalj6ObZXJuX0WbwFIr0tMXprf4OJpCAEcKKJ1A/R9dmL4xyjSgTEWNGLees5cF
         kNhE3t0yIZuVTnUU4DGaT1QpifYLpXtkNoBkI/tTkFD8RyTzRjgq9Fly9BhvvkdVoM6g
         GJPnivM80xmwW9BJRl0wfP2dZH6M/X74io/HSaprim3Nz8az3ndt7cExGfB4jpWJACe3
         oE5cgpzVIkjL4+U5TC5axNoPVAfzTI+SQBaEEwC95moB5iPFHn9chEo+RP0/elZr2Eph
         mDLnKuYpKfHN8RRAKZ4Ivah5PrwgyCkb1LC9oeMSVcyXmCvFRfM7rqZQ7qH/r8KzKcAi
         T2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgDNAjMb0fmCqR3MLoyJdFOHYyx8zjv2K4f1iiXh+wtNGrBqRcP99eMkKi7RJfhfixmTXjUnV9/MAmYyA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhCf2x5l4I3I3UI+/t7xrKR0o5v8q72KfLz3w0F7McI39mPL7n
	II5EDfEp4BR2X145mKk9tMeMbVsul+JEVpXMoLa2PaELuyNamKIYZOhmVykS4Q==
X-Google-Smtp-Source: AGHT+IEpi/h9qBTzENrO9vK1BVrLpd+v0VWjCMyXcKhCb+KBXNEG/xGQiqpkb/xdSgfcL4ga0CqsLg==
X-Received: by 2002:a05:6214:2dc4:b0:6c5:5f04:3665 with SMTP id 6a1803df08f44-6cb3b6618e5mr175354206d6.48.1727697910946;
        Mon, 30 Sep 2024 05:05:10 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:28 +0000
Subject: [PATCH 33/45] media: i2c: ths8200: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-33-81e137456ce0@chromium.org>
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
drivers/media/i2c/ths8200.c:133:4-19: opportunity for str_enabled_disabled(( reg_03 & 0x20 ))
drivers/media/i2c/ths8200.c:149:52-54: opportunity for str_on_off(on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ths8200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 686f10641c7a..a6d2fb64f563 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -130,7 +130,7 @@ static int ths8200_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "power: %s\n", (reg_03 & 0x0c) ? "off" : "on");
 	v4l2_info(sd, "reset: %s\n", (reg_03 & 0x01) ? "off" : "on");
 	v4l2_info(sd, "test pattern: %s\n",
-		  (reg_03 & 0x20) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_03 & 0x20));
 	v4l2_info(sd, "format: %ux%u\n",
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_MSB) * 256 +
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_LSB),
@@ -146,7 +146,7 @@ static int ths8200_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct ths8200_state *state = to_state(sd);
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 

-- 
2.46.1.824.gd892dcdcdd-goog

