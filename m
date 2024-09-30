Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CDE98B041
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkc5QM5z3cC6
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697882;
	cv=none; b=SLUxRzIl0mvxH2kveRp7SPR/P3g8oLYqnPQSJhHD2raUCHARXrNbwjFnys4/E+tUY7A9ZCWeW5aKHvEn4MkEa2LyTC1SDh1vsltwezHnwtBB/2x31yUsOXILWKUNVO5bBEOtLmAp5vxKLNMWsFThUzq543NA62k45J+o/RW9Q9G6zFF9tVrYA/GEoxq2RsfmgCOY0Fp1K6yx0B8LiBFhivm7F2H5TozBUfSEgedvvlYOTpbNzvAZruiMQSPq2k5bXkUO5qVq+90ikvNhSntf6jyMFy7Yhawi+7GIPvxMoTUfpdntcfsDbD+cu4WXhpSOsgUoHZpVXYQXwRIEX7Q1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697882; c=relaxed/relaxed;
	bh=qO3qqbTfvsnj8f4B9o9/p9r5ocz9pMXhz3VcGEq7myc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEWnnh4/Ea1kSq8JvZzOre4MYKdkVLKWCXljnFcoy8S1HPYhL7TivGDoB9Ktfy2JAPEchbHl83+fSSiT7i2bCIdWJCe+oaUl6SmqmE6Cv63DKfEpSvhBVr1+dzYYjOtts4utyCov9BzL15AtptASCNEzAChgl4MiuIN4hk1IxeADPmsaaNis+BmIL9TzDpyBYI9A0ED6dfQ/0+ilcxdQ91n2QnaMM6ZuCFBmvHw5NQ/RFLOTPreQivClT9kcgzVZvOvsvyiEzxq2KtTnTCTqR/qD+hSyfUhj1Z5ggm8LDjTeKvDTWcUDvUKS/8dtY6Z/7uI2rSgAvamcR5QbSmDAtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XbgREm59; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XbgREm59;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWG28cbz2yWr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:42 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6cb4f1137a8so13029286d6.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697880; x=1728302680; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qO3qqbTfvsnj8f4B9o9/p9r5ocz9pMXhz3VcGEq7myc=;
        b=XbgREm59VcH/X+LqNq01x3oiS3M7ui5SslTAy2q/b2e9PRrvHpUzscdd4FXmPviLGN
         qCnavPV0ZadQeGeU09ZJz2LkZmisLuHzmHC9hqlKeKkB6YmqPXV8s2uRWyFlMW+eYusA
         D1RmugkxYpp7H7wqOPxpCMvZyVARIoOg15xNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697880; x=1728302680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO3qqbTfvsnj8f4B9o9/p9r5ocz9pMXhz3VcGEq7myc=;
        b=vWnC4kQvmdudX/rBXeJr96Mxfa+GhkvazlHNHE3f+2C0cYL3lkTGic7zvw1cb8hbZM
         lzoJZtl7PTM5m90rKOUAQgwLunV39NGyKnhdX6DYKlayLxBFbXr1mLUyrJWaoLegvPNG
         JZb8y+AgsSU3BvMr3wCLWMP0InEGnctvl2EzY78IKmB8x3KDlL2HWwoWBjG0qXJjyILh
         xd/R9WZO+mBlCVuobbPe/x0tbeeyPIlrgrZ/T5Gaq4TB7PvXcOWBLAs8oDVKCht0vPRH
         360pSqaQdIdeIWDo/T/v/Q2jcfC3awXQz+EN+LUjELIaEw90yBGuN5rQTZlBWB2NTzg3
         +xnw==
X-Forwarded-Encrypted: i=1; AJvYcCXMm9llr/YyS+5BS1iaXd2g55273+zCFzHxW+scKW0qn/CxSfsZaQipiUZMzcxM7YKI7arZm2Uv90BcXrA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyP0hqql/aqseeWKciO38YQCHE89B5Tr8ZaitJzsmJGqDjYuoHA
	pjbQ6GL/eQ7VNMTQbMNchhDhpeoNRLypR3RcL81K/n8hc7FnZlOqZXbOe1oZcA==
X-Google-Smtp-Source: AGHT+IF/X+sGDFBK/b7MOemtir5qM4qeQwBGu/ooPVVD2yNCkIbVJsvPbz9WJQ+49WCJsrC1J8x5UQ==
X-Received: by 2002:a05:6214:4901:b0:6cb:4b47:e4a9 with SMTP id 6a1803df08f44-6cb4b47e5ffmr151055736d6.2.1727697880010;
        Mon, 30 Sep 2024 05:04:40 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:12 +0000
