Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAE998B04E
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkj4D8Xz3g71
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697907;
	cv=none; b=HrjJQOP2AayqU4zYvaIWWq/ZNsqczKmFS9K6MGfTBdjo4rpU2vm3jY66+wVhkbuU/8c+ZnW3lT1vpOgKdeu1FnCzGp4+5OSU/fRvaIj2dYzSaWRS3erowBq7n+XzaoCcOZgGWLxC/otOuH4s42+d28WwPO+yDKQxshsSeqNkdqOOMh9dpCyJUu7Vth8lystH2dac+vP0MtureqLU+6+M+Y2Px9LoTJrGPkFBgGV27h37hcbwFy5mj/8Xd8g0108DE7bLiIn4LNbJjlCpMcOPVMCBfdUk5O0DUF95y/jNAKKUXVGJC+JDBkHj/uhhDynsCMfjWlAVYl5av1xUrzWJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697907; c=relaxed/relaxed;
	bh=Ebt+1b/55aPXlqauBXJO18wSUl/XzTUjhH2wTMyzrFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=en67xt0JScZMbcoW45Gb3vRJYyrCLUyE1Xc3LqloRX3kdcMd+YU3kfFPIk2to2I3HztksqixeJ1wNcdBVL0FhmnVtxJc2Eut4TEAs9GrOp8qh8L8FXBPGXGco4vBuW6K9Mrxymrg8xBi2rm7ypk4QYDZ0GrcGtsG98MIggYkx38FUFj6AvlVlcB0dkENjgQtlefSQZuve3gWvut13EY45+PQ7SZGMxzoy52w8KrcMPxXgekpsimGJoJ1jZeSXS2ddrBAttvnFkr40oIEWh3TV3lmtXpMLseF9PanKJXOWTbv6QUiGf8h0u6My9op+TqB0b7Q/uve0JabS6fQetRHIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TaMEg9Lo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TaMEg9Lo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWl25X1z2yhr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:07 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6cb3cbc28deso36413006d6.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697905; x=1728302705; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ebt+1b/55aPXlqauBXJO18wSUl/XzTUjhH2wTMyzrFA=;
        b=TaMEg9Loe/dilNE2yqNVLhZRiIm43Vk2PZyJD8nhU6bJOkz2FYqR9NoZTu1hYHPNpN
         u0HtVqWWNTQ7OSUi/P75P0mkz7dYipqf3XVeTNYcF4xslXBk8ol36CQg/ou0vB3mdwSs
         Og7/oWz8WxTiCbj6b2pCBQT/m0Mb7s+TMnEBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697905; x=1728302705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ebt+1b/55aPXlqauBXJO18wSUl/XzTUjhH2wTMyzrFA=;
        b=IvLhvMiN24THB+kHR3olUVUdm8xVL0GV31ONItyPmrDyCZm5FU+RIEWFKCavi8gH4K
         auaX0/jsLf1OMhcfUwMzrTR4sFMthpYb6HjizDJp5c1EQZ9J8kKLvpK/23QcgjDdQhHW
         At6aQ8GFUmZvZMs/kYR5h2j+G7aBeeXJjbsJGhLsAC6VSpG+daYq0eDWjwK/MIIhNhc3
         jpg84yRtjxn+0lbot7mkteP3Ptu1NcHUPQ87A+pUDTWNbKHtrkNxfQVQp7xiTAHaloyz
         N0xn1S8V4SsImnJXtyaPh+pRmw7qw++CQlo/1uPyE/FLeoyFITAF7bJrngVBS3rMT+wP
         2pmA==
X-Forwarded-Encrypted: i=1; AJvYcCWvDS62epdj6eDBJ8AwGcrjYBfmJbPUJ+oqUoFmYEY2P2LhLrKcV7FZWMI+Ly0p66YSEbn+Cs02JBGlyOQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yylpjst6EoV4f2s53aT0o6nTlb4RD4sLyLkH3tviLGJILnjU1QP
	1cZniY63qcOFrHnkuCh0rfpbckLsPztUgrq1FJOqRkdTEFAOq1JatrMCfO4/Bw==
X-Google-Smtp-Source: AGHT+IG7DxsLwmOc7mkRl/MFKW8HAXRHroSnhiAWX2HVxDFuz0PGg7dWtpjL7qcJseQqckH9Ha41Tg==
X-Received: by 2002:a05:6214:448c:b0:6c1:8663:e8f0 with SMTP id 6a1803df08f44-6cb3b61465amr169180096d6.28.1727697904581;
        Mon, 30 Sep 2024 05:05:04 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:25 +0000
