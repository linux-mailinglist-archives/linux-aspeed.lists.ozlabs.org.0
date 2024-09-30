Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1561798B03A
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkZ1KPFz3dWb
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::729"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697866;
	cv=none; b=Igykn4MQjr4im/PIFpkJ7L0fsoAtq1ripHzYls2vTTgzey9B4gxylAv6utnWEKVrTf8CzL7Pdula5MMz1XkIQyHKjDqvsutaFe/ZXkixVeRigvr/CRDtX1Eh/pP9VDDiZd0lJe3753EbDh+gZnHB+ztt4KXDZa9rZkj1Jc+bzOgpZx33A7iQbWRXjAJwzWQyY0BzAQl1GQWO+j8Ecu0UpgaliQHJf+3MKtYS12DcbInCKxFUN41NHLyI2PTyko8nBSUKZCbfIT1wHJLV0WFVqKdn3HpJJCikkHV9BjX2rD4R+fdsyVIVQY+PxkM/7Fk2FGfNBeX/OiUGeFhHLV+JBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697866; c=relaxed/relaxed;
	bh=42a4vpn3QTtS0EhgGJlcs62eAaEwJVXQ21s4ykHFIBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdMu72aktSMDvZZgOd7HQnLc6I2CdKB1b0C01c7EmBjD9DUrwbHyw/w6+PCQsUuRzqR5rTaI4KPOX2sqwa4HsuT/h3zXNnlG+XlTcrqmLN2EONv6UQx4zVKhPu0fLq3R7sW9ZUHqvNr4gzwK020G/JZ9OV/OnmRhej0L6RCNsyf7CQoc3pLMKC69KsenN1CS3Z4H1VbeM/2m//g6w1hPczuM4gAjjx51P7qrBiFXXCv31JjnKw0m0B6vUl+tZnqhixUYOkvkXy1IcBNlEelWyDAuV0PdCEkDgR7c0esoVIsM/1Ivb93drM3mZ8Yz4vCCqH9jI91YoGgdICfMtWwe2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nTAoH9w9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nTAoH9w9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKVy1cmLz2yQL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:26 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7a9af813f6cso405577285a.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697863; x=1728302663; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42a4vpn3QTtS0EhgGJlcs62eAaEwJVXQ21s4ykHFIBI=;
        b=nTAoH9w9SwuOajEwufTmsiFD7zG665bYn/SvCF+jILhF21LIFe91u3TpioKMKIdSXZ
         En5ZG4Px+ftyNf7FDq3rpVGS/YjK5Wqc2RgeVjpkg81AHARF0wOjHpOfrNZNaBRqEatu
         A6U9drSZQJcnafcenj2sLnHxm3aQ/SZMZnMLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697863; x=1728302663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42a4vpn3QTtS0EhgGJlcs62eAaEwJVXQ21s4ykHFIBI=;
        b=JswyOO/sckyb8UsNPSE8JHb+3MfcG2Aq/b/UeNWFuKP9FUrgHBQJWJKcxUt9xlYOZf
         YV8qDQRwo+A9Ja8dZiKfgCdmzm1KOyOnPPT5Mq6irGsMueCObQTWY0dNgZlhQcIX8T+9
         e57jwZTIfLY9wNJ3U/ak9nwB8EU5KXVlTYFVNv94aGE8OG640OWKsGb0hqQekyNKrKYC
         JWHTRewGHWZb/isPjZPbfWt5JseF6ogCTsd+Rw/ZM4Aub9Iq6RffyjgUwwfqos7cA7Gg
         S3XbZnUn3ESySxl3jFtb1gXR1jraz0fPU/vHaaAHDR3Zos1eFp09w0oMtTSwBbJXfOpl
         jWFA==
X-Forwarded-Encrypted: i=1; AJvYcCX14J/5R5aAknjiLs9B2q7YnaS2W73MVbQUfQFsrxRtasXDB46ZSAs8Q7fiZzwH/O9yJFX3GwPdmAOiyOM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLi54jt/o4pfY+zmQ/YR0mX9TtqitUgR1fzfIWHeARzmLq96ph
	s//ZxA/qkzXI8wPsushy2lgPpeTawivaBvBFbLPoxI351qjr92c98wZAe6TFiA==
