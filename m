Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280A98B03D
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkb2C5Qz3fsY
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697874;
	cv=none; b=Zdm8r6TUFKvEGcU/yEn2Sdk/TfT7V9T4TNssf9qcFD/Q3iPh7LZ9RwP5MjDKW5erDrA8So7rpDjZJF7zEILeqFzagspdLiPNuFWMjbqwRJAGO6lJKwXV19DDrcFHCU5N6M/ljoz89VNGlOqpNsVMARoAN9xnCsakKPl2olbhTDVnD6i1//Yl6Mjy9VZIVY0m/fGzlXprles6R/yCY0f1Gb3rpl6Ftf7KrtKskxYN07T7wJIN8syxeZoYgmPQZ2DYIIoCmNn0CTjBWJceufdOaVOAN7L50yLRCdNQHNl/U1u3acj8VCksPq0n2uhjQw/zacMBFqArGkgR7X2CtBStEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697874; c=relaxed/relaxed;
	bh=D6BDeL6BkIVVZoPxqWDi9XtO0jTRkjdLrjdq1Zl6PH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=My2D/bq43sr8El1KpXMph5ZP/XpsLNhVnWSkiNcgbyYM6DqVe83e8iuk38j18vWOo57hanBoLEnYWXLwM8e1XXCR1Ek8iwi1MPt7daDad8mQ80uauXFQU5YEO4xYiyurXWzfjpia4g1eqLNX5xK/PZuv5msXYwAY8XapoHl6pQG0p6D0cPpmGM6Ts9ZIdjf2fjwNg+4/qHssXAmL5C/SH8bcao1jYgUXL6n1uJ3n7GJ1zn7sPIzx1iTlnW9poZc4aChTCtvYPEHG7gSE6+DrUBgNcBTqxBVJW8dwX4BZXazsJ3zhQOBb7m9vgSIYspsaa1Yo71WZuDUul+QYBE1QtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PCyTW1OP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PCyTW1OP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKW56Fqkz2xCd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:33 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6cb3062d9b5so30252636d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697871; x=1728302671; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6BDeL6BkIVVZoPxqWDi9XtO0jTRkjdLrjdq1Zl6PH8=;
        b=PCyTW1OPNBZzFRvSlU8j57fmm8OQ8Ed1wCx0GvzrX4KjA966cdFLXfBch4QGVIcaYC
         CGFEA+Mk59NLmxl+gMDZnFxy/HpyAST35E8rIV1e7UViFS9Ip0pMQh5ioiJd8oXOax/I
         cSikV08eYHhAc0Kbs+ddm/3lTq8JDN6qEpOSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697871; x=1728302671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6BDeL6BkIVVZoPxqWDi9XtO0jTRkjdLrjdq1Zl6PH8=;
        b=u1kAh9gKtxbBObDsQI/9MH3FFYsJ2XdNVhDJmAVh/48KIJl1kDLijqs6BYGSCmBCoQ
         uyiGRtVsSD06+KfOTc0WL+T1rrDzaEA5rJWrrEfKEoA8NOaezSI0u4g9arqHIaNy7IIn
         WDk+gPgihjj0A6Q1ZZ7gJbPywA+2Mh+bb5LOI8PO2HD3jPqsbuUcufiYvcRF2aGCgD1D
         p5mVraX4EhUSVT+byEkygupFO7EvTCKDQXH5/SOHY2l+pA4amkb9hdik2LBDEpzX6Ckn
         Z2lTDsseONqFPG45IdD22X9R0DZCLyBNZki/+K6YpsvgaNqI2ee9Do6Ce7R85kI6T1WT
         3/2w==
X-Forwarded-Encrypted: i=1; AJvYcCUXZ/EHGAuiUgPK/kDF/DMh66esvmMXEW44B5j+SPU01UFED+NuvLcz9cwUYsQzhPOR/wT00U/RAOpgj2U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxQrfhCQFYNbMzwa+QkGOt3TH520oUx89QRTlShdL4z7p2kTp1
	vX7Z2KxiXuw7JW660Xeb8zgWExkPWhA/2v6DFySotesOZPqqQtlI0zgXvTI0TA==
X-Google-Smtp-Source: AGHT+IFuhFd9qljS0j0XzT5b/G60bcWwlJPplwUn5ky0BXy/Gr7Rfi8yUN7cisKQypEqCOJiTUFoZA==
X-Received: by 2002:a05:6214:448c:b0:6c4:6217:da9c with SMTP id 6a1803df08f44-6cb3b5da202mr213208266d6.17.1727697870958;
        Mon, 30 Sep 2024 05:04:30 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:08 +0000
