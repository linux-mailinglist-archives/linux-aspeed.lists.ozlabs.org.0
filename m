Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3EB98B053
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkl2FClz3gBV
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f36"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697916;
	cv=none; b=baDx+DaDYu3jb3EHtbJNi+DZag259JD/n1Dv6yXAdQnJwOaVwuLJ/NVHOK2WikuBwBs37Yy6N+MARsQcuM/ARK+n/sEIFr77c2zgQQZBqmBvbsccSq5cVwHRFEcIPpxMcYv45fyHaITpW/LxY1oT4D2iOXGVdkYu4xt3EeRKHAg7EM2F3wxiTzXz/Fnd0s/L6gDqHD/x5wXsDQzNyHUIl9Wd4c7OMK51E6ObjSYKgY+UGj8X6ig1GS5bgwrrwnOYGcs/dnmqPxEpCx22wCDmVP/Y1sGsd84gPt3Ujg9irpny8+T8xepz0jPTgrREwZZB4rLlEmHOZdVuy2hLw1Ju9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697916; c=relaxed/relaxed;
	bh=27WoLnk5gPTNJ0m2rtIWHwrzMjQJ4zxEXFjS8vXg2Uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTJHdXp4rtvuOXw0AF3ISO3Thv4SEbl7G9XaDOCncmSTbUGqT4FFgIPreBpQr7bcIkJLl3Aarq0BBThVr075VB+ersN92M5S5QOdmaMPrwbmZfCBYg6Vit86fB79OLIddu53UQw3aw0rD9rpjCHiol9KxQ78UL0mFFC4y+TERxr+tcdHsRGPceShgi4OaFviTAodWUOpmCkfFPceMPbq5k/0WFuoYW7v/gUPx86JZah/OQhqGyL+4o21BFylNKIpv5VWgzi0VK482m9iHHzI5Myqe/UsvKCT5NOWUSTyb2PixLaOjHf4xCuxpJmnTl21Q1/opCsJIpUw6JcGu/XauQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CSV3ngKO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CSV3ngKO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWw0XPdz2yl1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:16 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6cb27e974ceso26205886d6.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697914; x=1728302714; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27WoLnk5gPTNJ0m2rtIWHwrzMjQJ4zxEXFjS8vXg2Uk=;
        b=CSV3ngKO5UNjAYmdciY3JZ3QLaINiMY3BTL0j16fiUeA5btszigZnVd0U21S9pulLL
         uNo6mLVdxlKpU9MmKrNB9EQikNTxBbOaHRwlj+Rf8LE0JUZZ3kVgNZGuoskpr3y9h19R
         DzRvpgGE7vXpbp3uLCz4LZxOBeBNifiCZkpgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697914; x=1728302714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27WoLnk5gPTNJ0m2rtIWHwrzMjQJ4zxEXFjS8vXg2Uk=;
        b=QTIJ6g8hOeL5kAEpSd2Mzlvn8hBIq1SuJdZGLqVXjCPpWqjSTk/TuapUU27qiCiejh
         yzFK0XdPGUi8iJOJcpWqzuAj5T9vBBL0aoui8NSd6mv1Vjp/Jn3DtdAtJIEMZn+N9PEs
         5A8Ed/IiQN20G6Q+kGPcBKdqkNaBWFrL6tDST0SxdlCb5/oDuge/bnp/oqQq4Sur2y0J
         p+6K3sfJs1cw4K0DR+kfcYoFcte9WDsJrwr2fc8oYBO5UCICg9ggsaM9mq+HYxgv97hi
         Nz8L6pRP0f3tblQiQNh2hfQaAAq/efWv/F7o5SmDsCmTdoSutnRvx15mJ4b5Pxzal6JS
         HYSA==
X-Forwarded-Encrypted: i=1; AJvYcCUTqg3o3/nhSdFadNzbbR6aA7DsdRVWSVZZ7bASJ508/RY/K6wp06aOWghqAnIeMHFc7SUngTtW0eEJCGw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyyI5Sk7d9Wszo5myafg4U7ImY6FlIjjxog0mn8MYmJhAWf73Zx
	2BXmsi/jiQwApjsGiBi++txW/J0uGcHEQBtlmWpANqfT4KuPQwKacJes7zEUIw==
X-Google-Smtp-Source: AGHT+IEmtR/kCt9kuVkbj7/r3Fqa0DixhR1uM5cl6xJKRSOoPA3YSLhx2F2SjU4khmzc/KfhSVtoIQ==
X-Received: by 2002:a05:6214:4a87:b0:6cb:6059:92a with SMTP id 6a1803df08f44-6cb60590d50mr62400906d6.10.1727697913781;
        Mon, 30 Sep 2024 05:05:13 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:30 +0000
