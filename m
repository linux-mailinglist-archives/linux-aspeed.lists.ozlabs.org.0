Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA04C98B04C
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkh65KNz3g5S
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::735"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697903;
	cv=none; b=MqFRENeJaPf+KClNM6bt6ELcvXOtqaMYYEvUPPBY3nZq8u5rYXzfstp7YBIc6otiPjjaTAVKM/DIjtdBzdvt/vuoXZIjGwhr1rAUwbm8OyKmNLHFynx10kZwpTI4h5Jyp4UwMlZ0dn2H9QzOK3BwAOC1SwMdtFnTmLiJqRATdTuUuuwha6CrdjZpELv7jhWnqI96oUVihgP0sIbGKxvjB+prDYhJT0pkovRwAS43pzpdPGBckCOatfNtwlRyeevRcn13HKs4G+AmD3JekyLCDH1qkLyslT/HvuNuJTrDLPGPVJ25VV5/uGFRLx/zhGMhpLx5bRDuN2XWHGa1jRvtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697903; c=relaxed/relaxed;
	bh=ZtS18Z/ph+22OpFMjBj6PDOp8BDjMiQU1mRrp+tqPao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9uGuwLwvV81kygPxUw6GHwFJ09WeLSOzLx0cZMv1+921COhTYThwbG683mjKJkLXw/isKH9sT5yWEas6aKY2Ofv69FlILfX8Fvp43uqVjStITTSaTXAKajbQnzFTSoSXI8Yn5BiA6GIfY3QVfb4DifYKMOCjqbMPO0KMLJTT6+6fyGtCXvmK6YIre1soQR1AKG6msxxtWnNVZoaRdfF9NwrI2VFAqNa+lgTiv3WO1OIpSxZRFxXneRz4ANaq9iSqMXpZRtsRjHmSnk2Hr8bQ0Q2tx0aLg9bkxyT8lsLrOdhaSiSH3tBI1jqBDrmlbj9P8FbWsDVjQpKYXESNuh7KA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W3F+YbWE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W3F+YbWE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWf4Z0Gz2ykx
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:02 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7a99e4417c3so373727285a.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697900; x=1728302700; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtS18Z/ph+22OpFMjBj6PDOp8BDjMiQU1mRrp+tqPao=;
        b=W3F+YbWE44qtp73UA9Vey0OapWjVU4Y0eUH+5J349BjW+2BWQ5K8XAU9Bs3J9xaUn6
         K8+qPkib4+yXEz4u5qmbYjWY910GKnFdelHzTPY1kb13vk+4rnWbqZKRXasy60Ef+hEe
         BWV/nbh468J6SaNhvez+bpjcvXP2cisNyuTVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697900; x=1728302700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtS18Z/ph+22OpFMjBj6PDOp8BDjMiQU1mRrp+tqPao=;
        b=pln1pJvAHiQNqLTQqTN0rbaVIE1o/NST35WDW+4l9jrIqfdl2yFDYZIqT7DUOI3qHZ
         OOGTI8BsLaiewONM2BnLCEnfTd28HOIYlaRlQ/1AEwhS0HW0FhaZjW6h7wfVs7o0j5VL
         wSWeDfWYlZ33oaNcbe/XPanygLLp2TBuwIWID2UGUOl8UnXKPbNrQvmChdwInpyAoMtL
         6c8qctpnJKWMvjvazy7PIvlvyuF4F0TzduS9bMLvm9nXTduLvNmlaThmmLH5zXZaSSKe
         iFn758TDPQYKLBZ62pFAEL0QQ/zcEHvlhBHP5RFyFTS9CmdJXihCORJ6WjchOTRENHct
         GgjQ==
X-Forwarded-Encrypted: i=1; AJvYcCViVaakcj856sIVzPNNQmaa1S1m8Cz07gQMF/PSZf2fU6k59BRD+WDqGQxIToBWrAZh2yyCQw3rF+92S3k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEu0a3cXYzfwkmuRnmYtYnAjNDfXzd26qxunJkggymPCxUIKlR
	raLe8iXkmefBewhA8YiALVZKeJbpTlfRBggaY0IsU02gI0zxIhdYO79t3djBmw==
X-Google-Smtp-Source: AGHT+IHa6kByUW3tXKJTo1om4uBb1NLh+sbjdquYal1McTRlR2Y5X69QcY3HAZ4VU5M0CeLNOC2NrA==
X-Received: by 2002:a05:6214:448c:b0:6c4:6217:da9c with SMTP id 6a1803df08f44-6cb3b5da202mr213240066d6.17.1727697900493;
        Mon, 30 Sep 2024 05:05:00 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:23 +0000
Subject: [PATCH 28/45] media: b2c2: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-28-81e137456ce0@chromium.org>
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
drivers/media/common/b2c2/flexcop-hw-filter.c:119:20-25: opportunity for str_on_off(onoff)
drivers/media/common/b2c2/flexcop-hw-filter.c:12:35-40: opportunity for str_on_off(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/b2c2/flexcop-hw-filter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop-hw-filter.c b/drivers/media/common/b2c2/flexcop-hw-filter.c
index c5a3345c99e9..d64a03452e22 100644
--- a/drivers/media/common/b2c2/flexcop-hw-filter.c
+++ b/drivers/media/common/b2c2/flexcop-hw-filter.c
@@ -9,7 +9,7 @@
 static void flexcop_rcv_data_ctrl(struct flexcop_device *fc, int onoff)
 {
 	flexcop_set_ibi_value(ctrl_208, Rcv_Data_sig, onoff);
-	deb_ts("rcv_data is now: '%s'\n", onoff ? "on" : "off");
+	deb_ts("rcv_data is now: '%s'\n", str_on_off(onoff));
 }
 
 void flexcop_smc_ctrl(struct flexcop_device *fc, int onoff)
@@ -116,7 +116,7 @@ static void flexcop_pid_control(struct flexcop_device *fc,
 		return;
 
 	deb_ts("setting pid: %5d %04x at index %d '%s'\n",
-			pid, pid, index, onoff ? "on" : "off");
+			pid, pid, index, str_on_off(onoff));
 
 	/* First 6 can be buggy - skip over them if option set */
 	if (fc->skip_6_hw_pid_filter)

-- 
2.46.1.824.gd892dcdcdd-goog

