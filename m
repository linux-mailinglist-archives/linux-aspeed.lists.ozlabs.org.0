Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5563998B05D
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkp2Dftz3gKj
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697933;
	cv=none; b=fBZyhdPjNXNHpDBlhQkNvG+PRaQzViOAg7biSLulS2vuXo6SQwra9MahUSKFTOGu3Cuox/oPXRm4pFYEZINFCqiqEUTbBuN5SSIjrDAfe7raDt46hCOIMSiEo05r9OBvX+3og9hlK4AG8SA1Jpa0sqIEs1+hG5pIVW3xLU8VhTTsv8z5yAr7AByyeDqceK7V2nNgIlTgYr8H0AsUbkLUHA/LfKO10ybSNSFN98ca8wUiDdW+tRw3FlvJp8THDSAOVc6IlYl/8h0OUcYSan0AfVv9/VsKQPRAuroU7NNSldaPenoadEGSIeZFSX7XgNTBi3gwzVcPhjClPH1BmyQKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697933; c=relaxed/relaxed;
	bh=y4CZBI+n6IjdrtDGuJsp4m8Z3nCdNkGXw0PtmNPGNzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Df+hUE/cqaXMg7+JI5tEWcpwlqPXWuMQJ7Znz+hBzeMkRB/LEujt+losZzxnhAPqBvlIV2gUR/prZ/x8xneXNkPz4Oq/qWCFPqaMqRh5L1WDAOCXt+Tm7P56qWEVa6k57HmMrYUH8vR1wjDz0zKSuzBN5FgmjxTSE0OdeCJajB9w4Qa9jC2nHyP4+p8pALzZVcxsJn5SthYdyC4clbXaL7nuAVgm7sEZt3etrFctUb3KmMqKysgX7RypwpOq2WLZvcE51G31NEuPtFs7XCyEqc8vb/Zpem/LmXJMwOb0CbTDmopZD51MjTvh1oE+tPzR5rtrRrQ2ZulKrzCGhsUkgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eXtOG3So; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eXtOG3So;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKXD6Y3Bz2ywh
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:32 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-71100987d1cso2586634a34.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697931; x=1728302731; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4CZBI+n6IjdrtDGuJsp4m8Z3nCdNkGXw0PtmNPGNzY=;
        b=eXtOG3So4CgbjmB48mimGxavk2c13zDAtznve4dl/Hem9/sLmfvK498RRyIBL8M7i9
         +ZaofG0ZWY0iAfnIuBmTnbfXeWZyH2/m0eNE+lojTHIY8ljJKzX8bgKZGGFGmZN6C8H1
         9vJHLpCmND76ZU95/PZl7eZ6AZWBwXYDw4dPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697931; x=1728302731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4CZBI+n6IjdrtDGuJsp4m8Z3nCdNkGXw0PtmNPGNzY=;
        b=doShmzavfLDrSeFZ6JSUM5eLUdNV9SHSg37K7b86Jdt3x9PL8AkyLhmQTjGA/7muhd
         My+rC6FrrgZ87YuCeBNMpdCVxTx7kIPW1Re+xVzopaHlBWhZ3jDU29u2t2k1xEcbLm8O
         v/+8AhRbhzkvPVAno4t1uj99DvXFAnxPn2SW9UEHANf+wFoetzj8x/DO9KOR5w43kOob
         QQVJpTgnWj4yJSXndKXyQGmnAZduFeoNKIyohV5p6c+qc2YVCGulOfuNgL++b7fiXzcb
         wA1P1PGdlDeiMQ+8BETtjoQJqEPpXJqSOKB+VXF66F3qqrHQFoq3/7oxvBEdQcZvsXgq
         j+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9cpPYXswidXEdp5kKihgTiTZIgSVhiwfTeBzmnXM+Od2c9rWZpe5B1dda9d6zbQAfS18YLNdJOTNCkt8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuFjzKpvHuXn/Vme3cdgQ3xcRF/UttJ9Z9tMaf956RoRb9t97Y
	8ape0mpa31D9ximZUFhJeFYP2paO1J3zshSRf/qAiIl6puOmiuY8LugssCGpBg==
X-Google-Smtp-Source: AGHT+IF0K+EHYN7PignB/8NYu53YVj7j++O0mwk1W5RBN0+QHuQojpzGFveGrxjlPlRfoI1UafopSQ==
X-Received: by 2002:a05:6358:2c8e:b0:1b5:c4f3:faec with SMTP id e5c5f4694b2df-1becbb585e8mr274204655d.4.1727697931042;
        Mon, 30 Sep 2024 05:05:31 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:40 +0000
Subject: [PATCH 45/45] media: i2c: adv7511: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-45-81e137456ce0@chromium.org>
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
drivers/media/i2c/adv7511-v4l2.c:873:46-52: opportunity for str_enable_disable(enable)
drivers/media/i2c/adv7511-v4l2.c:620:28-51: opportunity for str_enabled_disabled(state -> cec_enabled_adap)
drivers/media/i2c/adv7511-v4l2.c:642:52-54: opportunity for str_on_off(on)
drivers/media/i2c/adv7511-v4l2.c:568:29-44: opportunity for str_on_off(state -> power_on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7511-v4l2.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index e9406d552699..d9af81015e72 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -565,7 +565,7 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 		"9", "A", "B", "C", "D", "E", "F"
 	};
 
-	v4l2_info(sd, "power %s\n", state->power_on ? "on" : "off");
+	v4l2_info(sd, "power %s\n", str_on_off(state->power_on));
 	v4l2_info(sd, "%s hotplug, %s Rx Sense, %s EDID (%d block(s))\n",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT) ? "detected" : "no",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_MSEN_DETECT) ? "detected" : "no",
@@ -617,8 +617,8 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "i2c cec addr: 0x%x\n", state->i2c_cec_addr);
 
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+	v4l2_info(sd, "CEC: %s\n",
+		  str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		for (i = 0; i < ADV7511_MAX_ADDRS; i++) {
 			bool is_valid = state->cec_valid_addrs & (1 << i);
@@ -639,7 +639,7 @@ static int adv7511_s_power(struct v4l2_subdev *sd, int on)
 	const int retries = 20;
 	int i;
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 
@@ -870,7 +870,8 @@ static void adv7511_set_isr(struct v4l2_subdev *sd, bool enable)
 	u8 irqs_rd;
 	int retries = 100;
 
-	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, enable ? "enable" : "disable");
+	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__,
+		 str_enable_disable(enable));
 
 	if (state->enabled_irq == enable)
 		return;

-- 
2.46.1.824.gd892dcdcdd-goog