Subject: [PATCH 35/45] media: i2c: tc358743: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-35-81e137456ce0@chromium.org>
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
drivers/media/i2c/tc358743.c:370:46-52: opportunity for str_enable_disable(enable)
drivers/media/i2c/tc358743.c:1325:32-63: opportunity for str_on_off(hdmi_sys_status & MASK_S_AVMUTE)
drivers/media/i2c/tc358743.c:1264:35-54: opportunity for str_on_off(sysctl & MASK_SLEEP)
drivers/media/i2c/tc358743.c:1187:14-19: opportunity for str_yes_no(tx_5v)
drivers/media/i2c/tc358743.c:1266:3-33: opportunity for str_yes_no(hdmi_sys_status & MASK_S_DDC5V)
drivers/media/i2c/tc358743.c:1319:3-32: opportunity for str_yes_no(hdmi_sys_status & MASK_S_HDCP)
drivers/media/i2c/tc358743.c:1281:3-35: opportunity for str_yes_no(hdmi_sys_status & MASK_S_PHY_PLL)
drivers/media/i2c/tc358743.c:1283:3-36: opportunity for str_yes_no(hdmi_sys_status & MASK_S_PHY_SCDT)
drivers/media/i2c/tc358743.c:1279:3-32: opportunity for str_yes_no(hdmi_sys_status & MASK_S_SYNC)
drivers/media/i2c/tc358743.c:1277:3-32: opportunity for str_yes_no(hdmi_sys_status & MASK_S_TMDS)
drivers/media/i2c/tc358743.c:1274:3-37: opportunity for str_yes_no(( i2c_rd16 ( sd , CECEN ) & MASK_CECEN ))
drivers/media/i2c/tc358743.c:1309:3-42: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_HLT ))
drivers/media/i2c/tc358743.c:1306:3-44: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_RXACT ))
drivers/media/i2c/tc358743.c:1303:3-44: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_TXACT ))
drivers/media/i2c/tc358743.c:1300:3-44: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_WSYNC ))
drivers/media/i2c/tc358743.c:1268:3-50: opportunity for str_yes_no(( i2c_rd8 ( sd , EDID_MODE ) & MASK_EDID_MODE_E_DDC ))
drivers/media/i2c/tc358743.c:1271:3-41: opportunity for str_yes_no(( i2c_rd8 ( sd , HPD_CTL ) & MASK_HPD_OUT0 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358743.c | 44 +++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 65d58ddf0287..f2e1e55ae190 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -367,8 +367,8 @@ static void tc358743_delayed_work_enable_hotplug(struct work_struct *work)
 
 static void tc358743_set_hdmi_hdcp(struct v4l2_subdev *sd, bool enable)
 {
-	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, enable ?
-				"enable" : "disable");
+	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__,
+		 str_enable_disable(enable));
 
 	if (enable) {
 		i2c_wr8_and_or(sd, HDCP_REG3, ~KEY_RD_CMD, KEY_RD_CMD);
@@ -1184,7 +1184,7 @@ static void tc358743_hdmi_sys_int_handler(struct v4l2_subdev *sd, bool *handled)
 		bool tx_5v = tx_5v_power_present(sd);
 
 		v4l2_dbg(1, debug, sd, "%s: Tx 5V power present: %s\n",
-				__func__, tx_5v ?  "yes" : "no");
+				__func__, str_yes_no(tx_5v));
 
 		if (tx_5v) {
 			tc358743_enable_edid(sd);
@@ -1261,26 +1261,24 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 			!!(sysctl & MASK_CECRST),
 			!!(sysctl & MASK_CTXRST),
 			!!(sysctl & MASK_HDMIRST));
-	v4l2_info(sd, "Sleep mode: %s\n", sysctl & MASK_SLEEP ? "on" : "off");
+	v4l2_info(sd, "Sleep mode: %s\n", str_on_off(sysctl & MASK_SLEEP));
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			hdmi_sys_status & MASK_S_DDC5V ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_DDC5V));
 	v4l2_info(sd, "DDC lines enabled: %s\n",
-			(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC));
 	v4l2_info(sd, "Hotplug enabled: %s\n",
-			(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0));
 	v4l2_info(sd, "CEC enabled: %s\n",
-			(i2c_rd16(sd, CECEN) & MASK_CECEN) ?  "yes" : "no");
+			str_yes_no(i2c_rd16(sd, CECEN) & MASK_CECEN));
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "TMDS signal detected: %s\n",
-			hdmi_sys_status & MASK_S_TMDS ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_TMDS));
 	v4l2_info(sd, "Stable sync signal: %s\n",
-			hdmi_sys_status & MASK_S_SYNC ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_SYNC));
 	v4l2_info(sd, "PHY PLL locked: %s\n",
-			hdmi_sys_status & MASK_S_PHY_PLL ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_PHY_PLL));
 	v4l2_info(sd, "PHY DE detected: %s\n",
-			hdmi_sys_status & MASK_S_PHY_SCDT ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_PHY_SCDT));
 
 	if (tc358743_get_detected_timings(sd, &timings)) {
 		v4l2_info(sd, "No video detected\n");
@@ -1297,17 +1295,13 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Lanes in use: %d\n",
 			state->csi_lanes_in_use);
 	v4l2_info(sd, "Waiting for particular sync signal: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC));
 	v4l2_info(sd, "Transmit mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT));
 	v4l2_info(sd, "Receive mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT));
 	v4l2_info(sd, "Stopped: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT));
 	v4l2_info(sd, "Color space: %s\n",
 			state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
 			"YCbCr 422 16-bit" :
@@ -1316,14 +1310,14 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_HDCP));
 	v4l2_info(sd, "Input color space: %s %s range\n",
 			input_color_space[(vi_status3 & MASK_S_V_COLOR) >> 1],
 			(vi_status3 & MASK_LIMITED) ? "limited" : "full");
 	if (!is_hdmi(sd))
 		return 0;
-	v4l2_info(sd, "AV Mute: %s\n", hdmi_sys_status & MASK_S_AVMUTE ? "on" :
-			"off");
+	v4l2_info(sd, "AV Mute: %s\n",
+		  str_on_off(hdmi_sys_status & MASK_S_AVMUTE));
 	v4l2_info(sd, "Deep color mode: %d-bits per channel\n",
 			deep_color_mode[(i2c_rd8(sd, VI_STATUS1) &
 				MASK_S_DEEPCOLOR) >> 2]);

-- 
2.46.1.824.gd892dcdcdd-goog

