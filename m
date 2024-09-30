Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B565998B042
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkd0rgfz3fww
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697885;
	cv=none; b=cZtRDjnBSmRGO1HK7m7x0GEhfeF7jzc50dsTW2oyebIDK4cYuDuqSB5BNoHVvBLrhRr4rt1sqksssx6ajbVoyXTjiA0uc2t/36G1ci5gf0M92dT4POgpMgZn379162QGxs1T2p9Am4s/3swnAI0UcM9Nn2cpspFu+bZpROZtOKvDJZrwyqXkZ/QhSrfls9znR/5BwZy7tlfUjz7x194sHzo7L1TqK0NkVZwG780+HV+gavwJuQm61TjFv6cstmE1p5njrLct59RygRLJUKunVOMshuEEiePB4sUNF+ziicWjUCrqK74c7AbVqRovgbsqv9wc1+AsUumuCwJgNKL8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697885; c=relaxed/relaxed;
	bh=+JjigCj7wmiDgTIVi8lxvvE6Xnwp6vOIIL7mEoeKjLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koygcX5nWBkasujS6eFp5m/Jvxg7Rnovxyi1UZA7Vc0UWAKw67afNtFnYplky/qQmpjXJORChLdBRsDjINf8LtaoUBaXymLPI0NhbSue4FRfiX1es9FiRJHW2C9wJZAXR/2FIRGVOgLJ45A6/tIGHCLiUVQpLCVCuYhubqpTJ1DCyUqR0aSM40qyardtfYl4aISYTdVK0ctspppcX11wqTAI8gIDl8AH96669LdiURH6TdWeOyWitZ4UVfH6+nV+b2Bm+ND1k4ZidhfVdOdgvmSL4bQe4ux+O1PWtjlnmO1BxCFBz+djGt8oMuyZZpkXt2LL2svUILZXMjN/04Qy2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gjV4Bk+z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gjV4Bk+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWJ6ZGzz2yY1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:44 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5e1baf0f764so1288412eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697882; x=1728302682; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JjigCj7wmiDgTIVi8lxvvE6Xnwp6vOIIL7mEoeKjLo=;
        b=gjV4Bk+zd+feHgFPMMsBIH35hd7da2QYZeAbMUzy9znNkxHg7Hz5FlA/INd66SV6sG
         YuY6U3UGVOHMJDz4npdXv6c5I7MdpzbEgb4oV4iQCxq1ID+t8VGYlCecsXYQZTBeTNYu
         yO4EnobTX2nK1Ha3c6iw7SfSWO0dKWBMU8YJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697882; x=1728302682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JjigCj7wmiDgTIVi8lxvvE6Xnwp6vOIIL7mEoeKjLo=;
        b=EJfcNapGkG/5WK8m68nQwVV7nxhr27eYMQ2xp0rVJdAc7awQnLdyZlBpVbQDC2h8PI
         8JB6VKBZSBI7AutT/noW/AdCsXh9GGOZh6TtTzrCZQL9sqwRmCAQWfdTdBVBW8mfo+uJ
         ELhIUruwcTdaXjg6JYkM2PKFQJHoGuhRA0qp5O2WmJaRz6BAiNWaiWEMnj14uvohFJ6C
         ReLW5eK3L8sSEgFswQqvIQqrGqcfTdqazego7zA9VCn97tyVq2fuJwW/TZdpUpcnAqVG
         xzHhM93ZymK/e++g9SjlaEZw8umHGZ7a1GMU1mVYOHk1Vic/btqVw4+rfsBHf/pmSdU9
         gxag==
X-Forwarded-Encrypted: i=1; AJvYcCW1gq7ye66AmSftGjvKzp6kQPZ7j4nX36mQoFVAGGvWZHU8y85L5/8maz2JcKH8IDoHVhOjY8iegwqxGHo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUeR/YfCPCknjygMU2erCaLOqHow3G4dARDEw0Pf9La0gpcv7T
	SGP18JPw3YbLpbhUDJk4dqidbE5UNS6S5AcHqqynVjhhtKLrrOh2ZwrA27Hwug==
