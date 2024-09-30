Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28E98B048
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkg2whcz3g2K
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697896;
	cv=none; b=ZRMRJE1/p8lkLDtM9iujkfg9hR8datvANPFF1sVrW6Jkp7aaxNSaw64kBPtpLc+J0S8VM7/oI8902UP4hs22Yg0FJiSLUVwprkbIoZFM4LT5ukD/7ZqCDjz5cXbboG6hB2TZjJHY5nTdj42SGCRRbPWbdTiytPmE0/KM1RPTh/SOirrvJARGgXNFywuZIgurEFGIT7LoXyAQZMZrGy2yGGsaFP/hGhd0rSeRuKW3uzZWxXhoKeU9fX7Bk92/OmIrgMNfMN85KNEdbIcQnY89HgAP+BJKSromX80mHitQwBo2P57Fai5yWzdvtvQiw6y5Zab/WfIKqckB/jGCPSv3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697896; c=relaxed/relaxed;
	bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6WnjxHMQyZz3Kuu9sWSciIK+y5wdxnWrcyoW44eKaxvQohvxl1pDm75cCX2hd5nsqKylEQjRVKHB3uUqPJITRq8FfqkQlnjpCH9vp0+JAmAU9mlwwMhO7akIEkQipTff8chIxzezCwkY4L5eAbS8fwcZ5ffP2nZbW3w89gUFwsluQ2/t9KjFVDAG41/87nVWrlT7j/HrObXffwOZ/xX1dhbzKXpGcI8THvPjFRXbPxRU6jncxX0cB9dQPa4YZVp+i8JHRaYN46sBFdQ7T2h8KnAw+f86JIjaFxZweWz9UDML/JLKFIfI/2PztO4ftLFAfQbcyLNGaE/SjaezTvN+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EbyA33jq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EbyA33jq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWX0f9yz2yPq
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:56 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cb2aac40faso38500526d6.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697894; x=1728302694; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=EbyA33jq0zou69xT2KQntGuegTsgjAhqs/VtOZc7EyWLnhrRf168niXjU+vfR+OoqB
         pHj1abARc23yP+qHgd/sT/HxMzZ5iQQBbbvwU5Ts7/sAzFMpI9jv8OTY37eK3dcx2Hhc
         xmx4KcZiYhVfsG2jL91Prz3r39eVGmW3HIujw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697894; x=1728302694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=Bb6cHe5Fgz91z08N1QZ8wbPvEuUJ5+l8HyNfaiPaqJoTX42qA5OHO/AcFWxMDZrB7T
         yhfrjQReUiqtWpQay9+RBvY6CQJeBeX4iLAdwnNNCiNELJkpD0J+5N1GAgASfZSBtJif
         3d52CyR0EVVXET8MMJQA4DsM2MtSwL8U4kvGtEam7wk7zlKw6Ix/zqGj/DNI3Ia8ozNX
         SCrhR8gdZidrgUhQSjfgOcpOxY2UKrZe/1WuDjliqF9HM8IenOCkbdDbXU3fDkkNli9j
         2e1kqBzrGGQTE87KaHoH8Xp4P/8GhCuhxPaLjDIFjaMhBln/c4xSw14fHa3usSC1kABS
         IUjw==
X-Forwarded-Encrypted: i=1; AJvYcCVgQLpBJDK/MoH7ei5KEB1HzF2Rqcz+jlL2WXNkv5KTY8yApUF9lZAE18gd1Ba0vYFuYwGzJLVWFEdOafc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbChZZ4pg9De08F5VEhnd4bLq9x9Sgr6G0m0iFVbJGNDvVH9I5
	7wIcbJ/6v/6Hhg1zYGksuBK54FTA2MNOW23/aVBDvalmTOMv9xMTuKMe2NmihA==
X-Google-Smtp-Source: AGHT+IHvTtSCRFSBPeJou8A8lJWRExB8EwT4CA/+ss3rMSh3j0C8PX4s4DLpZYrCskrdUJWUEmVJfQ==
X-Received: by 2002:a05:6214:489:b0:6cb:2de5:d7a1 with SMTP id 6a1803df08f44-6cb2f270becmr284661826d6.8.1727697893842;
        Mon, 30 Sep 2024 05:04:53 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:19 +0000
Subject: [PATCH 24/45] media: cx18: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-24-81e137456ce0@chromium.org>
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
drivers/media/pci/cx18/cx18-av-core.c:1013:40-46: opportunity for str_enable_disable(enable)
drivers/media/pci/cx18/cx18-av-core.c:1118:8-24: opportunity for str_yes_no(( mute_ctl & 0x2 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx18/cx18-av-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index ee6e71157786..5701abdf9427 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -1010,7 +1010,7 @@ static int cx18_av_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
 
-	CX18_DEBUG_INFO_DEV(sd, "%s output\n", enable ? "enable" : "disable");
+	CX18_DEBUG_INFO_DEV(sd, "%s output\n", str_enable_disable(enable));
 	if (enable) {
 		cx18_av_write(cx, 0x115, 0x8c);
 		cx18_av_write(cx, 0x116, 0x07);
@@ -1115,7 +1115,7 @@ static void log_audio_status(struct cx18 *cx)
 	}
 	CX18_INFO_DEV(sd, "Detected audio standard:   %s\n", p);
 	CX18_INFO_DEV(sd, "Audio muted:               %s\n",
-		      (mute_ctl & 0x2) ? "yes" : "no");
+		      str_yes_no(mute_ctl & 0x2));
 	CX18_INFO_DEV(sd, "Audio microcontroller:     %s\n",
 		      (download_ctl & 0x10) ? "running" : "stopped");
 

-- 
2.46.1.824.gd892dcdcdd-goog