Subject: [PATCH 13/45] media: pci: cx23885: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-13-81e137456ce0@chromium.org>
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
drivers/media/pci/cx23885/altera-ci.c:285:3-9: opportunity for str_read_write(( read ))
drivers/media/pci/cx23885/cimax2.c:227:3-9: opportunity for str_read_write(( read ))
drivers/media/pci/cx23885/cx23888-ir.c:996:4-9: opportunity for str_enabled_disabled(filtr)
drivers/media/pci/cx23885/cx23888-ir.c:935:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_DMD)
drivers/media/pci/cx23885/cx23888-ir.c:1020:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_MOD)
drivers/media/pci/cx23885/cx23888-ir.c:937:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_RFE)
drivers/media/pci/cx23885/cx23888-ir.c:1022:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_TFE)
drivers/media/pci/cx23885/cx23888-ir.c:1008:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_ROE)
drivers/media/pci/cx23885/cx23888-ir.c:1014:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RSE)
drivers/media/pci/cx23885/cx23888-ir.c:1004:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RTE)
drivers/media/pci/cx23885/cx23888-ir.c:1044:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_TSE)
drivers/media/pci/cx23885/cx23888-ir.c:1026:4-21: opportunity for str_yes_no(cntrl & CNTRL_IVO)
drivers/media/pci/cx23885/cx23888-ir.c:933:4-21: opportunity for str_yes_no(cntrl & CNTRL_RXE)
drivers/media/pci/cx23885/cx23888-ir.c:1018:4-21: opportunity for str_yes_no(cntrl & CNTRL_TXE)
drivers/media/pci/cx23885/cx23888-ir.c:1010:4-21: opportunity for str_yes_no(stats & STATS_RBY)
drivers/media/pci/cx23885/cx23888-ir.c:1006:4-21: opportunity for str_yes_no(stats & STATS_ROR)
drivers/media/pci/cx23885/cx23888-ir.c:1012:4-21: opportunity for str_yes_no(stats & STATS_RSR)
drivers/media/pci/cx23885/cx23888-ir.c:1002:4-21: opportunity for str_yes_no(stats & STATS_RTO)
drivers/media/pci/cx23885/cx23888-ir.c:1040:4-21: opportunity for str_yes_no(stats & STATS_TBY)
drivers/media/pci/cx23885/cx23888-ir.c:1042:4-21: opportunity for str_yes_no(stats & STATS_TSR)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx23885/altera-ci.c  |  2 +-
 drivers/media/pci/cx23885/cimax2.c     |  2 +-
 drivers/media/pci/cx23885/cx23888-ir.c | 36 +++++++++++++++++-----------------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/pci/cx23885/altera-ci.c b/drivers/media/pci/cx23885/altera-ci.c
index 0dc348215b72..e154a39d86ef 100644
--- a/drivers/media/pci/cx23885/altera-ci.c
+++ b/drivers/media/pci/cx23885/altera-ci.c
@@ -282,7 +282,7 @@ static int altera_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 	mutex_unlock(&inter->fpga_mutex);
 
 	ci_dbg_print("%s: %s: addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", addr,
+			str_read_write(read), addr,
 			(flag == NETUP_CI_FLG_CTL) ? "ctl" : "mem",
 			(read) ? mem : val);
 
diff --git a/drivers/media/pci/cx23885/cimax2.c b/drivers/media/pci/cx23885/cimax2.c
index 06e41f92092d..458fa779274a 100644
--- a/drivers/media/pci/cx23885/cimax2.c
+++ b/drivers/media/pci/cx23885/cimax2.c
@@ -224,7 +224,7 @@ static int netup_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 			return -EREMOTEIO;
 
 	ci_dbg_print("%s: %s: chipaddr=[0x%x] addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", state->ci_i2c_addr, addr,
+			str_read_write(read), state->ci_i2c_addr, addr,
 			(flag == NETUP_CI_CTL) ? "ctl" : "mem",
 			(read) ? mem : data);
 
diff --git a/drivers/media/pci/cx23885/cx23888-ir.c b/drivers/media/pci/cx23885/cx23888-ir.c
index 222d04421468..85ca564fd3ab 100644
--- a/drivers/media/pci/cx23885/cx23888-ir.c
+++ b/drivers/media/pci/cx23885/cx23888-ir.c
@@ -930,11 +930,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 
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
@@ -993,37 +993,37 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
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
 	v4l2_info(sd, "\tOutput pin level inversion         %s\n",
-		  cntrl & CNTRL_IVO ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_IVO));
 	v4l2_info(sd, "\tCarrier polarity:                  %s\n",
 		  cntrl & CNTRL_CPL ? "space:burst mark:noburst"
 				    : "space:noburst mark:burst");
@@ -1037,11 +1037,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
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