X-Google-Smtp-Source: AGHT+IHorNkcL7CG7P94wqWnm5CxVPJz+Rc1wLbNEDwAbC1i2AVoPfjS6B+31QnhNxiGPZOH/d/JVQ==
X-Received: by 2002:a05:6359:4c9a:b0:1ad:10ff:341e with SMTP id e5c5f4694b2df-1becbb397e3mr239386155d.4.1727697882114;
        Mon, 30 Sep 2024 05:04:42 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:13 +0000
Subject: [PATCH 18/45] media: xilinx: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-18-81e137456ce0@chromium.org>
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
drivers/media/platform/xilinx/xilinx-csi2rxss.c:415:3-27: opportunity for str_true_false(data & XCSI_CLKINFR_STOP)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:409:3-24: opportunity for str_true_false(data & XCSI_CSR_RIPCD)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:407:3-23: opportunity for str_true_false(data & XCSI_CSR_SLBF)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:403:3-29: opportunity for str_true_false(data & XCSI_CSR_SPFIFOFULL)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:405:3-27: opportunity for str_true_false(data & XCSI_CSR_SPFIFONE)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:424:4-30: opportunity for str_true_false(data & XCSI_DLXINFR_SOTERR)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:425:4-34: opportunity for str_true_false(data & XCSI_DLXINFR_SOTSYNCERR)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:426:4-28: opportunity for str_true_false(data & XCSI_DLXINFR_STOP)
drivers/media/platform/xilinx/xilinx-csi2rxss.c:892:2-19: opportunity for str_enabled_disabled(xcsi2rxss -> en_vcx)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/xilinx/xilinx-csi2rxss.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index f953d5474ae0..7ddd9b265162 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -400,19 +400,19 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 	dev_info(dev, "***** Core Status *****\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CSR_OFFSET);
 	dev_info(dev, "Short Packet FIFO Full = %s\n",
-		 data & XCSI_CSR_SPFIFOFULL ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFOFULL));
 	dev_info(dev, "Short Packet FIFO Not Empty = %s\n",
-		 data & XCSI_CSR_SPFIFONE ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SPFIFONE));
 	dev_info(dev, "Stream line buffer full = %s\n",
-		 data & XCSI_CSR_SLBF ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_SLBF));
 	dev_info(dev, "Soft reset/Core disable in progress = %s\n",
-		 data & XCSI_CSR_RIPCD ? "true" : "false");
+		 str_true_false(data & XCSI_CSR_RIPCD));
 
 	/* Clk & Lane Info  */
 	dev_info(dev, "******** Clock Lane Info *********\n");
 	data = xcsi2rxss_read(xcsi2rxss, XCSI_CLKINFR_OFFSET);
 	dev_info(dev, "Clock Lane in Stop State = %s\n",
-		 data & XCSI_CLKINFR_STOP ? "true" : "false");
+		 str_true_false(data & XCSI_CLKINFR_STOP));
 
 	dev_info(dev, "******** Data Lane Info *********\n");
 	dev_info(dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\n");
@@ -421,9 +421,9 @@ static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
 		data = xcsi2rxss_read(xcsi2rxss, reg);
 
 		dev_info(dev, "%d\t%s\t\t%s\t\t%s\n", i,
-			 data & XCSI_DLXINFR_SOTERR ? "true" : "false",
-			 data & XCSI_DLXINFR_SOTSYNCERR ? "true" : "false",
-			 data & XCSI_DLXINFR_STOP ? "true" : "false");
+			 str_true_false(data & XCSI_DLXINFR_SOTERR),
+			 str_true_false(data & XCSI_DLXINFR_SOTSYNCERR),
+			 str_true_false(data & XCSI_DLXINFR_STOP));
 
 		reg += XCSI_NEXTREG_OFFSET;
 	}
@@ -889,7 +889,7 @@ static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
 	fwnode_handle_put(ep);
 
 	dev_dbg(dev, "vcx %s, %u data lanes (%s), data type 0x%02x\n",
-		xcsi2rxss->en_vcx ? "enabled" : "disabled",
+		str_enabled_disabled(xcsi2rxss->en_vcx),
 		xcsi2rxss->max_num_lanes,
 		xcsi2rxss->enable_active_lanes ? "dynamic" : "static",
 		xcsi2rxss->datatype);

-- 
2.46.1.824.gd892dcdcdd-goog

