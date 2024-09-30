Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604998B034
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkX1LmBz3fV3
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697853;
	cv=none; b=OjOBzGETvImAdNres6F2iLUHGgKp4mPotqvFju6+oazWmHQAhZyqW46V7N3igcQLTm8HLcF/FZnqx23b/1RcTKDArqqluFusfN7lhrZPyyZ2yVL97q3mxS7mxj/PvvVUN1j+WdI9WgPCt89ifaEbc0+oXkpNMHqALMWTy+J4HVoDFtahbZztFtBEtXOpJzzs7cxTkaHYheaMW03EvdCBVNlyuQ5qiQSeR7ph8POHuNR/YSilznmdjy35Ihcug6DhIdbSBO4iCywVuDCGnUOMcDmvUDSZQI8dtj4vMgUT2qLaiCpssoNb1P1NEHyq240sZSAoXGxod0i0zQhbN5V49g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697853; c=relaxed/relaxed;
	bh=uHKPhMgVbBroKUSOZVkcpmjIQRoUB/Pllvr3HK97AsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bq9QKGilrzJuHcY3/ye/DsvQ+qwDgDzTiWHqf+yxkQljy3zoYK86K+Yc8fIujJnqb2mCXQTJ4x+PWNFYsOgIGUFB4CNYBaszZJeOX0ey/u5c2h40XzN9VuMmxe/ZNsgkJuI5TYdLs57hcyyz8Yu9nc/Y9VWcU6FswkGUA9PaR7qcCJud7NUMVPru9fKO6XhngKlxXsNccg0DFWocJTpOxjuD24uyse50ezoQAYo+NhnBuKwn0XWNbF+13+AKiZBSSjkRbdvkA/4s566fad21zh1u78J2Ig9N+g1MPKALRzZXv/udUpuZrqmNTEBu9D1y6aFmgj0RiHzGgZteGHQnbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AwQzxELX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AwQzxELX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVj0Sknz2yRC
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:13 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6cb2f272f8bso40059426d6.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697851; x=1728302651; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHKPhMgVbBroKUSOZVkcpmjIQRoUB/Pllvr3HK97AsI=;
        b=AwQzxELXrT6clzLq2RFdwbNxAgZFrd7pYftXf+DmjppHF+b6Yt7xTyW89AS4A/Gq90
         bT3bKZIlvoVdP1W/0houvwoem5CojSxW/gH49Z59bdU0P/BeFeJ8gCHv0nZWc1LxmRAP
         lAC2HvCaz+HXmy5En4qvegoPkpKjTugignlP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697851; x=1728302651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHKPhMgVbBroKUSOZVkcpmjIQRoUB/Pllvr3HK97AsI=;
        b=BieWbYZOPArWP/X+BBkj/iOFx1on8lCbRsnhVmEWV8E43/iS2gKrx/oBq/7H/M4N3G
         JDkYbE6P0EohitI9n95b3jSPSOOsLJJ9PBEUadN9Sy5rGiiNOfiSHgGHqHYo3cysyx1K
         gGKnDPTnzJskbs8yek1RIr8EPTR9AQKAPu2O7yH9bgHpr9we1myOaIg/yXQINfMSF2V3
         qgjLaRG3CfuOXiaRaa33njmenpJn1ZmzvjdLCefD8cT72by/w2gE+XI47+bARz/rqpba
         tZ7gJMT5JKavsfo1vNT+7pOIC26/U/EiHNP/rwSfUgKQ5uN2wX/1k6QxulVdTpk7wJoz
         tWhw==
X-Forwarded-Encrypted: i=1; AJvYcCWVTDzVITgtzw71cBTcl7Y17UmVHWMtdmTpDuQuSCCPkaIw9LD1NmyKeNTENzJgKqny2LJrH4rpz6CRxqY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YymT+C0C1xMS8Es0iqkqmKg7y/HpWcJOaCyNjD8ZupiXzVhzt8b
	BG3/9qKVpcbzvDFkfw3S2EiZOVM1CX6LN2XBtE8Z5mgp9A0Bp/R8oLaTAa4joA==
X-Google-Smtp-Source: AGHT+IEk2U+7gH+P0zkQD3jLvaacsDuUtudGo2qx4V1eWgV4awKOL7SjyupKFoxi8Ld99dzK+gKdEQ==
X-Received: by 2002:a05:6214:4a89:b0:6cb:2adf:751e with SMTP id 6a1803df08f44-6cb3b646986mr155979836d6.31.1727697850717;
        Mon, 30 Sep 2024 05:04:10 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:59 +0000
Subject: [PATCH 04/45] media: pwc-ctl: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-4-81e137456ce0@chromium.org>
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
drivers/media/usb/pwc/pwc-ctrl.c:492:5-10: opportunity for str_on_off(power)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pwc/pwc-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-ctrl.c b/drivers/media/usb/pwc/pwc-ctrl.c
index cff64d872058..a1b4eeb41cfe 100644
--- a/drivers/media/usb/pwc/pwc-ctrl.c
+++ b/drivers/media/usb/pwc/pwc-ctrl.c
@@ -489,7 +489,7 @@ void pwc_camera_power(struct pwc_device *pdev, int power)
 		SET_POWER_SAVE_MODE_FORMATTER, pdev->ctrl_buf, 1);
 	if (r < 0)
 		PWC_ERROR("Failed to power %s camera (%d)\n",
-			  power ? "on" : "off", r);
+			  str_on_off(power), r);
 }
 
 int pwc_set_leds(struct pwc_device *pdev, int on_value, int off_value)

-- 
2.46.1.824.gd892dcdcdd-goog

