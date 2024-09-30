Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737E98B05B
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkn54Bbz3gJR
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697929;
	cv=none; b=a2MLYYlRxh9L53Cp0F5IqyEZ2PIXoGZbVsYJO/8ZAjebem/mgmYnKmlNIabSM17kpg7+cYTAj6ei+IQpDFYp6H2o3TCMRaKp3pLQ0hjBwIYyuePhs29h0QeHS3K+EceTOh6v86wudPP4AlaqPNdQhQWtMcdi2xXxaMxEgm6nxoS+IeMTUgqw2SLL0ZmRQreOL6p24AqJfgE1Nr2p3aN99X7q5+dy7cQMFXjNGiNk/+PO6OumfnL26PjZOHi+/9OGZr4KuQDfcU69XgrQZYxYSw1px+OFDGjohjhGU2LCalziM59DDcmYPJqMj7rj/3QAscJFoY+lzoIbgnIgU6cj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697929; c=relaxed/relaxed;
	bh=GL1+Q9/ULYlU3CLmPIk9AVOdXWpb/NtMEppJq3PJtYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opDetBiDMh2SwbUJTFqKI9wLjeieKhKOFQQ1vB8gOa8KEHQdFoc5V0+UF25EFfxmPIbsQBM/Q9s75WMFJYW0cAWc+I+QSp25XfNVA1gTOjUTEkMYOoZNvMKG2u3Md9WMty9FpYlSf0Q6LXW8/ORtvXgcI+1+e/mbdt33eDk8EFbxVkkf7piWiXkJ1nI6meoit0lnGE/dWWBIpk6qZc9025VYwSz7RE29zwqrQFLvnfbJ2hNPEGesoJ/WM0VeBE3qeeqOw9D/PWLdDXs3E3bR5AjOtofvwFx3kDhQiJm2G+ZoX7UolCibegtRLRPrm8uS5ihhcaYXCAhQJPs5qeIxAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VLNdavcR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VLNdavcR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKX92TDsz2ysX
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:29 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6cb2f272f8bso40068816d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697927; x=1728302727; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL1+Q9/ULYlU3CLmPIk9AVOdXWpb/NtMEppJq3PJtYk=;
        b=VLNdavcRD5BtOe4hx3l2ixkncVasxJUhd2ChBwzzBEbGhc8n3PzZvhxwGfPcTNI8L9
         k6Z8cGIuu5rtkcxIPyovGFMZeIDMvNdv23E7MwsjNI+G74w+bB9nbqfM/6lpFJM40QYi
         76fGKz5FA9AEpJ7rqgbpRj1SxU/C3wsjD7qxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697927; x=1728302727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GL1+Q9/ULYlU3CLmPIk9AVOdXWpb/NtMEppJq3PJtYk=;
        b=i0Rx7bUkueuUieYD16GQFFGlOWSgQKLh9qrFOR181VaBl1T7uWF2WzM1lEJIH7QYEi
         wAt8KBBKQG+dPjk6XPb23Dg8Skc8e+3i1OfRvlwrmIRHxen0TBIeDCiEfY2/LmvqH+4l
         hXU+L/vCL8E6lXR9MOEfe/ZQKY+3Ud/exCFaPjaeGw5+fgCVCFSIQXnR9HixUKI5iQ+w
         yjIxVyBmpZODlNO3mC4qATtSUJHKhK9+33OWYc26+UolZyepK93Kfbvjy19dNGgKdmym
         J75vHlYOwpn1yWUz28oD98WrBrtIA7N/EbI/u4SQ3cqVydPdA+BkU8qhVP+Ft5AF3GGM
         oaFA==
X-Forwarded-Encrypted: i=1; AJvYcCX3l3dsjOIX23hvrcg/Oetm3K0HgFWBVTVr4k0GyT8eYYYoR85bEoRcog7f59fC5kW+Iwp7ivrD4YmC25g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8bCR65pwut9GuAdsfzuSYZBu2vYRzJkiCYJumddDrFdVCe3pR
	0G4FnP88pZpjFg7aRc3jgjZ4TxfQD/H1qeFg55XbHFsIBOghY7sB8HUPH008bQ==
X-Google-Smtp-Source: AGHT+IG/6are8ci6AYDSQshUu34zjFa2sn9Z7jhsZeKvJuNj89zUt3QMjrvn9kvAxF3Mp7T2iyMvYw==
X-Received: by 2002:a05:6214:5587:b0:6cb:3c08:30a0 with SMTP id 6a1803df08f44-6cb3c0830c5mr167635306d6.49.1727697927150;
        Mon, 30 Sep 2024 05:05:27 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:38 +0000
