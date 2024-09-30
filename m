Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF798B052
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkk6vxrz3g9q
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697914;
	cv=none; b=QqSUtE8BFVcBFNF0kogGYV6RnRHp+wxHF/Uh2YupWjDH8ZL7E8uDO+UVYKmS0K+lpozxX1prmcCvVGlRKMSs0/GjkaIC1GoDnnApVNYlXRt2GYzFeUjPappTAyZWcGXJP3rGJ0isTRL2xOUFGYLgZlQaJku/WOy7vrTt3/ZK4mzeXvirnjyRFJVBfeAVHleWfYoAy/p9WOL8Xka91E9oPO3JKdWFwYuBWMCNUxndsvJLrUyaKWpmZgAODnHwGd11PYtcR418KMh2aVEDa+UNrLCML8aW3BivcFshdBOL4INEnQt7x4jZ6qRlbAZtnlQfogY2oFWOcQhb7Wh6dJ89fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697914; c=relaxed/relaxed;
	bh=3Y9A3WlXYOmIt22yAkVtKfWzTv1HcbDXEuxLhuXF1BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZBHaZ4u9n2SVw9XtyDr8oWEwlTXHrr+HqjEWRxSvQQXKTYMgSSq0nTJ+GhSONKUG3f1tdZCXk6UDlMYYHKAsxgFTFUpBnIdSHjiE9CxpFfBcLKEQar0l0BvS85KlQPz0Iw6ZR20MPgsdZt9VXrnhc/tMv5afqAoWZdIM4sEWvFYqOfNugtzTM3VOQYxrDVtdz3lwtXorkRre2/LuTd2Hkks5XjzU4HqcdUjU/RBdptowkpLpEUBq+9/IHC++awU+ZIOQn17ueyrnuPqeLKimLm7EHBHxMxf0ZF4oEVZDhiWOM4cIhs4EmG1Azm4VCe6R+fjUgS2W8Ii2BFaTtbIZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mpTRF0D2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mpTRF0D2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWt0Sbpz2yhr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:14 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6cb27e974ceso26205516d6.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697912; x=1728302712; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Y9A3WlXYOmIt22yAkVtKfWzTv1HcbDXEuxLhuXF1BM=;
        b=mpTRF0D2KnQv4QM5Z2yB+KPyoS55o+cthQGiRTGuDGysCzgTVvmYrB6MLq5vUxuxGj
         ZrB1AucakHs5KyriSD4/Xf3pkJ7CfXi8Lava7ja9VdLBV/dzEEj0mDKB7efqUgnksc6H
         Zons4eotDoEaKlvd3dR3jdcPK1gnE+rwDo4dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697912; x=1728302712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y9A3WlXYOmIt22yAkVtKfWzTv1HcbDXEuxLhuXF1BM=;
        b=JhRNK5Tg8ywc6mPdR/D5G2VfTj6Rk+3xgxks0Ta6hwjs5O6SKeonb13cx+AqI6rn7R
         0EUHyOm4UESXIHj197wA+5r66va4lggXqH/bChmBk/7oTSmy2IltCh051RTLcllbbmQp
         prd3UjeFVA2ChAMiP9VF7pQBex8xq0kggiAEPkNqJs0na6Hu6SnBsYEcQfUKe6sEqwao
         8VmHNrJ1xt79r9Zgr0wGLu8ltcF7rqPyBLUAXqJNhdHkFvPYVZ6NLol1WYYADiS9T4u8
         XMMT5kxK/eA3VFYat2/5kBCPkBgfpl6GewAafaqA+o/53+De+Ho0Co38FUKFy++R6kda
         n2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVo/1vPIOPVPEJPpLiHrJ4ZcNW/YWlGNzxsCYdiOPhI8uQqAm2mU2TeBtlnH0nBtMzkWlb6QLvTKWOiOxY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTSygFJsC4ZCr4yoDG71F+gOem6t65j8lX0i9MJEiGfPiUAng8
	ePq+ab7Gsn0hmRg+yvc/qWOtfFsRMCg9mgZFc11gFyutCHjgxJCRz27zJR4QZg==
X-Google-Smtp-Source: AGHT+IEeEfZlZQBmO8RZI8xNY8EgNRIjUt1ZXgq35BOYTCkW0tdPK9t40pOtA1wbfy30W9apcgwPGQ==
X-Received: by 2002:a05:6214:4198:b0:6cb:6655:e02d with SMTP id 6a1803df08f44-6cb6655e354mr40552846d6.3.1727697912026;
        Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:29 +0000
Subject: [PATCH 34/45] media: i2c: tda1997x: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-34-81e137456ce0@chromium.org>
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
drivers/media/i2c/tda1997x.c:1976:4-29: opportunity for str_yes_no(tda1997x_detect_tx_5v ( sd ))
drivers/media/i2c/tda1997x.c:1978:4-30: opportunity for str_yes_no(tda1997x_detect_tx_hpd ( sd ))
drivers/media/i2c/tda1997x.c:1972:37-56: opportunity for str_yes_no(state -> edid . present)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tda1997x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 3b7e5ff5b010..867c635fa37f 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1969,13 +1969,13 @@ static int tda1997x_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Chip status-----\n");
 	v4l2_info(sd, "Chip: %s N%d\n", state->info->name,
 		  state->chip_revision + 1);
-	v4l2_info(sd, "EDID Enabled: %s\n", state->edid.present ? "yes" : "no");
+	v4l2_info(sd, "EDID Enabled: %s\n", str_yes_no(state->edid.present));
 
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-		  tda1997x_detect_tx_5v(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_5v(sd)));
 	v4l2_info(sd, "HPD detected: %s\n",
-		  tda1997x_detect_tx_hpd(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_hpd(sd)));
 
 	v4l2_info(sd, "-----Video Timings-----\n");
 	switch (tda1997x_detect_std(state, &timings)) {

-- 
2.46.1.824.gd892dcdcdd-goog