Subject: [PATCH 30/45] media: i2c: cx25840: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-30-81e137456ce0@chromium.org>
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
drivers/media/i2c/cx25840/cx25840-ir.c:1089:4-9: opportunity for str_enabled_disabled(filtr)
drivers/media/i2c/cx25840/cx25840-ir.c:1028:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_DMD)
drivers/media/i2c/cx25840/cx25840-ir.c:1113:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_MOD)
drivers/media/i2c/cx25840/cx25840-ir.c:1030:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_RFE)
drivers/media/i2c/cx25840/cx25840-ir.c:1115:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_TFE)
drivers/media/i2c/cx25840/cx25840-ir.c:1101:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_ROE)
drivers/media/i2c/cx25840/cx25840-ir.c:1107:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RSE)
drivers/media/i2c/cx25840/cx25840-ir.c:1097:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RTE)
drivers/media/i2c/cx25840/cx25840-ir.c:1135:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_TSE)
drivers/media/i2c/cx25840/cx25840-ir.c:1026:4-21: opportunity for str_yes_no(cntrl & CNTRL_RXE)
drivers/media/i2c/cx25840/cx25840-ir.c:1111:4-21: opportunity for str_yes_no(cntrl & CNTRL_TXE)
drivers/media/i2c/cx25840/cx25840-ir.c:1103:4-21: opportunity for str_yes_no(stats & STATS_RBY)
drivers/media/i2c/cx25840/cx25840-ir.c:1099:4-21: opportunity for str_yes_no(stats & STATS_ROR)
drivers/media/i2c/cx25840/cx25840-ir.c:1105:4-21: opportunity for str_yes_no(stats & STATS_RSR)
drivers/media/i2c/cx25840/cx25840-ir.c:1095:4-21: opportunity for str_yes_no(stats & STATS_RTO)
drivers/media/i2c/cx25840/cx25840-ir.c:1131:4-21: opportunity for str_yes_no(stats & STATS_TBY)
drivers/media/i2c/cx25840/cx25840-ir.c:1133:4-21: opportunity for str_yes_no(stats & STATS_TSR)
drivers/media/i2c/cx25840/cx25840-core.c:2369:2-8: opportunity for str_enable_disable(enable)
drivers/media/i2c/cx25840/cx25840-core.c:2392:2-8: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/cx25840/cx25840-core.c |  4 ++--
 drivers/media/i2c/cx25840/cx25840-ir.c   | 34 ++++++++++++++++----------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index a90a9e5705a0..dd8474609092 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -2366,7 +2366,7 @@ static int cx25840_s_audio_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 
 	v4l_dbg(1, cx25840_debug, client, "%s audio output\n",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 
 	if (enable) {
 		v = cx25840_read(client, 0x115) | 0x80;
@@ -2389,7 +2389,7 @@ static int cx25840_s_stream(struct v4l2_subdev *sd, int enable)
 	u8 v;
 
 	v4l_dbg(1, cx25840_debug, client, "%s video output\n",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 
 	/*
 	 * It's not clear what should be done for these devices.
diff --git a/drivers/media/i2c/cx25840/cx25840-ir.c b/drivers/media/i2c/cx25840/cx25840-ir.c
index 8cef9656c612..6f3978135178 100644
--- a/drivers/media/i2c/cx25840/cx25840-ir.c
+++ b/drivers/media/i2c/cx25840/cx25840-ir.c
@@ -1023,11 +1023,11 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "IR Receiver:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_RXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_RXE));
 	v4l2_info(sd, "\tDemodulation from a carrier:       %s\n",
-		  cntrl & CNTRL_DMD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_DMD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_RFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_RFE));
 	switch (cntrl & CNTRL_EDG) {
 	case CNTRL_EDG_NONE:
 		s = "disabled";
@@ -1086,33 +1086,33 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, rxclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, rxclk));
 	v4l2_info(sd, "\tLow pass filter:                   %s\n",
-		  filtr ? "enabled" : "disabled");
+		  str_enabled_disabled(filtr));
 	if (filtr)
 		v4l2_info(sd, "\tMin acceptable pulse width (LPF):  %u us, %u ns\n",
 			  lpf_count_to_us(filtr),
 			  lpf_count_to_ns(filtr));
 	v4l2_info(sd, "\tPulse width timer timed-out:       %s\n",
-		  stats & STATS_RTO ? "yes" : "no");
+		  str_yes_no(stats & STATS_RTO));
 	v4l2_info(sd, "\tPulse width timer time-out intr:   %s\n",
-		  irqen & IRQEN_RTE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RTE));
 	v4l2_info(sd, "\tFIFO overrun:                      %s\n",
-		  stats & STATS_ROR ? "yes" : "no");
+		  str_yes_no(stats & STATS_ROR));
 	v4l2_info(sd, "\tFIFO overrun interrupt:            %s\n",
-		  irqen & IRQEN_ROE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_ROE));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_RBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_RBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_RSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_RSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_RSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RSE));
 
 	v4l2_info(sd, "IR Transmitter:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_TXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_TXE));
 	v4l2_info(sd, "\tModulation onto a carrier:         %s\n",
-		  cntrl & CNTRL_MOD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_MOD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_TFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_TFE));
 	v4l2_info(sd, "\tFIFO interrupt watermark:          %s\n",
 		  cntrl & CNTRL_TIC ? "not empty" : "half full or less");
 	v4l2_info(sd, "\tCarrier polarity:                  %s\n",
@@ -1128,11 +1128,11 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, txclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, txclk));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_TBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_TBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_TSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_TSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_TSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_TSE));
 
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