X-Google-Smtp-Source: AGHT+IFlDabMazwXnqk+xIMlKgzFONIbVzdm9vY20CpqT4dLcojtxwjmPMueB5KKSCBhlfp1Ts2Ejw==
X-Received: by 2002:a05:6214:460f:b0:6c3:5ebb:9526 with SMTP id 6a1803df08f44-6cb3b5f2d1bmr196194196d6.29.1727697863111;
        Mon, 30 Sep 2024 05:04:23 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:05 +0000
Subject: [PATCH 10/45] media: tuners: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-10-81e137456ce0@chromium.org>
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
drivers/media/tuners/tda18250.c:110:3-12: opportunity for str_true_false(triggered)
drivers/media/tuners/tda9887.c:296:39-54: opportunity for str_high_low(( buf [ 0 ] & 0x20 ))
drivers/media/tuners/tda9887.c:298:39-54: opportunity for str_high_low(( buf [ 0 ] & 0x80 ))
drivers/media/tuners/tda9887.c:294:39-54: opportunity for str_yes_no(( buf [ 0 ] & 0x01 ))
drivers/media/tuners/tda9887.c:347:5-20: opportunity for str_yes_no(( buf [ 1 ] & 0x02 ))
drivers/media/tuners/tda9887.c:353:5-20: opportunity for str_yes_no(( buf [ 1 ] & 0x20 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/tuners/tda18250.c |  2 +-
 drivers/media/tuners/tda9887.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18250.c
index 68d0275f29e1..853600c80839 100644
--- a/drivers/media/tuners/tda18250.c
+++ b/drivers/media/tuners/tda18250.c
@@ -107,7 +107,7 @@ static int tda18250_wait_for_irq(struct dvb_frontend *fe,
 	dev_dbg(&client->dev, "waited IRQ (0x%02x) %d ms, triggered: %s", irq,
 			jiffies_to_msecs(jiffies) -
 			(jiffies_to_msecs(timeout) - maxwait),
-			triggered ? "true" : "false");
+			str_true_false(triggered));
 
 	if (!triggered)
 		return -ETIMEDOUT;
diff --git a/drivers/media/tuners/tda9887.c b/drivers/media/tuners/tda9887.c
index b2f7054c1832..f403dcf14aa0 100644
--- a/drivers/media/tuners/tda9887.c
+++ b/drivers/media/tuners/tda9887.c
@@ -291,11 +291,11 @@ static void dump_read_message(struct dvb_frontend *fe, unsigned char *buf)
 		"+ 12.5 kHz",
 	};
 	tuner_info("read: 0x%2x\n", buf[0]);
-	tuner_info("  after power on : %s\n", (buf[0] & 0x01) ? "yes" : "no");
+	tuner_info("  after power on : %s\n", str_yes_no(buf[0] & 0x01));
 	tuner_info("  afc            : %s\n", afc[(buf[0] >> 1) & 0x0f]);
-	tuner_info("  fmif level     : %s\n", (buf[0] & 0x20) ? "high" : "low");
+	tuner_info("  fmif level     : %s\n", str_high_low(buf[0] & 0x20));
 	tuner_info("  afc window     : %s\n", (buf[0] & 0x40) ? "in" : "out");
-	tuner_info("  vfi level      : %s\n", (buf[0] & 0x80) ? "high" : "low");
+	tuner_info("  vfi level      : %s\n", str_high_low(buf[0] & 0x80));
 }
 
 static void dump_write_message(struct dvb_frontend *fe, unsigned char *buf)
@@ -344,13 +344,13 @@ static void dump_write_message(struct dvb_frontend *fe, unsigned char *buf)
 	tuner_info("  B0   video mode      : %s\n",
 		   (buf[1] & 0x01) ? "video trap" : "sound trap");
 	tuner_info("  B1   auto mute fm    : %s\n",
-		   (buf[1] & 0x02) ? "yes" : "no");
+		   str_yes_no(buf[1] & 0x02));
 	tuner_info("  B2   carrier mode    : %s\n",
 		   (buf[1] & 0x04) ? "QSS" : "Intercarrier");
 	tuner_info("  B3-4 tv sound/radio  : %s\n",
 		   sound[(buf[1] & 0x18) >> 3]);
 	tuner_info("  B5   force mute audio: %s\n",
-		   (buf[1] & 0x20) ? "yes" : "no");
+		   str_yes_no(buf[1] & 0x20));
 	tuner_info("  B6   output port 1   : %s\n",
 		   (buf[1] & 0x40) ? "high (inactive)" : "low (active)");
 	tuner_info("  B7   output port 2   : %s\n",

-- 
2.46.1.824.gd892dcdcdd-goog

