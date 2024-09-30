Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA598B046
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkf4fstz3g11
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697892;
	cv=none; b=CTsbBNqPSQaujtiL8jDAYLvFGSv/2WON6qMMidTA65RJ43qFN2J4vTf2A56wD4iipmHwqAiL9xd5L1gDhwryMYkIMsSR2J6jKh3dnjsxWpCgI87FyMtkbpIAIZXnWwuDM+9K+stobuLXAHIAHuwMm3yBdMennJXz/v6MvDgQ+FzCTHq5p7rNrs+oVGn7DmwZOgYHyGLT0YfZ+J9S25yDuuSRyMZIeThBLVaVPsvU9NPPZ2LpwzOc9cs32w8Tff46SY5iQ1cT1zye0EpVgdcHpbff6Lq64n4xDbeK8SJVTp0tn7kiF7iTVXB5tuCyX1lkOaKp4CQZYMo1ZTIQAxbZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697892; c=relaxed/relaxed;
	bh=aurzIxhre/dA6wUpFHCHveAY7utZWkXC/gGbqMcXk0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMmnLIjbv6X0XCGZ7MT2/UbCgfzzZtAmSPrcBPh8GHjNG3ReGS3LPFrWzgKHTMblp6GlAugVE/anSAMSXJUlkQNi9ErNOGh7dquhKnbH9fczTC5zvV5W13Tme2xIGKO2akenXCHYaaYnt5j6qMVGswFXk3A2ULKrVzg2H7m5Yca/gzEe7gxMcV/dueu2UIlQktDyGpbpPNH0pyYM93kw6lM1SBfIdH4UaC8Wc0pY5Vg2h4/xB26aSDgukN6TYUX473pm+YsheeVxbmFpwHR7IO6oasFwa4rJHgQ+GJ8Na1tHYV6TrEu9OysgN1gbEr66gP/qIUDSsmMT99pawS6uwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fpqFLTSG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fpqFLTSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWS2v9Xz2yZN
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:52 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6cb37b34a87so30618036d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697889; x=1728302689; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aurzIxhre/dA6wUpFHCHveAY7utZWkXC/gGbqMcXk0s=;
        b=fpqFLTSGBisn3e3GzQLyWc1mNqViPw0rXOn1vYEwVlp1CbiNj18llCwRbB0HZCkxR7
         bWKKbG0ILxbnmS+ahJgvAMVMldRV5rmRxIi3SpWWgAym8e+MJIGTzxV7KX/51ffDZwLy
         twvVDJ43Y7Ls3WqABt1uFBSaVZDUtCv3gXK2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697889; x=1728302689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aurzIxhre/dA6wUpFHCHveAY7utZWkXC/gGbqMcXk0s=;
        b=nhPCG8E7RiGfC+3W5ucdYGpW78RkjY1acuXhITGIUNGDxV1dvLRbsAY1lAvBrzb7aZ
         Oiv6+7JAbMeq91PP+quScJ/q5hf0J2TnVOZe5FjegJKssr4pEt5lWAsYdQoS0L9oj2JH
         mYg/nPbFwsabFn6ciFySc84re4lze+mPx4qf7Tfn9Z3fkTqsc/Zidq4ngDU9k/qOccls
         hsQoy8Ggew02vQa6Um0MKYjNWhFfCa9IGo5T+Avn1RSQd8XnCrD9LgfSjfo3JC4p0/so
         IqGbI7EpnCPOL25AyuCD/15hsZOIYUjWKabG3wa68gdlnOKhEqHBzbCIDHyDq0425ODx
         JTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUe2+93yS0DNHC0sYV5klTPyOdS+2jEWlhWL64gbdeYRISJtkNFUn1bzsrkNQClj/i0H2I9/IfqbHIsPd8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzAAoI5ulugqY7+H++vQTRFEg3TuI0ZXk68Ss3BPLlFe+whg7+
	HuH/8PZAlrgB8KEihAHvch/8dIGR98Cl7X/BcGxy1jCBSSLTOePQszw4vywVww==
X-Google-Smtp-Source: AGHT+IGIOHdh67nNwgDel6paDE35Eb29KwEMX4XzmiYgJj7qtD9+Z/d/ZNDrc9s0mVLpMYI/GTz7DA==
X-Received: by 2002:a05:6214:53c4:b0:6cb:27e6:393f with SMTP id 6a1803df08f44-6cb3b63d1cfmr165544066d6.36.1727697889388;
        Mon, 30 Sep 2024 05:04:49 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:17 +0000
Subject: [PATCH 22/45] media: aspeed: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-22-81e137456ce0@chromium.org>
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
drivers/media/platform/aspeed/aspeed-video.c:1944:6-16: opportunity for str_on_off(v -> hq_mode)
drivers/media/platform/aspeed/aspeed-video.c:1230:3-17: opportunity for str_on_off(video -> hq_mode)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/aspeed/aspeed-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index fc6050e3be0d..9c4a47d7a442 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1227,7 +1227,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
 		 video->jpeg_quality);
 	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
-		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
+		 str_on_off(video->hq_mode), video->jpeg_hq_quality);
 
 	if (video->format == VIDEO_FMT_ASPEED)
 		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
@@ -1941,7 +1941,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 	seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
 	if (v->format == VIDEO_FMT_ASPEED) {
 		seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
-			   v->hq_mode ? "on" : "off");
+			   str_on_off(v->hq_mode));
 		seq_printf(s, "  %-20s:\t%d\n", "HQ Quality",
 			   v->hq_mode ? v->jpeg_hq_quality : 0);
 	}

-- 
2.46.1.824.gd892dcdcdd-goog