Subject: [PATCH 17/45] media: bttv: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-17-81e137456ce0@chromium.org>
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
drivers/media/pci/bt8xx/bttv-driver.c:2988:5-31: opportunity for str_yes_no(dstat & BT848_DSTATUS_HLOC)
drivers/media/pci/bt8xx/bttv-driver.c:2992:5-31: opportunity for str_yes_no(dstat & BT848_DSTATUS_PRES)
drivers/media/pci/bt8xx/bttv-cards.c:3039:13-22: opportunity for str_yes_no(has_radio)
drivers/media/pci/bt8xx/bttv-cards.c:3040:2-12: opportunity for str_yes_no(has_remote)
drivers/media/pci/bt8xx/bttv-cards.c:3043:2-21: opportunity for str_yes_no(has_tda9820_tda9821)
drivers/media/pci/bt8xx/bttv-cards.c:3044:2-17: opportunity for str_yes_no(is_capture_only)
drivers/media/pci/bt8xx/bttv-cards.c:3042:13-20: opportunity for str_yes_no(is_lr90)
drivers/media/pci/bt8xx/bttv-cards.c:4080:8-19: opportunity for str_yes_no(tuner_tv_fm)
drivers/media/pci/bt8xx/bttv-cards.c:3140:24-38: opportunity for str_yes_no(btv -> has_radio)
drivers/media/pci/bt8xx/bttv-cards.c:4081:8-23: opportunity for str_yes_no(btv -> has_remote)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/bt8xx/bttv-cards.c  | 16 ++++++++--------
 drivers/media/pci/bt8xx/bttv-driver.c |  6 ++----
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
index 867c1308de23..f989b5ed28fd 100644
--- a/drivers/media/pci/bt8xx/bttv-cards.c
+++ b/drivers/media/pci/bt8xx/bttv-cards.c
@@ -3036,12 +3036,12 @@ static void flyvideo_gpio(struct bttv *btv)
 		tuner_type = TUNER_ABSENT; /* No tuner present */
 
 	pr_info("%d: FlyVideo Radio=%s RemoteControl=%s Tuner=%d gpio=0x%06x\n",
-		btv->c.nr, has_radio ? "yes" : "no",
-		has_remote ? "yes" : "no", tuner_type, gpio);
+		btv->c.nr, str_yes_no(has_radio),
+		str_yes_no(has_remote), tuner_type, gpio);
 	pr_info("%d: FlyVideo  LR90=%s tda9821/tda9820=%s capture_only=%s\n",
-		btv->c.nr, is_lr90 ? "yes" : "no",
-		has_tda9820_tda9821 ? "yes" : "no",
-		is_capture_only ? "yes" : "no");
+		btv->c.nr, str_yes_no(is_lr90),
+		str_yes_no(has_tda9820_tda9821),
+		str_yes_no(is_capture_only));
 
 	if (tuner_type != UNSET) /* only set if known tuner autodetected, else let insmod option through */
 		btv->tuner_type = tuner_type;
@@ -3137,7 +3137,7 @@ static void miro_pinnacle_gpio(struct bttv *btv)
 		if (-1 != msp)
 			btv->c.type = BTTV_BOARD_PINNACLEPRO;
 		pr_info("%d: pinnacle/mt: id=%d info=\"%s\" radio=%s\n",
-			btv->c.nr, id, info, btv->has_radio ? "yes" : "no");
+			btv->c.nr, id, info, str_yes_no(btv->has_radio));
 		btv->tuner_type = TUNER_MT2032;
 	}
 }
@@ -4077,8 +4077,8 @@ static void avermedia_eeprom(struct bttv *btv)
 	} else
 		pr_cont("Unknown type");
 	pr_cont(" radio:%s remote control:%s\n",
-	       tuner_tv_fm     ? "yes" : "no",
-	       btv->has_remote ? "yes" : "no");
+	       str_yes_no(tuner_tv_fm),
+	       str_yes_no(btv->has_remote));
 }
 
 /*
diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 511f013cc338..fdad666d3d0f 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2985,12 +2985,10 @@ static irqreturn_t bttv_irq(int irq, void *dev_id)
 			bttv_print_irqbits(stat,astat);
 			if (stat & BT848_INT_HLOCK)
 				pr_cont("   HLOC => %s",
-					dstat & BT848_DSTATUS_HLOC
-					? "yes" : "no");
+					str_yes_no(dstat & BT848_DSTATUS_HLOC));
 			if (stat & BT848_INT_VPRES)
 				pr_cont("   PRES => %s",
-					dstat & BT848_DSTATUS_PRES
-					? "yes" : "no");
+					str_yes_no(dstat & BT848_DSTATUS_PRES));
 			if (stat & BT848_INT_FMTCHG)
 				pr_cont("   NUML => %s",
 					dstat & BT848_DSTATUS_NUML

-- 
2.46.1.824.gd892dcdcdd-goog