Subject: [PATCH 43/45] media: i2c: adv7842: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-43-81e137456ce0@chromium.org>
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
drivers/media/i2c/adv7842.c:2761:5-29: opportunity for str_true_false(io_read ( sd , 0x6f ) & 0x01)
drivers/media/i2c/adv7842.c:2754:5-29: opportunity for str_true_false(io_read ( sd , 0x6f ) & 0x02)
drivers/media/i2c/adv7842.c:2821:3-31: opportunity for str_true_false(( hdmi_read ( sd , 0x05 ) & 0x40 ))
drivers/media/i2c/adv7842.c:2763:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x01 ))
drivers/media/i2c/adv7842.c:2756:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x02 ))
drivers/media/i2c/adv7842.c:2765:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x10 ))
drivers/media/i2c/adv7842.c:2758:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x20 ))
drivers/media/i2c/adv7842.c:2736:4-22: opportunity for str_enabled_disabled(reg_io_0x21 & 0x01)
drivers/media/i2c/adv7842.c:2735:4-22: opportunity for str_enabled_disabled(reg_io_0x21 & 0x02)
drivers/media/i2c/adv7842.c:2737:28-51: opportunity for str_enabled_disabled(state -> cec_enabled_adap)
drivers/media/i2c/adv7842.c:2812:4-24: opportunity for str_enabled_disabled(( reg_io_0x02 & 0x08 ))
drivers/media/i2c/adv7842.c:2679:3-30: opportunity for str_enabled_disabled(( sdp_read ( sd , 0x12 ) & 0x08 ))
drivers/media/i2c/adv7842.c:2730:4-52: opportunity for str_enabled_disabled(( ( reg_rep_0x7d & 0x04 ) && ( reg_rep_0x77 & 0x04 ) ))
drivers/media/i2c/adv7842.c:2732:4-52: opportunity for str_enabled_disabled(( ( reg_rep_0x7d & 0x08 ) && ( reg_rep_0x77 & 0x08 ) ))
drivers/media/i2c/adv7842.c:2768:5-33: opportunity for str_on_off(! ! ( cp_read ( sd , 0xff ) & 0x10 ))
drivers/media/i2c/adv7842.c:2843:3-31: opportunity for str_on_off(( hdmi_read ( sd , 0x04 ) & 0x40 ))
drivers/media/i2c/adv7842.c:2654:2-29: opportunity for str_on_off(( sdp_read ( sd , 0x56 ) & 0x01 ))
drivers/media/i2c/adv7842.c:2823:3-31: opportunity for str_yes_no(( hdmi_read ( sd , 0x04 ) & 0x20 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7842.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 014fc913225c..a43479c3ff03 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2651,7 +2651,7 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f);
 
 	v4l2_info(sd, "SDP: free run: %s\n",
-		(sdp_read(sd, 0x56) & 0x01) ? "on" : "off");
+		str_on_off(sdp_read(sd, 0x56) & 0x01));
 	v4l2_info(sd, "SDP: %s\n", sdp_signal_detected ?
 		"valid SD/PR signal detected" : "invalid/no signal");
 	if (sdp_signal_detected) {
@@ -2676,7 +2676,7 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "SDP: %s\n",
 			(sdp_read(sd, 0x57) & 0x08) ? "Interlaced" : "Progressive");
 		v4l2_info(sd, "SDP: deinterlacer %s\n",
-			(sdp_read(sd, 0x12) & 0x08) ? "enabled" : "disabled");
+			str_enabled_disabled(sdp_read(sd, 0x12) & 0x08));
 		v4l2_info(sd, "SDP: csc %s mode\n",
 			(sdp_io_read(sd, 0xe0) & 0x40) ? "auto" : "manual");
 	}
@@ -2727,15 +2727,13 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "HDMI/DVI-D port selected: %s\n",
 			state->hdmi_port_a ? "A" : "B");
 	v4l2_info(sd, "EDID A %s, B %s\n",
-		  ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
-		  "enabled" : "disabled",
-		  ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
-		  "enabled" : "disabled");
+		  str_enabled_disabled((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)),
+		  str_enabled_disabled((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)));
 	v4l2_info(sd, "HPD A %s, B %s\n",
-		  reg_io_0x21 & 0x02 ? "enabled" : "disabled",
-		  reg_io_0x21 & 0x01 ? "enabled" : "disabled");
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x21 & 0x02),
+		  str_enabled_disabled(reg_io_0x21 & 0x01));
+	v4l2_info(sd, "CEC: %s\n",
+		  str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		int i;
 
@@ -2751,21 +2749,21 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Signal status-----\n");
 	if (state->hdmi_port_a) {
 		v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			  io_read(sd, 0x6f) & 0x02 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x02));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x02) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x02));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x20) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x20));
 	} else {
 		v4l2_info(sd, "Cable detected (+5V power):%s\n",
-			  io_read(sd, 0x6f) & 0x01 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x01));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x01) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x01));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x10) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x10));
 	}
 	v4l2_info(sd, "CP free run: %s\n",
-		  (!!(cp_read(sd, 0xff) & 0x10) ? "on" : "off"));
+		  str_on_off(cp_read(sd, 0xff) & 0x10));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
 		  (io_read(sd, 0x01) & 0x70) >> 4);
@@ -2809,7 +2807,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 		  (reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
 		  (((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 			"(16-235)" : "(0-255)",
-		  (reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x02 & 0x08));
 	v4l2_info(sd, "Color space conversion: %s\n",
 		  csc_coeff_sel_rb[cp_read(sd, 0xf4) >> 4]);
 
@@ -2818,9 +2816,9 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			(hdmi_read(sd, 0x05) & 0x40) ? "true" : "false");
+			str_true_false(hdmi_read(sd, 0x05) & 0x40));
 	v4l2_info(sd, "HDCP keys read: %s%s\n",
-			(hdmi_read(sd, 0x04) & 0x20) ? "yes" : "no",
+			str_yes_no(hdmi_read(sd, 0x04) & 0x20),
 			(hdmi_read(sd, 0x04) & 0x10) ? "ERROR" : "");
 	if (!is_hdmi(sd))
 		return 0;
@@ -2840,7 +2838,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 			(hdmi_read(sd, 0x5e) << 8) +
 			hdmi_read(sd, 0x5f));
 	v4l2_info(sd, "AV Mute: %s\n",
-			(hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+			str_on_off(hdmi_read(sd, 0x04) & 0x40));
 	v4l2_info(sd, "Deep color mode: %s\n",
 			deep_color_mode_txt[hdmi_read(sd, 0x0b) >> 6]);
 

-- 
2.46.1.824.gd892dcdcdd-goog

