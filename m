Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D33E798B045
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkf2C2Wz3g0H
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697890;
	cv=none; b=Jg7FN+sZG/H8BmYqTzxmTp4FOg60JS/O6rg+pYTGxhcNxQeRHKcp2ocZ4ujRf2aOvlyfFKIH4xRmNqkS5hXNpe8D3uJMX7Xm+z8TAA4hxuP7hyHPmvF4bIMhzIWzSkVpYrRxiNCPOqTfbsng+Cxap+DlNBdRLzuZY1bAr6a6Abdy/Vvp45ck4EKWee9gYEu8t/Jj2PmKodIpo+lLSNkj2zqCDeFe8gZhua8YiykAYMfK3R1Vo+mmYVjumRedxvY2Iq9DkmMm6swDTw5rMDQI0SqE8OhQNLonqhb9UF+L5sV3aX8/13X0wk2uekxlOBwpQBqu3qY5JkRi1MsEwQ2yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697890; c=relaxed/relaxed;
	bh=nZdkoyJRGbtYAtgWDyhzmqUrZ4ojuNTD42Wgr3aJHzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlR23alWVHBko2mEkYX9EPv71c5ZR3Iha0RV4peNCAAaKZ5FWoTr2JICyk2b1iQHKO2xRBpKvHwzOTWyqBVQ8r4xnOfF+jI9hsPAun65XOejHpprNT/2aSKllu/OZURJzRMtalsToQ5TmfCiGyrvrKb9Ca++tT7E1qcF/S4VOLDqFM/thP5nzVpSYmSkPCHfY7vFvZzUnfY+7+gBLPFo543CJmHPJL7zhVxkNA9hle3/XJKnag6GamfpNVITBYEgwZxf/vhd0xS4vgDSiYDRXl/VhsVucVQSnv0m8rFGSVuxkuV9IuSKe4mTjWuXY2iEHwl6r/wu1O1QbMOgZeRUWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TVMNO1WJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TVMNO1WJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWP6gjqz2yQn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:49 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6c3603292abso43945496d6.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697888; x=1728302688; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZdkoyJRGbtYAtgWDyhzmqUrZ4ojuNTD42Wgr3aJHzg=;
        b=TVMNO1WJ1c0PM/KZUE0X3qkX/ZWQ/rSjqltS7x9cKFfPQQ+rjbfMfFDzAo/t/1It2y
         +6sekS8mXP5+vsbokWxQFHWJef7QVHfe9h/VEaVt1quscdm2neKgGkMPODYy9iy9zv1n
         yoNPqUg62p+ijwNyzrksNhFkdEcns+CAe3FEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697888; x=1728302688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZdkoyJRGbtYAtgWDyhzmqUrZ4ojuNTD42Wgr3aJHzg=;
        b=eUQvnBVd1N4Yw1ff/Jqk6wQEObjgsK4sB5Gy6zn2vOxH+ArOrFjRKGwVSZmnBiCNWb
         zJ25PN+34jEeqmEnNIOvQb3qtuPjhj6HtYRoFcUjBO7TdouNz2rxuLYvsH9g69DTUuVz
         Pi8zfndOg7taiVZnH1u2T7orosVOaKshcFFuqZ5cGFt9febo9p4MyBiX/pPEgx/cacw8
         MzO+w0QR3ONaOujVko+wQIKpdyXZQHu2i87n7LoetnJ/z+tikIZfHmoMs965SCLRfY7G
         3ydtWPuR+3vMvILo16VGhNNyWX/aJSK45IhQkD+EbebEX1bzE51Bv5dvJTL4HwibbcRa
         HNtg==
X-Forwarded-Encrypted: i=1; AJvYcCXBxPsZ9wWJTv+yAkcW5qZ4AoNCaf7qWJKWdAc2uJCkeAjkn0lW6m28HEiDbtYODbTbm/zg0mUvygHHZZs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyyZK9SIvSa0ooFlUmvr9sHu3/XCSyxBEEjTk/GdSb2ovGQXjTM
	T17GRFtcS3TYoXHf+0/nJTR7fImsvHrqX9DAPcDZqzq59vRcH2OucD71cdQK1Q==
X-Google-Smtp-Source: AGHT+IGDig2qhJHVIgkos7cydvwLVCYXpIPoGe1fBfPazyzsBzvK7ByCA43K6ayYB6dav+TXdoGUKw==
X-Received: by 2002:a05:6214:4c03:b0:6cb:410a:ef5d with SMTP id 6a1803df08f44-6cb410af56bmr118016106d6.5.1727697887257;
        Mon, 30 Sep 2024 05:04:47 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:16 +0000
Subject: [PATCH 21/45] media: coda: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-21-81e137456ce0@chromium.org>
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

The following cocci warning is fixed:
drivers/media/platform/chips-media/coda/imx-vdoa.c:120:39-42: opportunity for str_write_read(val)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/chips-media/coda/imx-vdoa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers/media/platform/chips-media/coda/imx-vdoa.c
index c3561fcecb98..abdff181d417 100644
--- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
+++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "imx-vdoa.h"
 
@@ -117,7 +118,7 @@ static irqreturn_t vdoa_irq_handler(int irq, void *data)
 	writel(val, vdoa->regs + VDOAIST);
 	if (val & VDOAIST_TERR) {
 		val = readl(vdoa->regs + VDOASR) & VDOASR_ERRW;
-		dev_err(vdoa->dev, "AXI %s error\n", val ? "write" : "read");
+		dev_err(vdoa->dev, "AXI %s error\n", str_write_read(val));
 	} else if (!(val & VDOAIST_EOT)) {
 		dev_warn(vdoa->dev, "Spurious interrupt\n");
 	}

-- 
2.46.1.824.gd892dcdcdd-goog

