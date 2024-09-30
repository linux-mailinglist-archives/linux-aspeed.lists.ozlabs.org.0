Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80898B055
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkl6mW5z3gCv
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697920;
	cv=none; b=m5uGaM0uYSnZiyWNDTUFnOrzOiAcIPnoJpmg/+UoR630/k5BBBVblCTyqzPDYi72lgRSYV7/UP5we0ZLIYcqVK1f/cEU9fXv4Pf19bNyODwCBRxdnuCyKefi1/qsn7Rp0iTqtMjPCySjbSAmE2Saphw8E+Fz/+GhYzZeYduwguFwMiVxS5N/GR99ZIsIcullpmYl0R9PnIx5Xe0V3ay0yAnG8AtVd9SFh/0BCoZk6FGOCYzjQClwdZ/fFKRpDaDoyGordDRgwmjsUMVpjm90D7Ci1KkCaO6c6XlvfKmBwYxVqSyZBuCSno9s9n258XxtpI99EVcR/v+ri++dDt2rug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697920; c=relaxed/relaxed;
	bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nb5BWFzyPIoYDsGDK5bL2TU8JfhdOeNawd5TGiEbrfbNuxQQgcAS49wADd0egFesaGdKM106evoGRbU+rvmqWZ/4v/9iMOIosMysMxaEYd6x2bltyUo9dcUc9jxub36CmbuLqS8ScG7dKfVcDXeRW1rJ56CDqKL8Y9YZjPnpJ7iH91o/sAGteXAzoHUuUE6JV3hH+1d4tFyldGn1hQgyuwjgZCDq0KDDuHXH5Zm7TsWjhJ2BPGFlWssAl+jDbfTXfxXRXyMG/DvhbKm3xW3VbBVm4fXwjNtukVgEpN8C1Fo8cnXcJWFRWhOCbTQZXd1ngg3ok3puhchi10ipONqvUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hOXLN/A/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hOXLN/A/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKX01yC0z2ysh
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:05:20 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-71116d8504bso2652393a34.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697917; x=1728302717; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=hOXLN/A/Y8xWFya1600r+jz20YJscZJOAq8TL8UVGiMhhQbhtEqgp7oCk4AdfeS7hk
         LcxTGnHfeSAm1RpV0r3nd6VQ+3VJM6oHFKSVHIwJ/6SrA7L1xxVpwCE/C8O2WCYtXb5I
         0jk/d2+dbrwQ/ZJMvYLPwVi5kzTVwFdTL6dXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697917; x=1728302717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=Y3k6qTfa5I7OjNDF7X8oAKB4WQ5p/xrPYu2ffwq/9jkQt/0EFmFf81Ufl/k5wvlxM6
         srX40N2Sbp73q/8yIOfPwEyMf2Z9mZmFHF9VtilCdYuBZQP0/TqXahA2vnlCNlcG1LJT
         OAvpAM1YkG2dTg7eijOc3flQRJZ0MsBrxKoNJWQ25WgUxhYl2qXwcmNd4sywyNSEsPLQ
         mf8i1KHKX3utUnxqw8Ijm0TEartFpyJCfQ7Ybm8VpbAyoRGq3zvDGU5F8APE/K2Ec+D8
         cYDv66EJjvF+X2QbLNBmtyv5q8Rwgj7RA+8Wlfovvb/YJFPPGHcCPsyoZIZJjB0kmLD3
         dkwA==
X-Forwarded-Encrypted: i=1; AJvYcCXD+bEsdVSMApXbvSnpeRJxFT6NKy2OrIDz2R7JhD28tapEjOpuAueo/TqVpn0c42Oe7XueD484GLJWDkk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHNfZU97qdAv1Rp5HgN+zkvXENR8DKTlngEkhvhvzlcVyPcBF8
	HF9/MS7SAAmnvCxJsZp9aWqEuroX11z4ndBgGAaRtiLqDdT+0jM1c9va2FGltw==
X-Google-Smtp-Source: AGHT+IEsGDncZXqIOKaIooO2hw5tICb0OJqubpFFkQiHlkBn39PImu6hgDgqbreQ/CasmuZpa2D32A==
X-Received: by 2002:a05:6358:5288:b0:1ba:580e:dea2 with SMTP id e5c5f4694b2df-1becbc86414mr292235955d.17.1727697917163;
        Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:32 +0000
Subject: [PATCH 37/45] media: i2c: msp3400: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-37-81e137456ce0@chromium.org>
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
drivers/media/i2c/msp3400-driver.c:341:4-21: opportunity for str_on_off(state -> muted -> val)
drivers/media/i2c/msp3400-driver.c:342:4-27: opportunity for str_yes_no(state -> scan_in_progress)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/msp3400-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..c7807b17add9 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -338,8 +338,8 @@ static int msp_s_ctrl(struct v4l2_ctrl *ctrl)
 			val = (val * 0x7f / 65535) << 8;
 
 		dev_dbg_lvl(&client->dev, 1, msp_debug, "mute=%s scanning=%s volume=%d\n",
-				state->muted->val ? "on" : "off",
-				state->scan_in_progress ? "yes" : "no",
+				str_on_off(state->muted->val),
+				str_yes_no(state->scan_in_progress),
 				state->volume->val);
 
 		msp_write_dsp(client, 0x0000, val);

-- 
2.46.1.824.gd892dcdcdd-goog

